package com.niit.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.niit.dao.CategoryDao;
import com.niit.dao.ProductDao;
import com.niit.model.Category;
import com.niit.model.Product;

@Controller
@Transactional
public class ProductCategoryController {
	@Autowired
	ProductDao productdao;
	@Autowired
	CategoryDao categorydao;
	@Autowired
	HttpServletRequest request;

	@Autowired
	Product productBean;

	@RequestMapping(value = "/addproduct")
	public String showAddProduct(Model model) {
		List<Category> category = categorydao.retrieveAllCategory();
		model.addAttribute("cat", category);
		model.addAttribute("product", new Product());
		// System.out.println("category:" +category.iterator());
		return "AddProduct";

	}

	@RequestMapping(value = "/saveproduct", method = RequestMethod.POST, consumes = { MediaType.ALL_VALUE })
	public String saveProduct(@ModelAttribute("product") @Valid Product product, BindingResult result, Model model) {
		/*
		 * System.out.println("in product save conroller"); System.out.println(
		 * "Product : " + product.getPname() + " in the controller ");
		 * System.out.println("Category : " + product.getCategory().getCatname()
		 * + " " + product.getCategory().getCid());
		 */
		productBean = product;

		if (result.hasErrors()) {
			model.addAttribute("product", productBean);
			model.addAttribute("cat", categorydao.retrieveAllCategory());
			model.addAttribute("error", result.getAllErrors());
			return "AddProduct";

		}

		productdao.saveProduct(productBean);
		model.addAttribute("productImage",new Product());
		return "ImageUpload";
	}

	@RequestMapping(value = "/upload/image", method = RequestMethod.POST,consumes = {MediaType.ALL_VALUE})
	public String uploadImage(@ModelAttribute Product productImage, Model model) {
		System.out.println("-------inside upload controller-----");
		if (productImage.getImage().isEmpty()) {
			try {

				/*
				 * Creating the directory in the server context to store.
				 */
				String imagePath = request.getServletContext().getRealPath("/resource/image");
				System.out.println("------- Context Path set -------");
				File dir = new File(imagePath + File.separator);
				System.out.println("------- Directory set to" + dir + "-------");
				if (!dir.exists())
					dir.mkdirs();
				String orgName = productBean.getPname();
				String filePath = imagePath + File.separator + orgName + ".jpg";
				File dest = new File(filePath);
				System.out.println("------- Image uploaded to " + dest + "-------");
				productImage.getImage().transferTo(dest);

			} catch (Exception e) {
				System.out.println("You failed to upload " + productBean.getPname() + " => " + e.getMessage());
			}
		} else {
			System.out.println("Upload Failed");
		}

		/* model.addAttribute("product", productdao.getAllProducts()); */

		return "ProductList";
	}

	@RequestMapping(value = "/ProductList")
	public String showAllProduct(Model model) {
		List<Product> products = productdao.getAllProducts();
		model.addAttribute("product", products);

		return "ProductList";
	}

	@RequestMapping(value = "/deleteProduct/{pid}")
	public String deleteProduct(@PathVariable int pid) {
		productdao.deleteProduct(pid);
		return "ProductList";
	}

	@RequestMapping(value = { "/all/product/viewProduct/{pid}" })
	public String viewProduct(@PathVariable int pid, Model model) {
		Product product = productdao.getProductById(pid);
		model.addAttribute("product", product);
		return "viewProduct";
	}

	@RequestMapping(value = { "/all/product/editform/{pid}" })
	public String editForm(@PathVariable int pid, Model model) {
		model.addAttribute("cat", categorydao.retrieveAllCategory());
		Product product = productdao.getProductById(pid);
		model.addAttribute("products", product);
		return "updateProduct";
	}

	@RequestMapping(value = { "/all/product/updateproduct" })
	public String updateProduct(@ModelAttribute(name = "productBean") Product productBean, Model model) {

		model.addAttribute("product", productBean);
		productdao.updateProduct(productBean);
		System.out.println("product is updated");
		MultipartFile image = productBean.getImage();
		String imageDir = request.getServletContext().getRealPath("resource/image");
		Path path = Paths.get(imageDir + File.separator + productBean.getPid() + ".jpg");
		try {
			image.transferTo(new File(path.toString()));
		} catch (IllegalStateException e) {

			e.printStackTrace();
		} catch (IOException e) {

			e.printStackTrace();
		}
		System.out.println("product is updated++");
		return "redirect:/index";
	}

}

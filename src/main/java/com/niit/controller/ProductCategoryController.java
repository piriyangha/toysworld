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
import org.springframework.validation.annotation.Validated;
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

	@RequestMapping(value = "/admin/addproduct")
	public String showAddProduct(Model model) {
		List<Category> category = categorydao.retrieveAllCategory();
		model.addAttribute("cat", category);
		model.addAttribute("product", new Product());
		return "AddProduct";

	}

	@RequestMapping(value = "/saveproduct", method = RequestMethod.POST, consumes = { MediaType.ALL_VALUE })
	public String saveProduct(@ModelAttribute("product") @Valid Product product,BindingResult result,  Model model) {
		System.out.println("product is saved");
		if (result.hasErrors()) {
			model.addAttribute("cat", categorydao.retrieveAllCategory());
			model.addAttribute("product", product);
			return "AddProduct";
		}
		productdao.saveProduct(product);
		/*System.out.println("-------Product is saved-----");
		System.out.println("-------Product name:----- "+product.getPname());
		MultipartFile image=product.getImage();
		String imagepath=request.getServletContext().getRealPath("/resource/image");
		System.out.println("---------Directory:-------"+imagepath);
		Path path=Paths.get(imagepath + File.separator + product.getPid()+".jpg");
		System.out.println("-------Path:-----"+path.toString());
		try {
			image.transferTo(new File(path.toString()));
		} catch (IllegalStateException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		*/
		return "redirect:/ProductList";
	}

	
	@RequestMapping(value = "/ProductList")
	public String showAllProduct(Model model) {
		List<Product> products = productdao.getAllProducts();
		model.addAttribute("product", products);
		return "ProductList";
	}

	@RequestMapping(value = "/admin/deleteProduct/{pid}")
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

	@RequestMapping(value = { "/admin/product/editform/{pid}" })
	public String editForm(@PathVariable int pid, Model model) {
		model.addAttribute("cat", categorydao.retrieveAllCategory());
		Product product = productdao.getProductById(pid);
		model.addAttribute("products", product);
		return "updateProduct";
	}

	@RequestMapping(value = { "/all/product/updateproduct" })
	public String updateProduct(@ModelAttribute(name = "products") Product productBean, Model model) {

		model.addAttribute("product", productBean);
		productdao.updateProduct(productBean);
		
		/*MultipartFile image=productBean.getImage();
		String imagepath=request.getServletContext().getRealPath("/resource/image");
		System.out.println("Directory:"+imagepath);
		Path path=Paths.get(imagepath + File.separator + productBean.getPid()+".jpg");
		System.out.println("Path:"+path.toString());
		try {
			image.transferTo(new File(path.toString()));
		} catch (IllegalStateException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}*/
		
		System.out.println("product is updated++");
		
		
		return "redirect:/index";
	}
    @RequestMapping(value="/categorydropdown/{cid}")
	public String viewCategory(@PathVariable int cid, Model model)
	{
		System.out.println("inside productGetByCategoryId");
		model.addAttribute("productList",productdao.getProductByCategoryId(cid));
		return "index";
	}

}

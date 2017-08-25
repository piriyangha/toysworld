package com.niit.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;



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
	
	@RequestMapping("/addcategory")
	public String showAddCategory(Model model )
	{   
		model.addAttribute("category",new Category());
		return "AddCategory";
		
	}
	
	@RequestMapping(value="/savecat", method=RequestMethod.POST)
	public String saveCategory(@ModelAttribute("category") Category category) 
	{    
		  categorydao.saveCategory(category);
	      return "redirect:/index";
	  }
	
	@RequestMapping("/addproduct")
	public String showAddProduct(Model model )
	{   List<Category> category=categorydao.retrieveAllCategory();
	    model.addAttribute("cat",category);
	    //System.out.println("category:" +category.iterator());
		return "AddProduct";
		
	}
	
	@ModelAttribute("product")
	public Product bindProduct(){
		
		return new Product();
	}
	
	@RequestMapping(value="/saveproduct", method=RequestMethod.POST, consumes={MediaType.ALL_VALUE})
	public String saveProduct(@ModelAttribute Product product) 
	{     System.out.println("in product save conroller");
			System.out.println("Product : "+product.getPname()+" in the controller ");
		  productdao.saveProduct(product);
		  System.out.println("Value is saved");
		  System.out.println("Product details:"+"p.name-"+ product.getPname()+"p.category-"+ product.getCategory().getCatname());
		  
		  MultipartFile image= product.getImage();
		  Path path=Paths.get("D:\\niit-course\\java course relatd doc\\maven project\\toysworld\\src\\main\\webapp\\resource"+product.getPid()+".jpg");
			try {
				image.transferTo(new File(path.toString()));
			} catch (IllegalStateException e) {
				
				e.printStackTrace();
			} catch (IOException e) {
				
				e.printStackTrace();
			}	  
		  
	      return "redirect:/ProductList";
	  }
	
	@RequestMapping(value="/ProductList")
	public String showAllProduct(Model model)
	{   
		List<Product> products=productdao.getAllProducts();
		model.addAttribute("product",products);
		
		return "ProductList";	
	}
	@RequestMapping(value="/deleteProduct/{pid}")
	public String deleteProduct(@PathVariable int pid){
		productdao.deleteProduct(pid);
		return "ProductList";	
	}
	
	@RequestMapping(value={"/all/product/editform/{pid}"})
	public String editForm(@PathVariable int pid, Model model)
	{  
		Product product=productdao.getProductById(pid);
		model.addAttribute("products",product);
		return"updateProduct";
	}
				
	@RequestMapping(value={"/all/product/updateproduct"})				
	public String updateProduct(@ModelAttribute(name="products") Product product)
	{   System.out.println("product is updated");
		productdao.updateProduct(product);
		 MultipartFile image= product.getImage();
		  Path path=Paths.get("D:\\niit-course\\java course relatd doc\\maven project\\toysworld\\src\\main\\webapp\\resource"+product.getPid()+".jpg");
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

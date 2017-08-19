package com.niit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


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
		  System.out.println("value is saved");
	      return "redirect:/ProductList";
	  }
	
	@RequestMapping("/addproduct")
	public String showAddProduct(Model model )
	{   List<Category> category=categorydao.retrieveAllCategory();
	    model.addAttribute("cat",category);
		model.addAttribute("product",new Product());
		return "AddProduct";
		
	}
	
	@RequestMapping(value="/saveproduct", method=RequestMethod.POST)
	public String saveProduct(@ModelAttribute("product") Product product) 
	{    
		  productdao.saveProduct(product);
		  System.out.println("value is saved");
	      return "redirect:/ProductList";
	  }
	
	@RequestMapping(value="/ProductList")
	public String showAllProduct(Model model)
	{   List<Category> category=categorydao.retrieveAllCategory();
		List<Product> products=productdao.getAllProducts();
		model.addAttribute("product",products);
		model.addAttribute("cat",category);
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
		System.out.println("product is updated++");
		return "redirect:/index";
	}
	
}

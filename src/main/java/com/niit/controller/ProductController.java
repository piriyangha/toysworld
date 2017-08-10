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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.dao.ProductDao;
import com.niit.model.Product;

@Controller 
@Transactional
public class ProductController {
	@Autowired
	ProductDao productdao;
	@RequestMapping("/addproduct")
	
	public String showAddProduct(Model model )
	{
		model.addAttribute("product",new Product());
		return "AddProduct";
		
	}
	
	@RequestMapping(value="/saveproduct", method=RequestMethod.POST)
	public String saveProduct(@ModelAttribute ("product") Product product) 
	{    
		  productdao.saveProduct(product);
	      return "redirect:/ProductList";
	  }
	
	@RequestMapping(value="/ProductList")
	public String showAllProduct(Model model){
		List<Product> products=productdao.getAllProducts();
		model.addAttribute("product",products);
		return "ProductList";	
	}
	@RequestMapping(value="/deleteProduct/{pid}")
	public String deleteProduct(@PathVariable int pid){
		productdao.deleteProduct(pid);
		return "ProductList";	
	}
	
	@RequestMapping(value="/editProduct/{pid}")
	public String editProduct(@PathVariable int pid, Model model)
	{   System.out.println("in edit controller");
		Product product=productdao.getProductById(pid);
		model.addAttribute("products", product);
		System.out.println("pid value is :"+pid);
		return"updateProduct";
	}
	
	
}

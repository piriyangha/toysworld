package com.niit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.dao.ProductDao;
import com.niit.model.Product;

@Controller
public class ProductController {
	@Autowired
	ProductDao productdao;
	@RequestMapping(value="/ProductList")
	public String productListPage(Model model) {
		   model.addAttribute("product",new Product());
		   return "ProductList";
	  }
	

}

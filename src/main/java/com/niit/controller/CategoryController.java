package com.niit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.niit.dao.CategoryDao;
import com.niit.model.Category;

public class CategoryController {
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
	

}

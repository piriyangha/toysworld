package com.niit.controller;

import javax.naming.Binding;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.niit.dao.userdao;
import com.niit.model.User;

@Controller
public class userController {
	@Autowired
	userdao userDao;
	@RequestMapping(value = "/register")
	public String goToRegisterPage(Model model) {
		   model.addAttribute("user",new User());
		   return "register";
	  }
	@RequestMapping(value = "/login")
	public String loginPage()
	{
		return"Login";
	}
	@RequestMapping(value = "/saveregister", method = RequestMethod.POST)
	public String LoginPage( @ModelAttribute("user")@Valid User user,BindingResult result, Model model) {
		System.out.println("u r in controller" +user.getUsername());
	
		if(result.hasErrors())
		{
			model.addAttribute("user",user);
			return "register";
		}
		
		   userDao.saveUser(user);
		     return "Login";
	     
	}
}

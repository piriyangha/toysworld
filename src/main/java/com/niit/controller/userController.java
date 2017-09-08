package com.niit.controller;


import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.dao.userdao;
import com.niit.model.User;

@Controller
public class userController {
	private static final boolean TRUE = false;
	@Autowired
	userdao userDao;
	@RequestMapping(value = "/register")
	public String goToRegisterPage(Model model) {
		   model.addAttribute("user",new User());
		   return "register";
	  }
	@RequestMapping(value = "/login")
	public String loginPage(@RequestParam(required=false)boolean Login, Model model)
	{
		if(Login==false)
		{
		model.addAttribute("error","login failed");
		}
		else
		{
			model.addAttribute("error",null);
		}
		return"Login";
		
	}
	@RequestMapping(value = "/saveregister", method = RequestMethod.POST)
	public String loginPage( @ModelAttribute("user")@Valid User user,BindingResult result, Model model) {
		System.out.println("u r in controller" +user.getUsername());
	
		if(result.hasErrors())
		{
			model.addAttribute("user",user);
			return "register";
		}
		model.addAttribute("user",user);
		user.setEnabled(true);
        user.setRole("ROLE_USER");
		   userDao.saveUser(user);
		     return "Login";
	     
	}
	/*@RequestMapping(value = "/login")
	public String logOut()
	{
		return "index";
	}*/
}

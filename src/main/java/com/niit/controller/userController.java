package com.niit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	@RequestMapping(value = "/register/Login", method = RequestMethod.POST)
	public String LoginPage(@ModelAttribute User user, Model model) {
		System.out.println("u r in controller"+user.getUsername());
		   userDao.saveUser(user);
		   
		   return "Login";
	}
	
}


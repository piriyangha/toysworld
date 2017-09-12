package com.niit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class homeController {

	@RequestMapping(value = {"/","/index"})
	public String headerPage() {
		return "index";
	}
	@RequestMapping(value={"/aboutus"})
	public String aboutUsPage()
	{
		return"aboutUs";
	}
	@RequestMapping(value={"/contactus"})
	public String contactUsPage()
	{
		return"contactUs";
	}
	}

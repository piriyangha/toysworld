package com.niit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CartController {
	
	@RequestMapping(value={"/cart/addtocart/pid"})
	public String viewCartpage()
	{
	return"Cart";
	}
}

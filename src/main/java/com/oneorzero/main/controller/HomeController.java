package com.oneorzero.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping("/")
	public String index() {
		return "index";
	}
	
	@GetMapping("/indexShop")
	public String indexShop(Model model) {
		return "indexShop";
	}
	
	@GetMapping("/contact")
	public String contact(Model model) {
		return "contact";
	}
	
	@GetMapping("/blog")
	public String blog(Model model) {
		return "blog";
	}
	
	@GetMapping("/post-details")
	public String postDetails(Model model) {
		return "post-details";
	}
	
}

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
	
	@GetMapping("/signUp/Terms")
	public String terms(Model model) {
		return "signUp/Terms";
	}
	
	@GetMapping("/backEnd/storeOrder/StoreOrderList")
	public String storeOrderList(Model model) {
		return "backEnd/storeOrder/StoreOrderList";
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
	
	//-----------------------------------index end--------------------------------------------
	
	@GetMapping("/post-details")
	public String postDetails(Model model) {
		return "post-details";
	}
	
	@GetMapping("/storeLogin/StoreLogin")
	public String storeLogin(Model model) {
		return "storeLogin/StoreLogin";
	}
	
	@GetMapping("/storeSignup/Terms")
	public String storeTerms(Model model) {
		return "storeSignup/Terms";
	}
	
	@GetMapping("/backEnd/storeOrder/StoreOrder")
	public String storeOrder(Model model) {
		return "backEnd/storeOrder/StoreOrder";
	}
	
	
	@GetMapping("/storeSignUp/StoreSignUp")
	public String storeSignUp(Model model) {
		return "storeSignUp/StoreSignUp";
	}
	
}

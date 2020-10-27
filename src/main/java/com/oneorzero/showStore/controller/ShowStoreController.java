package com.oneorzero.showStore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ShowStoreController {
	
	@GetMapping("/showStore/showStore")
	public String showStore(Model model) {
		return "showStore/showStore";
	}
}

package com.oneorzero.logout.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

@Controller
@SessionAttributes
public class LogoutController {
	
	@GetMapping("/out")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "index";
	}
}

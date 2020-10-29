package com.oneorzero.logout.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.support.SessionStatus;

@Controller
public class LogoutController {
	
	@GetMapping("/out")
	public String logout(HttpSession session, SessionStatus status) {
		status.setComplete();
		session.invalidate();
		return "index";
	}
	
	@GetMapping("/out/store")
	public String logoutStore(HttpSession session, SessionStatus status) {
		status.setComplete();
		session.invalidate();
		return "indexShop";
	}
}

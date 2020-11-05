package com.oneorzero.signup.controller;

import java.util.Base64;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oneorzero.bean.StoreBean;
import com.oneorzero.signup.service.IStoreSignUpService;
import com.oneorzero.util.SendMail;

@Controller
public class StoreSignUpController{
	
	@Autowired
	IStoreSignUpService service;
	
	@GetMapping("/signUp/StoreTerms")
	public String storeTerms(Model model) {
		return "signUp/StoreTerms";
	}
	
	@GetMapping("/signUp/StoreSignUp")
	public String getNewSignUpForm(Model model) {
		StoreBean bean = new StoreBean();
		model.addAttribute("storeBean", bean);
		return "signUp/StoreSignUp";
	}
	
	@PostMapping("/signUp/StoreSignUp")
	public String storeSignUp(@ModelAttribute("storeBean") StoreBean sb,
							  Model model,RedirectAttributes redirectAttributes) {
		if (sb.getEmail() == null || sb.getEmail().trim().length() == 0) {
			return "/signUp/StoreSignUp" ;
		} if (sb.getPassword() == null || sb.getPassword().trim().length() == 0) {
			return "/signUp/StoreSignUp" ;
		} if (sb.getStore_name() == null || sb.getStore_name().trim().length() == 0) {
			return "/signUp/StoreSignUp" ;	
		} if (sb.getOpentime_start() == null || sb.getOpentime_start().trim().length() == 0) {
			return "/signUp/StoreSignUp" ;	
		} if (sb.getOpentime_end() == null || sb.getOpentime_end().trim().length() == 0) {
			return "/signUp/StoreSignUp" ;	
		}
		boolean status = false;
		status = service.signUp(sb);
		if (status) {
			SendMail send = new SendMail();
			Base64.Encoder encoder = Base64.getEncoder();
			
			String mail = sb.getEmail();
			String encodeEmail = encoder.encodeToString(mail.getBytes());
			
			String context = "http://localhost:8080/OneOrZero/signUp/StoreAccountVerify"+
							 "?" + "email=" + encodeEmail;
			
			send.sendAccountVerify(mail, context);
			redirectAttributes.addFlashAttribute("email", mail);
			return "redirect:/indexShop";
		} else {
			model.addAttribute("SignUpError", "此帳號已被使用");
			return "signUp/StoreSignUp";
		}	
	}
	
	@GetMapping("/signUp/StoreSignUpOK")
	public String storeSignUpRedirect(Model model) {
		return "signUp/StoreSignUpOK";
	}
	
	@GetMapping("/signUp/StoreAccountVerify")
	public String storeAccountVerify(String email,
									@ModelAttribute("storeBean") StoreBean sb,
									Model model,
									RedirectAttributes redirectAttributes) {
		Base64.Decoder decoder = Base64.getDecoder();		
		email = new String(decoder.decode(email));
		service.verifyAccount(email);
		return "redirect:/login/StoreLogin";
	}
}

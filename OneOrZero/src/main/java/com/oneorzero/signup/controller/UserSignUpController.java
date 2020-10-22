package com.oneorzero.signup.controller;

import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oneorzero.bean.MemberBean;
import com.oneorzero.signup.service.IUserSignUpService;
import com.oneorzero.util.SendMail;

@Controller
public class UserSignUpController{
	
	@Autowired
	IUserSignUpService service;
	
	@GetMapping("/signUp/UserSignUp")
	public String getNewSignUpForm(Model model) {
		MemberBean bean = new MemberBean();
		model.addAttribute("memberBean", bean);
		return "signUp/UserSignUp";
	}
	
	@PostMapping("/signUp/UserSignUp")
	public String userSignUp(@RequestParam String email,
							@RequestParam String name,
							@RequestParam String gender,
							@RequestParam String birthday,
							@RequestParam String password,
							@ModelAttribute("memberBean") MemberBean mb,
							Model model,
							RedirectAttributes redirectAttributes) {
		Map<String, String> errorMsg = new HashMap<String, String>();
		model.addAttribute("ErrorMsg", errorMsg);
		System.out.println(mb.getEmail());
		boolean status = false;
		status = service.signUp(mb);
		if (status) {
			SendMail send = new SendMail();
			Base64.Encoder encoder = Base64.getEncoder();
			
			String mail = mb.getEmail();
			String encodeEmail = encoder.encodeToString(mail.getBytes());
			
			String context = "http://localhost:8080/OneOrZero/signUp/UserAccountVerify"+
							 "?" + "email=" + encodeEmail;
			
			send.sendAccountVerify(mail, context);
			redirectAttributes.addFlashAttribute("email", email);
			return "redirect:/signUp/SignUpOK";
		} else {
			model.addAttribute("SignUpError", "此帳號已被使用");
			return "signUp/UserSignUp";
		}	
	}
	
	@GetMapping("/signUp/SignUpOK")
	public String signUpRedirect(Model model) {
		return "signUp/SignUpOK";
	}
	
	@GetMapping("/signUp/UserAccountVerify")
	public String userAccountVerify(String email,
									@ModelAttribute("memberBean") MemberBean mb,
									Model model,
									RedirectAttributes redirectAttributes) {
		Base64.Decoder decoder = Base64.getDecoder();		
		email = new String(decoder.decode(email));
		service.verifyAccount(email);
		return "redirect:/login/UserLogin";
	}
}

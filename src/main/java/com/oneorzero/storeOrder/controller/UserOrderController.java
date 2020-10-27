package com.oneorzero.storeOrder.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.oneorzero.storeOrder.service.IUserOrderService;

@Controller
public class UserOrderController{
	
	@Autowired
	IUserOrderService service;
	
//	@GetMapping("/signUp/Terms")
//	public String terms(Model model) {
//		return "signUp/Terms";
//	}
//	
//	@GetMapping("/signUp/UserSignUp")
//	public String getNewSignUpForm(Model model) {
//		MemberBean bean = new MemberBean();
//		model.addAttribute("memberBean", bean);
//		return "signUp/UserSignUp";
//	}
//	
//	@PostMapping("/signUp/UserSignUp")
//	public String userSignUp(@RequestParam String email,
//							@RequestParam String name,
//							@RequestParam String gender,
//							@RequestParam String birthday,
//							@RequestParam String password,
//							@ModelAttribute("memberBean") MemberBean mb,
//							Model model,
//							RedirectAttributes redirectAttributes) {
//		Map<String, String> errorMsg = new HashMap<String, String>();
//		model.addAttribute("ErrorMsg", errorMsg);
//		System.out.println(mb.getEmail());
//		boolean status = false;
//		status = service.signUp(mb);
//		if (status) {
//			SendMail send = new SendMail();
//			Base64.Encoder encoder = Base64.getEncoder();
//			
//			String mail = mb.getEmail();
//			String encodeEmail = encoder.encodeToString(mail.getBytes());
//			
//			String context = "http://localhost:8080/OneOrZero/signUp/UserAccountVerify"+
//							 "?" + "email=" + encodeEmail;
//			
//			send.sendAccountVerify(mail, context);
//			redirectAttributes.addFlashAttribute("email", email);
//			return "redirect:/signUp/SignUpOK";
//		} else {
//			model.addAttribute("SignUpError", "此帳號已被使用");
//			return "signUp/UserSignUp";
//		}	
//	}
//	
//	@GetMapping("/signUp/SignUpOK")
//	public String signUpRedirect(Model model) {
//		return "signUp/SignUpOK";
//	}
//	
//	@GetMapping("/signUp/UserAccountVerify")
//	public String userAccountVerify(String email,
//									@ModelAttribute("memberBean") MemberBean mb,
//									Model model,
//									RedirectAttributes redirectAttributes) {
//		Base64.Decoder decoder = Base64.getDecoder();		
//		email = new String(decoder.decode(email));
//		service.verifyAccount(email);
//		return "redirect:/login/UserLogin";
//	}
}

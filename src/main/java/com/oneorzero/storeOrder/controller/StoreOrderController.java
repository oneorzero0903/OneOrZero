package com.oneorzero.storeOrder.controller;

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

import com.oneorzero.bean.Store_OrderSettingBean;
import com.oneorzero.storeOrder.service.IStoreOrderService;

@Controller
public class StoreOrderController{
	
	@Autowired
	IStoreOrderService service;
	
	@GetMapping("/storeOrder/StoreOrder")
	public String getNewSignUpForm(Model model) {
		Store_OrderSettingBean bean = new Store_OrderSettingBean();
		model.addAttribute("store_OrderSettingBean", bean);
		return "/storeOrder/StoreOrder";
	}
	
	@PostMapping("/storeOrder/StoreOrder")
	public String storeSignUp(@RequestParam String timeStart,
							@RequestParam String timeEnd,
							@RequestParam String boothNum,
							@RequestParam String phone,
							@ModelAttribute("store_OrderSettingBean") Store_OrderSettingBean sob,
							Model model,
							RedirectAttributes redirectAttributes) {
		
		boolean status = false;
		status = service.signUp(sob);
//		Map<String, String> errorMsg = new HashMap<String, String>();
//		model.addAttribute("ErrorMsg", errorMsg);
//		System.out.println(sb.getEmail());
//		boolean status = false;
//		status = service.signUp(sb);
//		if (status) {
//			SendMail send = new SendMail();
//			Base64.Encoder encoder = Base64.getEncoder();
//			
//			String mail = sb.getEmail();
//			String encodeEmail = encoder.encodeToString(mail.getBytes());
//			
//			String context = "http://localhost:8080/OneOrZero/signUp/StoreAccountVerify"+
//							 "?" + "email=" + encodeEmail;
//			
//			send.sendAccountVerify(mail, context);
//			redirectAttributes.addFlashAttribute("email", email);
//			return "redirect:/signUp/SignUpOK";
//		} else {
//			model.addAttribute("SignUpError", "此帳號已被使用");
//			return "signUp/StoreSignUp";
//		}	
		return "storeOrder/StoreOrderMenu";
	}
//	
//	@GetMapping("/signUp/StoreSignUpOK")
//	public String storeSignUpRedirect(Model model) {
//		return "signUp/StoreSignUpOK";
//	}
//	
//	@GetMapping("/signUp/StoreAccountVerify")
//	public String storeAccountVerify(String email,
//									@ModelAttribute("storeBean") StoreBean sb,
//									Model model,
//									RedirectAttributes redirectAttributes) {
//		Base64.Decoder decoder = Base64.getDecoder();		
//		email = new String(decoder.decode(email));
//		service.verifyAccount(email);
//		return "redirect:/login/StoreLogin";
//	}
}

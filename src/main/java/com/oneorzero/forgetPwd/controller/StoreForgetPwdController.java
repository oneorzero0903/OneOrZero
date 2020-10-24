package com.oneorzero.forgetPwd.controller;

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

import com.oneorzero.bean.StoreBean;
import com.oneorzero.forgetPwd.service.IStoreForgetPwdService;

@Controller
public class StoreForgetPwdController{
	
	@Autowired
	IStoreForgetPwdService service;
	
	@GetMapping("/login/StoreForgetPwd")
	public String getNewStoreLoginForm(Model model) {
		StoreBean bean = new StoreBean();
		model.addAttribute("storeBean", bean);
		return "login/StoreForgetPwd";
	}
	
	@PostMapping("/login/StoreForgetPwd")
	public String storeForgetPwd(@RequestParam String email,
							@ModelAttribute("storeBean") StoreBean sb,
							Model model, 
							RedirectAttributes redirectAttributes) {
		Map<String, String> errorMsg = new HashMap<String, String>();
		model.addAttribute("ErrorMsg", errorMsg);
		if (email == null || email.trim().length() == 0) {
			errorMsg.put("AccountEmptyError", "信箱不可為空");
		}
		
		if (!errorMsg.isEmpty()) {
			return "login/StoreForgetPwd";
		}
		StoreBean bean = null;
		bean = service.checkAccountExist(email);
		if(bean != null) {
			redirectAttributes.addFlashAttribute("LoginSuccess", bean.getEmail());
		} else {
			errorMsg.put("LoginError", "信箱不存在");
		}
		if (errorMsg.isEmpty()) {
			redirectAttributes.addFlashAttribute("EmailOK", "我們已將臨時密碼發送至您的信箱:");
			return "redirect:/login/StorePwdResetSuccess";
		} else {
			return "login/StoreForgetPwd";
		}
	}
	
	@GetMapping("/login/StorePwdResetSuccess")
	public String userPwdRedirect() {
		return "/login/StorePwdResetSuccess";
	}

}

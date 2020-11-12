package com.oneorzero.login.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.oneorzero.bean.StoreBean;
import com.oneorzero.login.service.IStoreLoginService;

@Controller
@SessionAttributes({"store"})
public class StoreLoginController{
	
	@Autowired
	IStoreLoginService service;
	
	@GetMapping("/login/StoreLogin")
	public String getNewLoginForm(Model model) {
		StoreBean bean = new StoreBean();
		model.addAttribute("storeBean", bean);
		return "login/StoreLogin";
	}
	
	@PostMapping("/login/StoreLogin")
	public String storeLogin(@RequestParam String email,
							@RequestParam String password,
							@ModelAttribute("storeBean") StoreBean sb,
							Model model) {
		Map<String, String> errorMsg = new HashMap<String, String>();
		model.addAttribute("ErrorMsg", errorMsg);
		if (email == null || email.trim().length() == 0) {
			errorMsg.put("AccountEmptyError", "帳號不可為空");
		}
		if (password == null || password.trim().length() == 0) {
			errorMsg.put("PasswordEmptyError", "密碼不可為空");
		}
		if (!errorMsg.isEmpty()) {
			return "login/StoreLogin";
		}
		StoreBean bean = null;
		bean = service.checkAccountPassword(email, password);
		if(bean != null && bean.getIsSuccess().equals("on")) {
			model.addAttribute("store", bean);
		} else if (bean != null && bean.getIsSuccess().equals("off")) {
			errorMsg.put("VerifyError", "帳號尚未開通");
		} else {
			errorMsg.put("LoginError", "帳號不存在或密碼錯誤");
		}		
		if (errorMsg.isEmpty()) {
			if(bean.getIsAdmin() == 1) {
				return "redirect:/adminpage";
			}else {
				return "redirect:/indexShop";
			}
		} else {
			return "login/StoreLogin";
		}
	}
}

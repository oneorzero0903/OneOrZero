package com.oneorzero.login.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oneorzero.bean.MemberBean;
import com.oneorzero.login.service.IUserLoginService;

@Controller
public class UserLoginController{
	
	@Autowired
	IUserLoginService service;
	
	@GetMapping("/login/UserLogin")
	public String getNewLoginForm(Model model) {
		MemberBean bean = new MemberBean();
		model.addAttribute("memberBean", bean);
		return "login/UserLogin";
	}
	
	@PostMapping("/login/UserLogin")
	public String userLogin(@RequestParam String email,
							@RequestParam String password,
							@ModelAttribute("memberBean") MemberBean mb,
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
			return "login/UserLogin";
		}
		List<MemberBean> bean = null;
		bean = service.checkAccountPassword(email, password);
		if(bean != null && bean.get(0).getIsSuccess().equals("on")) {
			model.addAttribute("LoginSuccess", bean.get(0).getEmail());
			model.addAttribute("member", bean.get(0));
		} else if (bean != null && bean.get(0).getIsSuccess().equals("off")) {
			errorMsg.put("VerifyError", "帳號尚未開通");
		} else {
			errorMsg.put("LoginError", "帳號不存在或密碼錯誤");
		}		
		if (errorMsg.isEmpty()) {
			return "login/LoginOK";
		} else {
			return "login/UserLogin";
		}
	}
}

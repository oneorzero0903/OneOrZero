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

import com.oneorzero.bean.MemberBean;
import com.oneorzero.forgetPwd.service.IUserForgetPwdService;

@Controller
public class UserForgetPwdController {

	@Autowired
	IUserForgetPwdService service;
	
	@GetMapping("/login/UserForgetPwd")
	public String getNewUserLoginForm(Model model) {
		MemberBean bean = new MemberBean();
		model.addAttribute("memberBean", bean);
		return "login/UserForgetPwd";
	}
	
	@PostMapping("/login/UserForgetPwd")
	public String userForgetPwd(@RequestParam String email,
							Model model, 
							@ModelAttribute("memberBean") MemberBean mb,
							RedirectAttributes redirectAttributes) {
		Map<String, String> errorMsg = new HashMap<String, String>();
		model.addAttribute("ErrorMsg", errorMsg);
		if (email == null || email.trim().length() == 0) {
			errorMsg.put("AccountEmptyError", "信箱不可為空");
		}
		
		if (!errorMsg.isEmpty()) {
			return "login/UserForgetPwd";
		}
		MemberBean bean = null;
		bean = service.checkAccountExist(email);
		if(bean != null) {
			redirectAttributes.addFlashAttribute("LoginSuccess", bean.getEmail());
		} else {
			errorMsg.put("LoginError", "信箱不存在");
		}
		if (errorMsg.isEmpty()) {
//			model.addAttribute("EmailOK", "我們已將臨時密碼發送至您的信箱:");
			redirectAttributes.addFlashAttribute("EmailOK", "我們已將臨時密碼發送至您的信箱:");
			return "redirect:/login/UserPwdResetSuccess";
		} else {
			return "login/UserForgetPwd";
		}
	}
	
	@GetMapping("/login/UserPwdResetSuccess")
	public String userPwdRedirect() {
		return "/login/UserPwdResetSuccess";
	}
}

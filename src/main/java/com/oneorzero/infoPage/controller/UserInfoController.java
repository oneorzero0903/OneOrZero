package com.oneorzero.infoPage.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.oneorzero.bean.MemberBean;
import com.oneorzero.infoPage.service.IUserInfoService;

@Controller
@SessionAttributes({"member"})
public class UserInfoController {
	
	@Autowired
	IUserInfoService service;

	@GetMapping("/infoPage/UserInfoPage")
	public String userInfo() {
		return "infoPage/UserInfoPage";
	}
	
	@GetMapping("/infoPage/UserInfoChange")
	public String userInfoChange() {
		return "infoPage/UserInfoChange";
	}
	
	//修改資料
	@PutMapping(value = "/infoPage/UserInfoChange",
			consumes= {"application/json"}, produces= {"application/json"})
	public @ResponseBody Map<String, String> updateUser(@RequestBody MemberBean member,
														Model model) {
		Map<String, String> map = new HashMap<String, String>();
		try {
			service.updateMember(member);
			model.addAttribute("member", member);
			map.put("success", "更新成功");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("fail", "更新失敗");
		}
		return map;
	}
	
//	//讀取並回傳單筆資料
//	@GetMapping(value = "/infoPage/UserInfoChange", produces = {"application/json"})
//	public @ResponseBody MemberBean display() {
//		MemberBean mb = service.findByPK(pk);
//		return mb;
//	}
	
}

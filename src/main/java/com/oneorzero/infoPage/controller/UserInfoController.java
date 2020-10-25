package com.oneorzero.infoPage.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oneorzero.bean.MemberBean;
import com.oneorzero.infoPage.service.IUserInfoService;

@Controller
public class UserInfoController {
	
	@Autowired
	IUserInfoService service;

	@GetMapping("/userInfo/UserInfoPage")
	public String userInfo() {
		return "userInfo/UserInfoPage";
	}
	
	@GetMapping("/userInfo/UserInfoChange")
	public String userInfoChange() {
		return "userInfo/UserInfoChange";
	}
	
	//修改資料
	@PutMapping(value = "/userInfo/UserInfoChange",
				 consumes = {"application/json"}, produces = {"application/json"})
	public @ResponseBody Map<String, String> updateUser(@RequestBody MemberBean member
														) {
//		MemberBean bean = service.findByPK(pk);
		System.out.println(member.getEmail());
		Map<String, String> map = new HashMap<String, String>();
		try {
			service.updateMember(member);
			map.put("success", "更新成功");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("fail", "更新失敗");
		}
		return map;
	}
	
	//讀取並回傳單筆資料
	@GetMapping(value = "/userInfo/UserInfoChange/{pk}", produces = {"application/json"})
	public @ResponseBody MemberBean display(@PathVariable Integer pk) {
		MemberBean mb = service.findByPK(pk);
		return mb;
	}
	
}

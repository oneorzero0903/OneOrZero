package com.oneorzero.advertising.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oneorzero.advertising.service.IAdvertisingService;
import com.oneorzero.bean.AdvertisingBean;

@Controller
public class AdvertisingController {
	
	@Autowired
	IAdvertisingService service;
	
	//廣告自動上下架功能
	@GetMapping("/ad/adList.json")
	public @ResponseBody List<AdvertisingBean> showOKAd() {
		return service.showOKAd();
	}
	
	@GetMapping("/demoIndex")
	public String indexD() {
		return "demoIndex";
	}
}

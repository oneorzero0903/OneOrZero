package com.oneorzero.advertising.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@GetMapping("/ad/buyAd")
	public String getBuyAdForm(Model model) {
		AdvertisingBean adBean = new AdvertisingBean();
		model.addAttribute("adBean", adBean);
		return "ad/buyAd";
	}
	
	@PostMapping("/ad/buyAd")
	public String buyAd(@RequestParam String title,
						@RequestParam String description,
						@RequestParam String startTime,
						@ModelAttribute("adBean") AdvertisingBean adBean,
						Model model) throws ParseException {
		
		
		//將投放日期區間換為long型態 毫秒
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Long adStartTime = sdf.parse(splitAndCompose(startTime)).getTime();
		Long adEndTime = adStartTime +7*24*60*60*1000; //投放7天
		adBean.setAdStartTime(adStartTime);
		adBean.setAdEndTime(adEndTime);
		if (service.buyAd(adBean)) {
			return "redirect:/indexShop";
		} else {
			model.addAttribute("ErrorMsg", "此段期間已有投放廣告");
			return "ad/buyAd";
		}
		
	}
	
	//將廣告投放之日期字串重組
		private String splitAndCompose(String s) {
			String[] arr = s.split("-");
			return arr[0]+arr[1]+arr[2];
		}
}

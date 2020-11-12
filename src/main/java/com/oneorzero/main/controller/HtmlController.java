package com.oneorzero.main.controller;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutOneTime;

@Controller
public class HtmlController {
	
	public static AllInOne all;
	
	@GetMapping(value = "/greenTest", produces = MediaType.TEXT_HTML_VALUE)
	@ResponseBody
	public String testGreen() {
		return tttt();
	}
	
	public String tttt() {
		initial();
		String url ="aioCheckOutOneTime: " + genAioCheckOutOneTime();
		return url;
	}
	
	private static void initial(){
		all = new AllInOne("");
	}
	
	public static String genAioCheckOutOneTime(){
		AioCheckOutOneTime obj = new AioCheckOutOneTime();
		int n = (int) (Math.random() * 100000 + 1);
		obj.setMerchantTradeNo("oneorzero" + n);
		obj.setMerchantTradeDate("2020/11/27 08:05:23");
		obj.setTotalAmount("99");
		obj.setTradeDesc("test Description");
		obj.setItemName("TestItem");
		obj.setReturnURL("http://localhost:8080/OneOrZero/");
		obj.setClientBackURL("http://localhost:8080/OneOrZero/");
		obj.setNeedExtraPaidInfo("N");
		obj.setRedeem("Y");
		String form = all.aioCheckOut(obj, null);
		return form;
	}
}

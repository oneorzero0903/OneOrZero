package com.oneorzero.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.oneorzero.bean.MemberBean;
import com.oneorzero.shoppingCart.service.IShoppingCartService;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutOneTime;

@Controller
@SessionAttributes({"member"})
public class HtmlController {
	
	public static AllInOne all;
	
	@Autowired
	IShoppingCartService service;
	
	@GetMapping(value = "/shoppingCheckOut", produces = MediaType.TEXT_HTML_VALUE)
	@ResponseBody
	public String spCheckout(Model model) {
		if (model.getAttribute("member") != null) {
			MemberBean mb = (MemberBean) model.getAttribute("member");
			long totalAmount = service.getTotalAmount(mb.getMember_id());
			String total = totalAmount+ "";
			return productCheckout("shoppingCart", total);
		} else {
			MemberBean memberBean = new MemberBean();
			model.addAttribute("memberBean", memberBean);
			return "redirect:/login/UserLogin";
		}
	}
	
	public String productCheckout(String str, String total) {
		initial();
		String url ="aioCheckOutOneTime: " + genAioCheckOutOneTime(str, total);
		return url;
	}
	
	private static void initial(){
		all = new AllInOne("");
	}
	public static String genAioCheckOutOneTime(String str, String total){
		AioCheckOutOneTime obj = new AioCheckOutOneTime();
		int n = (int) (Math.random() * 100000 + 1);
		obj.setMerchantTradeNo(str + n);
		obj.setMerchantTradeDate("2020/11/27 10:32:14");
		obj.setTotalAmount(total);
		obj.setTradeDesc("test Description");
		obj.setItemName("TestItem");
		obj.setReturnURL("http://localhost:8080/OneOrZero/");
		obj.setClientBackURL("http://localhost:8080/OneOrZero/clearShoppingCart.do");  //返回頁面
		obj.setNeedExtraPaidInfo("N");
		obj.setRedeem("Y");
		String form = all.aioCheckOut(obj, null);
		return form;
	}
}

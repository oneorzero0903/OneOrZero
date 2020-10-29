package com.oneorzero.storeOrder.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oneorzero.bean.StoreBean;
import com.oneorzero.bean.Store_OrderSettingBean;
import com.oneorzero.storeOrder.service.IStoreOrderService;

@Controller
@SessionAttributes({"store"})
public class StoreOrderController{
	
	@Autowired
	IStoreOrderService service;
	
	@GetMapping("/storeOrder/StoreOrder")
	public String getNewSignUpForm(Model model) {
		Store_OrderSettingBean bean = new Store_OrderSettingBean();
		model.addAttribute("store_OrderSettingBean", bean);
		return "/storeOrder/StoreOrder";
	}
	
	@PostMapping("/storeOrder/StoreOrder")
	public String storeSignUp(@RequestParam String timeStart,
							@RequestParam String timeEnd,
							@RequestParam String boothNum,
							@RequestParam String phone,
							@ModelAttribute("store_OrderSettingBean") Store_OrderSettingBean sob,
							Model model,
							RedirectAttributes redirectAttributes) {
		StoreBean store = (StoreBean)model.getAttribute("store");
		sob.setStore(store);
		service.signUp(sob);
		return "storeOrder/StoreOrderMenu";
	}
}

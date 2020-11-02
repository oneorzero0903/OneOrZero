package com.oneorzero.storeOrder.controller;

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

import com.oneorzero.bean.StoreBean;
import com.oneorzero.bean.Store_OrderSettingBean;
import com.oneorzero.storeOrder.model.StoreOrderRequest;
import com.oneorzero.storeOrder.service.IStoreOrderService;

@Controller
@SessionAttributes({ "store" })
public class StoreOrderController {

	@Autowired
	IStoreOrderService service;

	@GetMapping("/storeOrder/StoreOrder")
	public String getStoreOrderForm(Model model) {
		if ((StoreBean) model.getAttribute("store") != null) {
			Store_OrderSettingBean bean = new Store_OrderSettingBean();
			model.addAttribute("store_OrderSettingBean", bean);
			return "/storeOrder/StoreOrder";
		} else {
			StoreBean bean = new StoreBean();
			model.addAttribute("storeBean", bean);
			return "redirect:/login/StoreLogin";
		}
	}

	@PutMapping(value = "/storeOrder/StoreOrder", consumes = { "application/json" }, produces = { "application/json" })
	public @ResponseBody Map<String, String> insertStoreOrder(@RequestBody StoreOrderRequest storeOrder, Model model) {
		Map<String, String> map = new HashMap<>();
		StoreBean store = (StoreBean) model.getAttribute("store");
		Integer store_id = service.getStore_Id(store.getEmail());
		System.out.println(store_id);
		store.setStore_id(store_id);
		boolean isSuccess = service.insertStoreOrder(storeOrder.getStoreOrder(), store);
		if (isSuccess) {
			map.put("isOk", "ok");
			return map;
		} else {
			map.put("isOk", "fail");
			return map;
		}
	}

}

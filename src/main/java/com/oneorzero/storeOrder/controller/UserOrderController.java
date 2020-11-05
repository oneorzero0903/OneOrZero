package com.oneorzero.storeOrder.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.oneorzero.bean.OrderTimeBean;
import com.oneorzero.bean.Store_OrderSettingBean;
import com.oneorzero.showStore.model.SearchOrderRequest;
import com.oneorzero.storeOrder.model.BookingTimeRequest;
import com.oneorzero.storeOrder.service.IUserOrderService;

@Controller
@SessionAttributes({ "member", "orderSetting" ,"orderTime"})
public class UserOrderController {

	@Autowired
	IUserOrderService service;

	@GetMapping("/orders/Orders")
	public String getOrderForm(Model model) {
		return "orders/Orders";
	}

	@PostMapping(value = "/show/storeOrder", consumes = { "application/json" }, produces = { "application/json" })
	public @ResponseBody Map<String, String> order(@RequestBody SearchOrderRequest store_id, Model model) {// 從showOneStoreAjax.jsp進入
																											// 連到該store_id商家的訂單資訊
		Map<String, String> map = new HashMap<>();
		try {
			List<Store_OrderSettingBean> orderSetting = service.findOrder(store_id.getStore_id());
			model.addAttribute("orderSetting", orderSetting);
			map.put("isOk", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("isOk", "fail");
		}
		return map;

	}

	@SuppressWarnings("unchecked")
	@PostMapping(value = "/orders/booking", consumes = { "application/json" }, produces = { "application/json" })
	public @ResponseBody Map<String, String> booking(@RequestBody BookingTimeRequest date, Model model) {
		Map<String, String> map = new HashMap<>();
		try {
			List<Store_OrderSettingBean> orderSetting = 
					(List<Store_OrderSettingBean>)model.getAttribute("orderSetting");
			List<OrderTimeBean> orderTime = service.getOrderTime(orderSetting, date);
			model.addAttribute("orderTime", orderTime);
			map.put("isOk", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("isOk", "fail");
		}
		return map;

	}

}

package com.oneorzero.storeOrder.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.oneorzero.bean.StoreBean;
import com.oneorzero.bean.Store_OrderSettingBean;
import com.oneorzero.storeOrder.model.BookingTimeRequest;
import com.oneorzero.storeOrder.model.StoreOrderListResponse;
import com.oneorzero.storeOrder.model.StoreOrderRequest;
import com.oneorzero.storeOrder.service.IStoreOrderService;

@Controller
@SessionAttributes({ "store","storeOrderSetting","storeChooseDay" })
public class StoreOrderController {

	@Autowired
	IStoreOrderService service;

	@GetMapping("/storeOrder/StoreOrder")
	public String getStoreOrderForm(Model model) {
		StoreBean store = (StoreBean) model.getAttribute("store");
		if (store != null) {
			Integer storeOrderCount = service.checkStoreOrder(store);//判斷是否已設定過訂單
			if (storeOrderCount > 0) {
				List<Store_OrderSettingBean> storeOrderSetting = service.findOrder(String.valueOf(store.getStore_id()));
				model.addAttribute("storeOrderSetting", storeOrderSetting);
				return "storeOrder/StoreOrderMenu";
			}else {
				Store_OrderSettingBean bean = new Store_OrderSettingBean();
				model.addAttribute("store_OrderSettingBean", bean);
				return "storeOrder/StoreOrder";
			}
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
	
	@SuppressWarnings("unchecked")
	@PostMapping(value = "/storeOrders/dayBooking", consumes = { "application/json" }, produces = { "application/json" })
	public @ResponseBody Map<String, List<String>> dayToBooking(@RequestBody BookingTimeRequest date, Model model) {
		Map<String, List<String>> map = new HashMap<>();
		try {
			List<Store_OrderSettingBean> orderSetting = (List<Store_OrderSettingBean>) model
					.getAttribute("storeOrderSetting");
			List<String> settingList = service.checkDayToGetSetting(orderSetting, date);
			model.addAttribute("storeChooseDay", date);
			map.put("settingList", settingList);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return map;
	}
	
	@PostMapping(value = "/storeOrders/orders/{setting_id}", consumes = { "application/json" }, produces = { "application/json" })
	public @ResponseBody Map<String, List<StoreOrderListResponse>> timeToBooking(@PathVariable Integer setting_id, Model model) {
		Map<String, List<StoreOrderListResponse>> map = new HashMap<>();
		try {
			BookingTimeRequest date = (BookingTimeRequest)model.getAttribute("storeChooseDay");
			List<StoreOrderListResponse> ordersList = service.getOrdersList(setting_id, date.getDate());
			map.put("ordersList", ordersList);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return map;
	}

}

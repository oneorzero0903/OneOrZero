package com.oneorzero.storeOrder.controller;

import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oneorzero.bean.MemberBean;
import com.oneorzero.bean.StoreBean;
import com.oneorzero.bean.Store_OrderSettingBean;
import com.oneorzero.showStore.model.SearchOrderRequest;
import com.oneorzero.storeOrder.model.BookingRequest;
import com.oneorzero.storeOrder.model.BookingTimeRequest;
import com.oneorzero.storeOrder.service.IUserOrderService;
import com.oneorzero.util.SendMail;

@Controller
@SessionAttributes({ "member", "orderSetting", "orderTime", "booking", "oneStore", "chooseDay", "decodeString" })
public class UserOrderController {

	@Autowired
	IUserOrderService service;

	@GetMapping("/orders/Orders")
	public String getOrderForm(Model model) {
		if ((MemberBean) model.getAttribute("member") != null) {
			return "orders/Orders";
		} else {
			MemberBean bean = new MemberBean();
			model.addAttribute("memberBean", bean);
			return "redirect:/login/UserLogin";
		}

	}

	@PostMapping(value = "/show/storeOrder", consumes = { "application/json" }, produces = { "application/json" })
	public @ResponseBody Map<String, String> order(@RequestBody SearchOrderRequest store_id, Model model) {// 從showOneStoreAjax.jsp進入
		Map<String, String> map = new HashMap<>(); // 連到該store_id商家的訂單資訊
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
	@PostMapping(value = "/orders/dayBooking", consumes = { "application/json" }, produces = { "application/json" })
	public @ResponseBody Map<String, List<String>> dayToBooking(@RequestBody BookingTimeRequest date, Model model) {
		Map<String, List<String>> map = new HashMap<>();
		try {
			List<Store_OrderSettingBean> orderSetting = (List<Store_OrderSettingBean>) model
					.getAttribute("orderSetting");
			List<String> settingList = service.checkDayToGetSetting(orderSetting, date);
			model.addAttribute("chooseDay", date);
			map.put("settingList", settingList);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return map;
	}
	
	@PostMapping(value = "/orders/personToBooking/{setting_id}", consumes = { "application/json" }, produces = { "application/json" })
	public @ResponseBody Map<String, String> personToBooking(@PathVariable Integer setting_id, Model model) {
		Map<String, String> map = new HashMap<>();
		try {
			String personToBookingList = service.getPerson(setting_id);
			map.put("personToBookingList", personToBookingList);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return map;
	}
	
	@PostMapping(value = "/orders/timeToBooking/{setting_id}", consumes = { "application/json" }, produces = { "application/json" })
	public @ResponseBody Map<String, List<String>> timeToBooking(@PathVariable Integer setting_id, Model model) {
		Map<String, List<String>> map = new HashMap<>();
		try {
			BookingTimeRequest date = (BookingTimeRequest)model.getAttribute("chooseDay");
			List<String> timeToBookingList = service.getTimeToBooking(setting_id, date.getDate());
			map.put("timeToBookingList", timeToBookingList);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return map;
	}
	
	@PostMapping(value = "/orders/orderOk", consumes = { "application/json" }, produces = { "application/json" })
	public @ResponseBody Map<String, String> booking(@RequestBody BookingRequest booking, Model model) {
		Map<String, String> map = new HashMap<>();
		try {
			model.addAttribute("booking", booking);
			map.put("isOk", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("isOk", "fail");
		}
		return map;
	}
	
	@GetMapping("/orders/orderOks")
	public String getOrderOkForm(Model model) {
		if ((MemberBean) model.getAttribute("member") != null) {
			return "orders/orderOk";
		} else {
			MemberBean bean = new MemberBean();
			model.addAttribute("memberBean", bean);
			return "redirect:/login/UserLogin";
		}

	}
	
	@GetMapping("/orders/orderInsert")
	public @ResponseBody Map<String, String> orderInsert(Model model,RedirectAttributes redirectAttributes) {//新增訂單
		Map<String, String> map = new HashMap<>();
		MemberBean member = (MemberBean)model.getAttribute("member");
		StoreBean store = (StoreBean)model.getAttribute("oneStore");
		BookingRequest booking = (BookingRequest)model.getAttribute("booking");
		Integer box = service.orderInsert(member, store, booking);
		try {
			SendMail send = new SendMail();
			Base64.Encoder encoder = Base64.getEncoder();
			
			String mail = member.getEmail();
			String store_name = store.getStore_name();
			String[] day = booking.getDay().split("\\-");
			String order_Date = day[0];
			String days = day[1];
			String setting_id = booking.getSetting_id();
			String times = booking.getTimes();
			String deleteString = mail + "-" + store_name + "-" + order_Date + "-" + days + "-" + setting_id + "-" + times + "-" + box;
			String encodeString = encoder.encodeToString(deleteString.getBytes());
			String subject = "search(\"咖啡\"); 訂位成功信件";
			String content = "<h2>訂位咖啡廳: "+ store.getStore_name() +"</h2><br>";
				   content += "<h2>訂位日期:"+ order_Date +"</h2><br>";
				   content += "<h2>訂位包廂:"+ setting_id +"號包廂</h2><br>";
				   content += "<h2>訂位時間:"+ times +"</h2><br><br><br><br>";
				   content += "<h2>如需取消訂位，請按以下按鈕</h2><br>";
				   content += "<a target='_blank' href=\"http://localhost:8080/OneOrZero/orders/orderDelete?encodeString="+encodeString+"\"><button>點我取消</button></a>";
			send.sendEmail(mail, subject, content);
			redirectAttributes.addFlashAttribute("email", mail);
			map.put("isOk", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("isOk", "fail");
		}
		return map;

	}
	
	@GetMapping("/orders/orderDelete")
	public String orderDelete(String encodeString, Model model) {//刪除訂單
		Base64.Decoder decoder = Base64.getDecoder();		
		encodeString = new String(decoder.decode(encodeString));
		String[] decodeString = encodeString.split("\\-");
		model.addAttribute("decodeString", decodeString);
		return "orders/orderDelete";
	}
	//mail + "-" + store_name + "-" + order_Date + "-" + days + "-" + setting_id + "-" + times
	@PostMapping(value = "/orders/orderDelete", consumes = { "application/json" }, produces = { "application/json" })
	public @ResponseBody Map<String, String> orderDelete(Model model) {
		Map<String, String> map = new HashMap<>();
		try {
			String[] decodeString = (String[])model.getAttribute("decodeString");
			service.deleteOrder(decodeString);
			SendMail send = new SendMail();
			String subject = "search(\"咖啡\"); 訂位取消成功信件";
			String content = "<h2>訂位咖啡廳: "+ decodeString[1] +"</h2><br>";
				   content += "<h2>訂位日期:"+ decodeString[2] +"</h2><br>";
				   content += "<h2>訂位包廂:"+ decodeString[4] +"號包廂</h2><br>";
				   content += "<h2>訂位時間:"+ decodeString[5] +"</h2><br><br><br><br>";
				   content += "<h2>已取消，希望下次能再為您服務</h2><br>";
			send.sendEmail(decodeString[0], subject, content);
			map.put("isOk", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("isOk", "fail");
		}
		return map;
	}

}

package com.oneorzero.showStore.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oneorzero.bean.StoreBean;
import com.oneorzero.showStore.service.IShowStoreService;

@Controller
public class ShowStoreController {

	@Autowired
	IShowStoreService service;

	// 顯示所有店家
	@GetMapping("/show/showStore")
	public @ResponseBody List<StoreBean> showAllStore() {
		List<StoreBean> list = service.showStore();
		return list;
	}

	// 按照頁面顯示店家
	@GetMapping("/show/pagingStoresData.json")
	public @ResponseBody List<StoreBean> showStoresByPageNo(
			@RequestParam(value = "pageNo", required = false, defaultValue = "1") Integer pageNo,
			Model model) {
		return service.showStoresByPageNo(pageNo);
	}
	
	//以區域顯示店家
	@GetMapping("/show/pagingStoresData.json/{area}")
	public @ResponseBody List<StoreBean> showStoresByArea(
			@RequestParam(value = "pageNo", required = false, defaultValue = "1") Integer pageNo,
			@PathVariable String area,
			Model model) {
		return service.showStoresByArea(pageNo, area);
	}
	
	// 顯示單筆店家資料
	@GetMapping(value = "show/showOneStore/{key}", produces = { "application/json" })
	public @ResponseBody StoreBean showStore(@PathVariable Integer key) {
		StoreBean sb = service.findByPK(key);
		return sb;
	}

	@GetMapping("/show/ShowStoresByPage")
	public String showByPage(Model model) {
		model.addAttribute("totalPages", service.getTotalPages());
		return "show/ShowStoresByPage";
	}

	@GetMapping("/show/showStoreAjax")
	public String showAll() {
		return "show/showStoreAjax";
	}

	@GetMapping("/show/showOneStoreAjax/{key}")
	public String showOne(@PathVariable Integer key, Model model) {
		model.addAttribute("sid", key);
		return "show/showOneStoreAjax";
	}
}
package com.oneorzero.product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oneorzero.bean.ProductBean;
import com.oneorzero.product.service.IProductService;

@Controller
public class ProductController {
	@Autowired
	IProductService service;

	// 負責將撈出的資料放在/product/ShowProductsByPage.jsp"頁面
	@GetMapping("/product/productlist.json")
	public @ResponseBody List<ProductBean> getAllProduct(Model model) { // @ResponseBody回傳jason字串
		return service.getAllProducts();

	}

	// 負責跳轉頁面,頁面連結
	@GetMapping("/product/ShowProductsByPage")
	public String showByPage(Model model) {
		model.addAttribute("totalProductPages", service.getTotalPages()); // 將頁碼總數傳給前端
		// 增加屬性,只有同一個jsp才看得到
		return "/product/ShowProductsByPage";
	}

	// 按照頁面顯示商品
	@GetMapping("/product/pagingProductsData.json")
	public @ResponseBody List<ProductBean> getProductsByPageNo(
			@RequestParam(value = "pageNo", required = false, defaultValue = "1") Integer pageNo,
			// 值 = 頁碼 //false表示不一定要給這個參數 //defaultValue為預設值為1
			Model model) {
		return service.getProductsByPageNo(pageNo);

	}

}

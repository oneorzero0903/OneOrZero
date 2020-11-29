<<<<<<< HEAD
package com.oneorzero.shppingCart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.oneorzero.bean.MemberBean;
import com.oneorzero.bean.ProductDetailBean;
import com.oneorzero.shppingCart.service.IShoppingCartService;

@Controller
@SessionAttributes({"member", "cartSize"})
public class ShoppingCartController {
	
	@Autowired
	IShoppingCartService service;
	
	@GetMapping("/shoppingCart/checkout") //跳轉頁面
	public String checkout(Model model) {
		if (model.getAttribute("member") != null ) {  //用戶已登入
			return "/shoppingCart/checkout";
		} else { //用戶未登入
			MemberBean mb = new MemberBean();  //產生空白表單用
			model.addAttribute("member", mb);  //spring將使用者輸入資料包裝成bean,送到後端比對
			return "redirect:/login/UserLogin";  //跳轉為都入頁面
		}
	}
	
	
	@PostMapping("/BuyProduct.do/{pid}") //表單
	public @ResponseBody Map<String, String> buy(@RequestBody String jsonStr, @PathVariable Integer pid, Model model) {
		//將數量與ProductBean 存入ProductDetailBean
		MemberBean mb = (MemberBean) model.getAttribute("member");
		Map<String, String> map = new HashMap<String, String>();
		if (mb == null) {
			map.put("loginFirst", "請先登入");
			return map;
		} else {
			JsonObject object = new Gson().fromJson(jsonStr, JsonObject.class);
			Integer quantity = object.get("quantity").getAsInt();
			service.buy(pid, quantity, mb);
			map.put("success", "已加入購物車, 購買數量" + quantity);
			return map;
		}
	}
	
	@GetMapping("/getShoppingList.do") //取得該會員的購物清單
	public @ResponseBody List<ProductDetailBean> shppoingList(Model model) {
		MemberBean mb = (MemberBean) model.getAttribute("member");
		List<ProductDetailBean> list = service.getMemberCart(mb.getMember_id());
		model.addAttribute("cartSize", list.size());
		return list;
	}
	
	@DeleteMapping("/dropItem.do")  //刪除購物車內商品
	public @ResponseBody List<ProductDetailBean> dropItem(@RequestBody String jsonStr ,Model model) {
		JsonObject object = new Gson().fromJson(jsonStr, JsonObject.class);
		int id = object.get("id").getAsInt();
		service.dropItem(id);
		MemberBean mb = (MemberBean) model.getAttribute("member");
		List<ProductDetailBean> list = service.getMemberCart(mb.getMember_id());
		model.addAttribute("cartSize", list.size());
		return list;
	}
	
	@PutMapping("/changeQuantity.do")  //修改購買數量
	public @ResponseBody List<ProductDetailBean> changeQuantity(@RequestBody String jsonStr ,Model model) {
		JsonObject object = new Gson().fromJson(jsonStr, JsonObject.class);
		int id = object.get("id").getAsInt();
		int newAmount = object.get("newAmount").getAsInt();
		service.changeNumber(id, newAmount);
		MemberBean mb = (MemberBean) model.getAttribute("member");
		List<ProductDetailBean> list = service.getMemberCart(mb.getMember_id());
		model.addAttribute("cartSize", list.size());
		return list;
	}
	
	@GetMapping("/clearShoppingCart.do")
	public String clearShoppingCart(Integer id, Model model, RedirectAttributes redirectAttributes) {
		MemberBean mb = (MemberBean) model.getAttribute("member");
		service.clearShoppingCart(mb.getMember_id());
		redirectAttributes.addFlashAttribute("ThanksForBuying", "感謝您的購買~");
		return "redirect:/shoppingCart/checkout";
	} 
	
}
=======
package com.oneorzero.shppingCart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.oneorzero.bean.MemberBean;
import com.oneorzero.bean.ProductDetailBean;
import com.oneorzero.shppingCart.service.IShoppingCartService;

@Controller
@SessionAttributes({"member", "cartSize"})
public class ShoppingCartController {
	
	@Autowired
	IShoppingCartService service;
	
	@GetMapping("/shoppingCart/checkout") //跳轉頁面
	public String checkout(Model model) {
		if (model.getAttribute("member") != null ) {  //用戶已登入
			return "/shoppingCart/checkout";
		} else { //用戶未登入
			MemberBean mb = new MemberBean();  //產生空白表單用
			model.addAttribute("member", mb);  //spring將使用者輸入資料包裝成bean,送到後端比對
			return "redirect:/login/UserLogin";  //跳轉為都入頁面
		}
	}
	
	
	@PostMapping("/BuyProduct.do/{pid}") //表單
	public @ResponseBody Map<String, String> buy(@RequestBody String jsonStr, @PathVariable Integer pid, Model model) {
		//將數量與ProductBean 存入ProductDetailBean
		MemberBean mb = (MemberBean) model.getAttribute("member");
		Map<String, String> map = new HashMap<String, String>();
		if (mb == null) {
			map.put("loginFirst", "請先登入");
			return map;
		} else {
			JsonObject object = new Gson().fromJson(jsonStr, JsonObject.class);
			Integer quantity = object.get("quantity").getAsInt();
			service.buy(pid, quantity, mb);
			map.put("success", "已加入購物車, 購買數量" + quantity);
			return map;
		}
	}
	
	@GetMapping("/getShoppingList.do") //取得該會員的購物清單
	public @ResponseBody List<ProductDetailBean> shppoingList(Model model) {
		MemberBean mb = (MemberBean) model.getAttribute("member");
		List<ProductDetailBean> list = service.getMemberCart(mb.getMember_id());
		model.addAttribute("cartSize", list.size());
		return list;
	}
	
	@DeleteMapping("/dropItem.do")  //刪除購物車內商品
	public @ResponseBody List<ProductDetailBean> dropItem(@RequestBody String jsonStr ,Model model) {
		JsonObject object = new Gson().fromJson(jsonStr, JsonObject.class);
		int id = object.get("id").getAsInt();
		service.dropItem(id);
		MemberBean mb = (MemberBean) model.getAttribute("member");
		List<ProductDetailBean> list = service.getMemberCart(mb.getMember_id());
		model.addAttribute("cartSize", list.size());
		return list;
	}
	
	@PutMapping("/changeQuantity.do")  //修改購買數量
	public @ResponseBody List<ProductDetailBean> changeQuantity(@RequestBody String jsonStr ,Model model) {
		JsonObject object = new Gson().fromJson(jsonStr, JsonObject.class);
		int id = object.get("id").getAsInt();
		int newAmount = object.get("newAmount").getAsInt();
		service.changeNumber(id, newAmount);
		MemberBean mb = (MemberBean) model.getAttribute("member");
		List<ProductDetailBean> list = service.getMemberCart(mb.getMember_id());
		model.addAttribute("cartSize", list.size());
		return list;
	}
	
	@GetMapping("/clearShoppingCart.do")
	public String clearShoppingCart(Integer id, Model model, RedirectAttributes redirectAttributes) {
		MemberBean mb = (MemberBean) model.getAttribute("member");
		service.clearShoppingCart(mb.getMember_id());
		redirectAttributes.addFlashAttribute("ThanksForBuying", "感謝您的購買~");
		return "redirect:/shoppingCart/checkout";
	} 
	
}
>>>>>>> f1b340708c8dd0adc4ffdf8f55f1fd7540ba6612

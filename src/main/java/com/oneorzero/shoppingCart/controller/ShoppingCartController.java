package com.oneorzero.shoppingCart.controller;

import java.util.ArrayList;
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
import com.oneorzero.shoppingCart.service.IShoppingCartService;
import com.oneorzero.util.SendMail;

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
	public @ResponseBody Map<String, Object> buy(@RequestBody String jsonStr, @PathVariable Integer pid, Model model) {
		//將數量與ProductBean 存入ProductDetailBean
		MemberBean mb = (MemberBean) model.getAttribute("member");
		Map<String, Object> map = new HashMap<String, Object>();
		if (mb == null) {
			map.put("loginFirst", "請先登入");
			return map;
		} else {
			JsonObject object = new Gson().fromJson(jsonStr, JsonObject.class);
			Integer quantity = object.get("quantity").getAsInt();
			service.buy(pid, quantity, mb);
			map.put("success", "已加入購物車");
			map.put("quantity", quantity);
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
		List<ProductDetailBean> list = service.getMemberCart(mb.getMember_id());
		SendMail send = new SendMail();
		ArrayList<String > path = new ArrayList<String>();	
		for(int i = 0 ; i < list.size() ; i ++) {
			path.add(list.get(i).getProduct().getImgPath());  //會將產品得照片路徑傳到信中 getter,setter
		}
		
		String content = "<h3>感謝您對我們的支持,您的支持是我們成長的動力!!</h3><p>Dear " + mb.getName() + "</p>";
		for(int i = 0 ; i < list.size() ; i ++) {
			content += "<div style='display: flex justify-content: center align-items: center;'>" +
//		        "<img src='cid:image" + list.get(i).getProduct().getImgPath() + "'>" +
		        "<div><table>" +
		        	"<tr><td><img style='width:250px;' src='cid:image" + i + "'></td></tr>" +
					"<tr><td>品名:" + list.get(i).getProduct().getName() +"</td></tr>"+
		            "<tr><td>數量:" + list.get(i).getQuantity() + "個</td></tr>" +
					"<tr><td>價格:" + list.get(i).getTotalAmount() + "元</td></tr>" +
					
		        "</table></div>" +
		    "</div>";
		}
	
		
		
		String subject = "search(\"咖啡\"); 購物清單";
//		String content = "<h3>感謝您對我們的支持,您的支持是我們成長的動力!!</h3>" + "Dear " + mb.getName() + "<br><br>";
//		for(int i = 0 ; i < list.size() ; i ++) {
//			content += (list.get(i).getQuantity()) + "個 ";
//			content += (list.get(i).getTotalAmount()) + "元<br>";
//			content += (list.get(i).getProduct().getName()) + "<br>";
//		}
//		content += mb.getName() + "<br><br>";
		send.sendEmailWithImage(mb.getEmail(), subject, content, path);
		
		service.clearShoppingCart(mb.getMember_id());
		redirectAttributes.addFlashAttribute("ThanksForBuying", "感謝您的購買~");
		return "redirect:/shoppingCart/checkout";
	}
	
	@PostMapping("/getCartQuantity.do")
	public @ResponseBody Map<String, Object> buy(Model model) {
		//將數量與ProductBean 存入ProductDetailBean
		Map<String, Object> map = new HashMap<String, Object>();
		MemberBean mb = (MemberBean) model.getAttribute("member");
		Integer mb_id = mb.getMember_id();
		Integer quantity = (int) service.getCartQuantity(mb_id);
		map.put("success", quantity);
		return map;
	}
	
	// 負責跳轉單筆店家資料頁面,頁面連結
	@GetMapping("/product/OrderProductHistory")
	public String OrderProductHistory(Model model) {
		if (model.getAttribute("member") != null ) {  //用戶已登入
			return "/product/OrderProductHistory";
		} else { //用戶未登入
			MemberBean mb = new MemberBean();  //產生空白表單用
			model.addAttribute("member", mb);  //spring將使用者輸入資料包裝成bean,送到後端比對
			return "redirect:/login/UserLogin";  //跳轉為都入頁面
		}
	}
	
	@GetMapping("/getOrderProductHistory.do") //取得該會員的購物清單
	public @ResponseBody List<ProductDetailBean> getOrderProductHistory(Model model) {
		MemberBean mb = (MemberBean) model.getAttribute("member");
		List<ProductDetailBean> list = service.getOrderProductHistory(mb.getMember_id());
		return list;
	}
	
}

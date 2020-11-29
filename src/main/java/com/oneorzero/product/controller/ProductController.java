<<<<<<< HEAD
package com.oneorzero.product.controller;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.oneorzero.bean.ProductBean;
import com.oneorzero.bean.ProgramBean;
import com.oneorzero.bean.StoreBean;
import com.oneorzero.product.service.IProductService;

@Controller
@SessionAttributes({ "store" })
public class ProductController {
	@Autowired
	IProductService service;

	@Autowired
	ServletContext servletContext;

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
			@RequestParam(value = "pageNo", required = false, defaultValue = "1") Integer pageNo, // RequestParam
																									// /OneOrZero/loginPage?帳號=123&密碼=555
			// 值 = 頁碼 //false表示不一定要給這個參數 //defaultValue為預設值為1
			Model model) {
		return service.getProductsByPageNo(pageNo);

	}

	// 顯示單筆店家資料
	@GetMapping(value = "/product/ShowOneProduct.json/{key}")
	public @ResponseBody ProductBean showProduct(@PathVariable Integer key) { // PathVariable --->
																				// /OneOrZero/ProductPage/coffee
		ProductBean pb = service.findByPK(key);
		return pb;
	}

	// 負責跳轉單筆店家資料頁面,頁面連結
	@GetMapping("/product/ShowOneProduct/{key}")
	public String showOneProduct(Model model, @PathVariable Integer key) {
		model.addAttribute("pId", key);
		return "/product/ShowOneProduct";
	}

	@GetMapping("/product/AddNewProduct") // 此方法會產生一個新增產品的空白表單,並負責控制頁面跳轉
	public String getEmptyAddNewProductForm(Model model) {
		StoreBean store = (StoreBean) model.getAttribute("store");
		if (store != null) { // 商家已登入,所以不為空
			boolean isBuy = service.checkProgram(store.getStore_id(), "programSM");
			if (isBuy) {
				ProductBean pu = new ProductBean();
				model.addAttribute("productBean", pu);
				return "product/AddNewProduct";
			} else {
				ProgramBean bean = new ProgramBean();
				model.addAttribute("programBean", bean);
				return "redirect:/program/buyProgramSM";
			}
		} else {
			StoreBean sb = new StoreBean();
			model.addAttribute("storeBean", sb);
			return "redirect:/login/StoreLogin";
		}

		// "productBean"此識別字 必須在三個地方都相同 1.GetMapping 2.PostMapping 3.相對應form:form中的
		// modelAttrubute屬性

	}

	// 注意使用者輸入資料是否完整,否則要處理
	@PostMapping("/product/AddNewProduct")
	public String addPNewroduct(@ModelAttribute("productBean") ProductBean pb, Model model) {
		Map<String, String> errorMsg = new HashMap<String, String>();
		model.addAttribute("ErrorMsg", errorMsg);

		// 回傳錯誤訊息 //防止使用者輸入空白
		if (pb.getName() == null || pb.getName().trim().length() == 0) {
			errorMsg.put("NameEmptyError", "產品名稱不可為空");
		}
		if (pb.getPrice() == null || pb.getPrice() <= 0) {
			errorMsg.put("PriceEmptyError", "請輸入正確價格");
		}
		if (pb.getStock() == null || pb.getStock() <= 0) {
			errorMsg.put("PriceEmptyError", "請輸入正確庫存數量");
		}
		if (!errorMsg.isEmpty()) { // Map 內有錯誤訊息forward回原本頁面
			return "product/AddNewProduct";
		} else {

			MultipartFile productImg = pb.getProductImg();
			String originalFilename = productImg.getOriginalFilename();
			pb.setFileName(originalFilename);

			// 建立Blob物件,交由Hibernate寫入DB
			if (productImg != null && !productImg.isEmpty()) {
				try {
					byte[] b = productImg.getBytes();
					Blob blob = new SerialBlob(b);
					pb.setBlobImg(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
				}
			}

			StoreBean store = (StoreBean) model.getAttribute("store");
			pb.setStore(store); // 將上架商店之id放在外鍵欄位
			service.insertAddProduct(pb);
			return "redirect:/product/showMyProduct"; // Map 內有沒有錯誤訊息redirect至其他頁面
														// redirect方法為成功新增或刪除資料時使用，可避免重新整理後表單重複送出之狀況
		}

	}
	// 把blob的內容轉換為圖片,顯示在網頁上

	@GetMapping("/getProductImg/{pid}")
	public ResponseEntity<byte[]> getAdImg(@PathVariable Integer pid) throws Exception {
		ResponseEntity<byte[]> re = null;
		InputStream is = null;
		String mimeType = null;
		ProductBean pb = service.findByPK(pid);
		if (pb != null) {
			Blob blob = pb.getBlobImg();
			if (blob != null) {
				is = blob.getBinaryStream();
				mimeType = servletContext.getMimeType(pb.getFileName());
			}
		}
		MediaType mediaType = MediaType.valueOf(mimeType);
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(mediaType);
		headers.setCacheControl(CacheControl.noCache().getHeaderValue()); // 不要存圖片到cache 每次要用得時候都去抓
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] b = new byte[81920];
		int len = 0;
		while ((len = is.read(b)) != -1) {
			baos.write(b, 0, len);
		}
		byte[] content = baos.toByteArray();
		re = new ResponseEntity<byte[]>(content, headers, HttpStatus.OK);
		return re;
	}

	@GetMapping("/showMyProduct.do")
	public @ResponseBody List<ProductBean> showMyProductajax(Model model) {
		StoreBean sb = (StoreBean) model.getAttribute("store");
		return service.showMyProduct(sb.getStore_id());
	}

	@GetMapping("/product/showMyProduct")
	public String showMyProduct() {
		return "/product/showMyProduct";
	}

	// 刪除資料單筆資料
	@DeleteMapping("/dropProduct.do")
	public @ResponseBody List<ProductBean> dropProduct(@RequestBody String jsonStr, Model model) {
		JsonObject object = new Gson().fromJson(jsonStr, JsonObject.class);
		int id = object.get("id").getAsInt();
		service.dropProduct(id);
		StoreBean sb = (StoreBean) model.getAttribute("store");
		return service.showMyProduct(sb.getStore_id());
	}

	@GetMapping("/product/ProductMgt")
	public String productMgt(Model model) {
		StoreBean store = (StoreBean) model.getAttribute("store");
		if (store != null) { // 商家已登入,所以不為空
			boolean isBuy = service.checkProgram(store.getStore_id(), "programSM");
			if (isBuy) {
				ProductBean pu = new ProductBean();
				model.addAttribute("productBean", pu);
				return "/product/ProductMgt";
			} else {
				ProgramBean bean = new ProgramBean();
				model.addAttribute("programBean", bean);
				return "redirect:/program/buyProgramSM";
			}
		} else {
			StoreBean sb = new StoreBean();
			model.addAttribute("storeBean", sb);
			return "redirect:/login/StoreLogin";
		}
	}

	@PutMapping("/updateProduct.do")
	public @ResponseBody List<ProductBean> updateProduct(@RequestBody String jsonStr, Model model) {
		JsonObject object = new Gson().fromJson(jsonStr, JsonObject.class);
		int id = object.get("id").getAsInt();
		try {
			String name = object.get("name").getAsString();
			Integer price = object.get("price").getAsInt();
			Integer stock = object.get("stock").getAsInt();
			String description = object.get("description").getAsString();
			if (name.trim().length() == 0 || name == null || price == null || price < 1 || stock == null || stock < 1) return null;
			service.updateProduct(name, price, stock, description, id);
			StoreBean sb = (StoreBean) model.getAttribute("store");
			return service.showMyProduct(sb.getStore_id());
		} catch (Exception e) {
			return null;
		}
	}

	
	@PostMapping("/ambiguousSearch.do")
	public @ResponseBody List<ProductBean> ambiguousSearch(@RequestBody String jsonStr, Model model) {
		JsonObject object = new Gson().fromJson(jsonStr, JsonObject.class);
		String searchStr = object.get("searchStr").getAsString();
		return service.ambiguousSearch(searchStr);
	}
	

	// 注意使用者輸入資料是否完整,否則要處理
//	@PostMapping("/product/AddNewProduct")
//	@PostMapping(value = "/product/AddNewProduct", consumes = { "application/json" }, produces = { "application/json" })
//	public  @ResponseBody Map<String, String> addPNewroduct(@RequestBody ProductBean pb, Model model) {
//		Map<String, String> map = new HashMap<>();
//		StoreBean store = (StoreBean) model.getAttribute("store");
//		store.setStore_id(store.getStore_id());
//		 
//		service.insertAddProduct(product);
//		map.put("status", "success");
//		return map;
//	}

}
=======
package com.oneorzero.product.controller;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.oneorzero.bean.ProductBean;
import com.oneorzero.bean.ProgramBean;
import com.oneorzero.bean.StoreBean;
import com.oneorzero.product.service.IProductService;

@Controller
@SessionAttributes({ "store" })
public class ProductController {
	@Autowired
	IProductService service;
	
	@Autowired
	ServletContext servletContext;

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
			@RequestParam(value = "pageNo", required = false, defaultValue = "1") Integer pageNo,   //RequestParam  /OneOrZero/loginPage?帳號=123&密碼=555
			// 值 = 頁碼 //false表示不一定要給這個參數 //defaultValue為預設值為1
			Model model) {
		return service.getProductsByPageNo(pageNo);

	}
	// 顯示單筆店家資料
	@GetMapping(value = "/product/ShowOneProduct.json/{key}")
	public @ResponseBody ProductBean showProduct(@PathVariable Integer key) {     //PathVariable   ---> /OneOrZero/ProductPage/coffee
		ProductBean pb = service.findByPK(key);
		return pb;
	}
	// 負責跳轉單筆店家資料頁面,頁面連結
	@GetMapping("/product/ShowOneProduct/{key}")
	public String showOneProduct(Model model, @PathVariable Integer key) {
		model.addAttribute("pId", key);
		return "/product/ShowOneProduct";
	}
	
	@GetMapping("/product/AddNewProduct")  //此方法會產生一個新增產品的空白表單,並負責控制頁面跳轉
	public String getEmptyAddNewProductForm(Model model) {
		StoreBean store = (StoreBean) model.getAttribute("store");
		if(store != null) {  //商家已登入,所以不為空
			boolean isBuy = service.checkProgram(store.getStore_id(), "programSM");
			if(isBuy) {
				ProductBean pu = new ProductBean();
				model.addAttribute("productBean",pu);
				return "product/AddNewProduct";
			}else {
				ProgramBean bean = new ProgramBean();
				model.addAttribute("programBean", bean);
				return "redirect:/program/buyProgramSM";
			}
		}else {
			StoreBean sb = new StoreBean();
			model.addAttribute("storeBean", sb);
			return "redirect:/login/StoreLogin";
		}
		
		  // "productBean"此識別字 必須在三個地方都相同 1.GetMapping 2.PostMapping 3.相對應form:form中的 modelAttrubute屬性
		
	}
	
	
	//注意使用者輸入資料是否完整,否則要處理
	@PostMapping("/product/AddNewProduct")
	public String addPNewroduct(@ModelAttribute("productBean") ProductBean pb,
								Model model) {
		Map<String, String> errorMsg = new HashMap<String, String>();
		model.addAttribute("ErrorMsg", errorMsg);
		
		  //回傳錯誤訊息               //防止使用者輸入空白
		if (pb.getName() == null|| pb.getName().trim().length() == 0 ) {
			errorMsg.put("NameEmptyError", "產品名稱不可為空");
		}
		if (pb.getPrice() == null|| pb.getPrice()<= 0 ) {
			errorMsg.put("PriceEmptyError", "請輸入正確價格");
		}
		if (pb.getStock() == null|| pb.getStock()<= 0 ) {
			errorMsg.put("PriceEmptyError", "請輸入正確庫存數量");
		}
		if (!errorMsg.isEmpty()) {  //Map 內有錯誤訊息forward回原本頁面
			return "product/AddNewProduct";
		} else {
			
			MultipartFile productImg = pb.getProductImg();
			String originalFilename = productImg.getOriginalFilename();
			pb.setFileName(originalFilename);
			
			//建立Blob物件,交由Hibernate寫入DB
			if (productImg != null && !productImg.isEmpty()) {
				try {
					byte[] b = productImg.getBytes();
					Blob blob = new SerialBlob(b);
					pb.setBlobImg(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常: "+e.getMessage());
				}
			}
			
			StoreBean store = (StoreBean) model.getAttribute("store");
			pb.setStore(store);  //將上架商店之id放在外鍵欄位
			service.insertAddProduct(pb);
			return "redirect:/product/showMyProduct";  //Map 內有沒有錯誤訊息redirect至其他頁面  redirect方法為成功新增或刪除資料時使用，可避免重新整理後表單重複送出之狀況
		}
		
		
	}
	//把blob的內容轉換為圖片,顯示在網頁上
	
	@GetMapping("/getProductImg/{pid}")
	public ResponseEntity<byte[]> getAdImg(@PathVariable Integer pid) throws Exception {
		ResponseEntity<byte[]> re = null;
		InputStream is = null;
		String mimeType = null;
		ProductBean pb = service.findByPK(pid);
		if (pb != null) {
			Blob blob = pb.getBlobImg();
			if (blob != null) {
				is = blob.getBinaryStream();
				mimeType = servletContext.getMimeType(pb.getFileName());
			}
		}
		MediaType mediaType = MediaType.valueOf(mimeType);
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(mediaType);
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());  //不要存圖片到cache 每次要用得時候都去抓
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] b = new byte[81920];
		int len = 0;
		while ((len = is.read(b)) != -1) {
			baos.write(b, 0, len);
		}
		byte[] content = baos.toByteArray();
		re = new ResponseEntity<byte[]>(content, headers, HttpStatus.OK);
		return re;
	}
	
	@GetMapping("/showMyProduct.do")
	public @ResponseBody List<ProductBean> showMyProductajax(Model model) {
		StoreBean sb = (StoreBean) model.getAttribute("store");
		return service.showMyProduct(sb.getStore_id());
	}
	
	@GetMapping("/product/showMyProduct")
	public String showMyProduct() {
		return "/product/showMyProduct";
	}
	
	@DeleteMapping("/dropProduct.do")
	public @ResponseBody List<ProductBean> dropProduct(@RequestBody String jsonStr, Model model) {
		JsonObject object = new Gson().fromJson(jsonStr, JsonObject.class);
		int id = object.get("id").getAsInt();
		service.dropProduct(id);
		StoreBean sb = (StoreBean) model.getAttribute("store");
		return service.showMyProduct(sb.getStore_id());
	}
	
	@GetMapping("/product/ProductMgt")
	public String productMgt() {
		return "/product/ProductMgt";
	}
	
	@PutMapping("/updateProduct.do")
	public @ResponseBody List<ProductBean> updateProduct(@RequestBody String jsonStr, Model model) {
		JsonObject object = new Gson().fromJson(jsonStr, JsonObject.class);
		int id = object.get("id").getAsInt();
		String name = object.get("name").getAsString();
		Integer price = object.get("price").getAsInt();
		Integer stock = object.get("stock").getAsInt();
		String description = object.get("description").getAsString();
		service.updateProduct(name, price, stock, description, id);
		StoreBean sb = (StoreBean) model.getAttribute("store");
		return service.showMyProduct(sb.getStore_id());
	}
	
	//注意使用者輸入資料是否完整,否則要處理
//	@PostMapping("/product/AddNewProduct")
//	@PostMapping(value = "/product/AddNewProduct", consumes = { "application/json" }, produces = { "application/json" })
//	public  @ResponseBody Map<String, String> addPNewroduct(@RequestBody ProductBean pb, Model model) {
//		Map<String, String> map = new HashMap<>();
//		StoreBean store = (StoreBean) model.getAttribute("store");
//		store.setStore_id(store.getStore_id());
//		 
//		service.insertAddProduct(product);
//		map.put("status", "success");
//		return map;
//	}

}
>>>>>>> f1b340708c8dd0adc4ffdf8f55f1fd7540ba6612

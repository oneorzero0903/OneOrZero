package com.oneorzero.advertising.controller;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.oneorzero.advertising.service.IAdvertisingService;
import com.oneorzero.bean.AdvertisingBean;
import com.oneorzero.bean.MemberBean;
import com.oneorzero.bean.ProgramBean;
import com.oneorzero.bean.StoreBean;
import com.oneorzero.util.SendMail;

@Controller
@SessionAttributes({"store", "member"})
public class AdvertisingController {
	
	@Autowired
	IAdvertisingService service;
	
	@Autowired
	ServletContext servletContext;
	
	//廣告自動上下架功能
	@GetMapping("/ad/adList.json")
	public @ResponseBody List<AdvertisingBean> showOKAd() {
		return service.showOKAd();
	}
	
	@GetMapping("/ad/buyAd")
	public synchronized String getBuyAdForm(Model model) {
		StoreBean store = (StoreBean) model.getAttribute("store");
		if (store != null) { // 商家已登入,所以不為空  //商家要登入才可進入廣告設定頁面
			boolean isBuy = service.checkProgram(store.getStore_id(), "programAD");
			if (isBuy) {
				AdvertisingBean ab = new AdvertisingBean();
				model.addAttribute("advertisingBean", ab);
				return "ad/buyAd";
			} else {
				ProgramBean bean = new ProgramBean();
				model.addAttribute("programBean", bean);
				return "redirect:/program/buyProgramAD";
			}
		} else {	    //尚未登入,返回商家登入頁面
			StoreBean sb = new StoreBean();
			model.addAttribute("storeBean", sb);
			return "redirect:/login/StoreLogin";
		}
	}
	
	@PostMapping("/ad/buyAd")
	public String buyAd(@ModelAttribute("advertisingBean") AdvertisingBean adBean,
						Model model){
		
		if(adBean.getTitle() == null || adBean.getTitle().trim().length() == 0) {
			return "ad/buyAd";
		}
		if(adBean.getAdStartTime() == null) {
			return "ad/buyAd";
		}
		StoreBean sb = (StoreBean) model.getAttribute("store");
		adBean.setStore(sb);
		Long adStartTime = adBean.getAdStartTime();
		
		Long startTime = adStartTime;
		Long adEndTime = startTime +7*24*60*60*1000; //投放7天
		adBean.setAdStartTime(startTime);
		adBean.setAdEndTime(adEndTime);
		
		MultipartFile adImage = adBean.getAdImage();
		String originalFilename = adImage.getOriginalFilename();
		adBean.setFileName(originalFilename);
		
 		adBean.setStatus("ok");  //目前測
		
		//建立Blob物件,交由Hibernate寫入DB
		if (adImage != null && !adImage.isEmpty()) {
			try {
				byte[] b = adImage.getBytes();
				Blob blob = new SerialBlob(b);
				adBean.setBlobImg(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: "+e.getMessage());
			}
		}
		
		if (service.buyAd(adBean)) {
			return "redirect:/indexShop";
		} else {
			model.addAttribute("ErrorMsg", "此段期間已有投放廣告");
			return "ad/buyAd";
		}
		
	}
	
	@GetMapping("/getAdImg/{ad_id}")
	public ResponseEntity<byte[]> getAdImg(@PathVariable Integer ad_id) throws Exception {
		ResponseEntity<byte[]> re = null;
		InputStream is = null;
		String mimeType = null;
		AdvertisingBean adBean = service.findByPK(ad_id);
		if (adBean != null) {
			Blob blob = adBean.getBlobImg();
			if (blob != null) {
				is = blob.getBinaryStream();
				mimeType = servletContext.getMimeType(adBean.getFileName());
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
	
	@PostMapping("/sendV2Mail.do")   //寄出vip2 專屬優惠信件
	public @ResponseBody Map<String, String> sendV2Mail(@RequestBody String jsonStr, Model model) {
		JsonObject object = new Gson().fromJson(jsonStr, JsonObject.class);
		Integer id = object.get("store_id").getAsInt();
		StoreBean sb = service.getStore(id);
		MemberBean mb = (MemberBean) model.getAttribute("member");
		SendMail send = new SendMail();
		ArrayList<String > path = new ArrayList<String>();
		path.add("/images/discountMail.png");
		String subject = "search(\"咖啡\"); 專屬優惠券";
		String content = "<h3>感謝您平時對我們的支持</h3>";
		content += sb.getStore_name() + "<br><br>";
		send.sendEmailWithImage(mb.getEmail(), subject, content, path);
		Map<String, String> map = new HashMap<String, String>();
		map.put("data", "success");
		return map;
	}
	
	@GetMapping("/timeMachine.do")
	public String timeMachine() {  // Demo廣告下架按鍵
		service.timeMachine();
		return "redirect:/";
	}
}

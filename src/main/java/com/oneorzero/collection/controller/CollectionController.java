package com.oneorzero.collection.controller;

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

import com.oneorzero.bean.PaymentBean;
import com.oneorzero.bean.StoreBean;
import com.oneorzero.collection.model.GetPaymentDtlRequest;
import com.oneorzero.collection.model.GetPaymentDtlResponse;
import com.oneorzero.collection.model.RemarkUpdateRequest;
import com.oneorzero.collection.service.ICollectionService;
import com.oneorzero.util.SendMail;

@Controller
@SessionAttributes({ "store", "paymentDtlList", "paymentDtl", "emailList", "autodilerList", "autodilerRemarkDtl", "depositList" })
public class CollectionController {

	@Autowired
	ICollectionService service;

	@GetMapping("/collection/collection")
	public String collection(Model model) {
		return "collection/collection";
	}

	@GetMapping("/collection/payment")
	public String getPayment(Model model) {
		return "collection/payment";
	}

	@GetMapping("/collection/calculation")
	public @ResponseBody Map<String, String> calculation(Model model) {// 欠款計算Demo用
		try {
			Map<String, String> map = new HashMap<>();
			boolean isSuccess = service.calculation();
			if (isSuccess) {
				map.put("isOk", "ok");
			} else {
				map.put("isOk", "fail");
			}
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@GetMapping("/collection/demo")
	public @ResponseBody Map<String, String> demo(Model model) {// 欠款計算Demo用
		try {
			Map<String, String> map = new HashMap<>();
			boolean isSuccess = service.demo();
			if (isSuccess) {
				map.put("isOk", "ok");
			} else {
				map.put("isOk", "fail");
			}
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@PostMapping(value = "/collection/getPaymentDtl", consumes = { "application/json" }, produces = {
			"application/json" })
	public @ResponseBody Map<String, List<GetPaymentDtlResponse>> getPaymentDtl(
			@RequestBody GetPaymentDtlRequest searchVal, Model model) {// 取得查詢帳號之每筆欠款資訊
		try {
			Map<String, List<GetPaymentDtlResponse>> map = new HashMap<>();
			List<GetPaymentDtlResponse> paymentDtlList = service.getPaymentDtl(searchVal.getSearchVal());
			model.addAttribute("paymentDtlList", paymentDtlList);
			map.put("paymentDtlList", paymentDtlList);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@PostMapping(value = "/collection/paymentDtl/{id}", consumes = { "application/json" }, produces = {
			"application/json" })
	public @ResponseBody Map<String, String> paymentDtl(@PathVariable Integer id, Model model) {// 查詢單筆資訊
		Map<String, String> map = new HashMap<>();
		List<GetPaymentDtlResponse> paymentDtlList = (List<GetPaymentDtlResponse>) model.getAttribute("paymentDtlList");
		model.addAttribute("paymentDtl", paymentDtlList.get(id));
		map.put("isOk", "ok");
		return map;
	}

	@GetMapping("/collection/paymentDtl")
	public String paymentDtl(Model model) {// 單筆帳務資訊小頁面
		return "collection/paymentDtl";
	}

	@GetMapping("/collection/emailList")
	public String emailList(Model model) {// email
		return "collection/email";
	}

	@PostMapping(value = "/collection/getEmailList", consumes = { "application/json" }, produces = {
			"application/json" })
	public @ResponseBody Map<String, List<GetPaymentDtlResponse>> getEmailList(Model model) {// email
		Map<String, List<GetPaymentDtlResponse>> map = new HashMap<>();
		List<GetPaymentDtlResponse> emailList = service.emailList();
		if (emailList != null) {
			model.addAttribute("emailList", emailList);
			map.put("emailList", emailList);
		} else {
			map.put("emailList", null);
		}
		return map;
	}

	@SuppressWarnings("unchecked")
	@PostMapping(value = "/collection/sendmail", consumes = { "application/json" }, produces = { "application/json" })
	public @ResponseBody Map<String, String> sendMail(Model model) {// 寄送mail
		Map<String, String> map;
		try {
			map = new HashMap<>();
			List<GetPaymentDtlResponse> emailList = (List<GetPaymentDtlResponse>) model.getAttribute("emailList");
			SendMail send = new SendMail();
			for (int i = 0; i < emailList.size(); i++) {
				String mail = emailList.get(i).getEmail();
				String subject = emailList.get(i).getStore_name() + " 帳款未繳通知";
				String content = "<h2>您好:";
				content += "<h2>貴公司本期費用" + emailList.get(i).getBalance_due() + "還未繳清，</h2><br>";
				content += "<h2>為了避免您的權益受到損失，再請您盡速繳款，謝謝</h2><br>";
				content += "<h2>OneOrZero敬上<h2><br><br>";
				content += "<h2>(此為系統郵件，請勿回覆)</h2><br>";
				send.sendEmail(mail, subject, content);
				service.sendMail(emailList.get(i));
			}
			boolean isSuccess = true;
			if (isSuccess) {
				map.put("isOk", "ok");
			} else {
				map.put("isOk", "fail");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return map;
	}

	@GetMapping("/collection/autodilerList")
	public String autodilerList(Model model) {// email
		return "collection/autodiler";
	}

	@PostMapping(value = "/collection/getAutodilerList", consumes = { "application/json" }, produces = {
			"application/json" })
	public @ResponseBody Map<String, List<GetPaymentDtlResponse>> getAutodilerList(Model model) {// email
		Map<String, List<GetPaymentDtlResponse>> map = new HashMap<>();
		List<GetPaymentDtlResponse> autodilerList = service.autodilerList();
		if (autodilerList != null) {
			model.addAttribute("autodilerList", autodilerList);
			map.put("autodilerList", autodilerList);
		} else {
			map.put("autodilerList", null);
		}
		return map;
	}

	@SuppressWarnings("unchecked")
	@PostMapping(value = "/collection/autodilerRemark/{id}", consumes = { "application/json" }, produces = {
			"application/json" })
	public @ResponseBody Map<String, String> autodilerRemark(@PathVariable Integer id, Model model) {// 查詢單筆資訊
		Map<String, String> map = new HashMap<>();
		List<GetPaymentDtlResponse> autodilerRemarkDtl = (List<GetPaymentDtlResponse>) model
				.getAttribute("autodilerList");
		model.addAttribute("autodilerRemarkDtl", autodilerRemarkDtl.get(id));
		map.put("isOk", "ok");
		return map;
	}

	@GetMapping("/collection/autodilerRemarkDtl")
	public String autodilerRemark(Model model) {// 單筆帳務資訊小頁面
		return "collection/autodilerRemarkDtl";
	}

	@PostMapping(value = "/collection/autodilerRemarkUpdate", consumes = { "application/json" }, produces = {
			"application/json" })
	public @ResponseBody Map<String, String> autodilerRemarkUpdate(@RequestBody RemarkUpdateRequest remarkUpdateRequest,
			Model model) {
		try {
			Map<String, String> map = new HashMap<>();
			boolean isSuccess = service.autodilerRemarkUpdate(remarkUpdateRequest);
			if (isSuccess) {
				map.put("isOk", "ok");
			} else {
				map.put("isOk", "fail");
			}
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@GetMapping("/collection/depositList")
	public String depositList(Model model) {// email
		return "collection/deposit";
	}

	@PostMapping(value = "/collection/getDepositList", consumes = { "application/json" }, produces = {
			"application/json" })
	public @ResponseBody Map<String, List<GetPaymentDtlResponse>> getDepositList(Model model) {// email
		Map<String, List<GetPaymentDtlResponse>> map = new HashMap<>();
		List<GetPaymentDtlResponse> depositList = service.depositList();
		if (depositList != null) {
			model.addAttribute("depositList", depositList);
			map.put("depositList", depositList);
		} else {
			map.put("depositList", null);
		}
		return map;
	}
	
	@GetMapping("/isFunctDisabled")
	public @ResponseBody List<PaymentBean> isFunctDisalbed(Integer store_id, Model model) {
		StoreBean sb = (StoreBean) model.getAttribute("store");
		return service.functIsDisabled(sb.getStore_id());
	}

}

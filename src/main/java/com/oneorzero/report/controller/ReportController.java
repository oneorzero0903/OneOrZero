package com.oneorzero.report.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.oneorzero.report.model.AreaTotalAmountReport;
import com.oneorzero.report.model.OrderAmountByDays;
import com.oneorzero.report.model.OrderAmountByTimes;
import com.oneorzero.report.model.PaymentCityMonth;
import com.oneorzero.report.model.ProductItems;
import com.oneorzero.report.service.IReportService;

@Controller
@SessionAttributes({"member"})
public class ReportController {

	@Autowired
	IReportService reportService;
	
	@GetMapping("/report/report")
	public String areaAmountByCity(){
		return "report/report";
	}

	@GetMapping("/report/computedAreaAmountByCity")
	public @ResponseBody List<AreaTotalAmountReport> computedAreaAmountByCity(
			@RequestParam(value = "city") String city) {
		return reportService.computedAreaAmountByCity(city);
	}
	
	@GetMapping("/report/computedOrderAmountByDays")
	public @ResponseBody List<OrderAmountByDays> computedOrderAmountByDays(
			@RequestParam(value = "area") String area) {
		return reportService.computedOrderByDays(area);
	}
	
	@GetMapping("/report/computedOrderAmountByTimes")
	public @ResponseBody List<OrderAmountByTimes> computedOrderAmountByTimes(
			@RequestParam(value = "area") String area) {
		return reportService.computedOrderByTimes(area);
	}
	
	@GetMapping("/report/computedPaymentAreaMonth")
	public @ResponseBody List<PaymentCityMonth> computedPaymentCityMonth(
			@RequestParam(value = "month") String month, 
			@RequestParam(value = "city") String city) {
		return reportService.computedPaymentCityMonth(month, city);
	}
	
	
	@GetMapping("/report/computedProductItems")
	public @ResponseBody List<ProductItems> computedProductItems(
			@RequestParam(value = "pType") String type){
		return reportService.computedProductItems(type);
	}
}
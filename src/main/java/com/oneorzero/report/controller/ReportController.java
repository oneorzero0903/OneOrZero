package com.oneorzero.report.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.oneorzero.report.model.AreaTotalAmountReport;
import com.oneorzero.report.model.AreaTotalOrderByCustomer;
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
	
	@GetMapping("/report/computedAreaOrderByCustomer")
	public @ResponseBody List<AreaTotalOrderByCustomer> compuAreaTotalOrderByCustomer(
			@RequestParam(value = "city") String city) {
		return reportService.computedAreaOrderByCustomer(city);
	}
	
	@GetMapping("/report/computedProductItems")
	public @ResponseBody List<ProductItems> computedProductItems(
			@RequestParam(value = "type") String type){
		return reportService.computedProductItems(type);
	}
}
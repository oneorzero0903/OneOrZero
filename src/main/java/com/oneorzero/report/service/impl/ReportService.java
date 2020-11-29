package com.oneorzero.report.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oneorzero.bean.ProductBean;
import com.oneorzero.report.dao.IReportDao;
import com.oneorzero.report.model.AreaTotalAmountReport;
<<<<<<< HEAD
import com.oneorzero.report.model.OrderAmountByDays;
import com.oneorzero.report.model.OrderAmountByTimes;
import com.oneorzero.report.model.PaymentCityMonth;
=======
import com.oneorzero.report.model.AreaTotalOrderByCustomer;
>>>>>>> f1b340708c8dd0adc4ffdf8f55f1fd7540ba6612
import com.oneorzero.report.model.ProductItems;
import com.oneorzero.report.service.IReportService;

@Service
@Transactional
public class ReportService implements IReportService {
	
	private List<String> days = Arrays.asList("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday");

	@Autowired
	IReportDao dao;

	@Override
	public List<AreaTotalAmountReport> computedAreaAmountByCity(String city) {
		return dao.computedAreaAmountByCity(city);
	}

	@Override
	public List<OrderAmountByDays> computedOrderByDays(String area) {
		List<OrderAmountByDays> orderAmountByDays = dao.computedOrderByDays(area);
		Map<String, List<Integer>> orderAmount = new HashMap<>();
		orderAmountByDays.forEach(amount -> {
			if (orderAmount.get(amount.getDay()) == null) {
				orderAmount.put(amount.getDay(), new ArrayList<Integer>());
			}
			orderAmount.get(amount.getDay()).add(amount.getAmount());
		});
		
		List<OrderAmountByDays> result = new ArrayList<OrderAmountByDays>();
		days.forEach(day -> {
			OrderAmountByDays orderAmountByDay = new OrderAmountByDays();
			orderAmountByDay.setDay(day);
			if (orderAmount.get(day) != null) {
				orderAmountByDay.setAmount(orderAmount.get(day).stream().reduce(0, (a,b) -> a + b));
			}
			result.add(orderAmountByDay);
		});
		return result;
	}
	
	@Override
	public List<OrderAmountByTimes> computedOrderByTimes(String area) {
		List<String> orderAmountByTimes = dao.computedOrderByTimes(area);
		Map<Integer, Integer> orderAmount = new HashMap<>();
		orderAmountByTimes.forEach(amount -> {
			int parseAmount = Integer.parseInt(amount.replace(":", ""));
			int level = parseAmount / 200;
			if (orderAmount.get(level) == null) {
				orderAmount.put(level, 0);
			}
			int amountPlus = orderAmount.get(level) + 1;
			orderAmount.put(level, amountPlus);
		});
		
		List<OrderAmountByTimes> result = new ArrayList<OrderAmountByTimes>();
		for (int i = 0; i < 12; i ++) {
			String time = String.format("%02d", i * 2) + "~" + String.format("%02d", (i+1) * 2) + "時";
			OrderAmountByTimes orderAmountByTime = new OrderAmountByTimes();
			orderAmountByTime.setTime(time);
			orderAmountByTime.setAmount(orderAmount.get(i));
			result.add(orderAmountByTime);
		}
		return result;
	}

	@Override
	public List<PaymentCityMonth> computedPaymentCityMonth(String month, String city) {
		List<PaymentCityMonth> citymonths = dao.computedPaymentCityMonth(month, city);
		Map<String, Map<String, ArrayList<Integer>>> areaAmount = new HashMap<>(); 
		citymonths.forEach(citymonth -> {
			if (areaAmount.get(citymonth.getArea()) == null) {
				Map<String, ArrayList<Integer>> amount = new HashMap<>();
				amount.put("receivable", new ArrayList<Integer>());
				amount.put("actual", new ArrayList<Integer>());
				areaAmount.put(citymonth.getArea(), amount);
			}
			areaAmount.get(citymonth.getArea()).get("receivable").add(citymonth.getReceivable());
			areaAmount.get(citymonth.getArea()).get("actual").add(citymonth.getActual());
		});
		List<PaymentCityMonth> result = new ArrayList<PaymentCityMonth>();
		areaAmount.forEach((key, value) -> {
			PaymentCityMonth paymentCityMonth = new PaymentCityMonth();
			paymentCityMonth.setArea(key);
			int recievableAmount = value.get("receivable").stream().reduce(0, (a,b) -> a + b);
			int actualAmount = value.get("actual").stream().reduce(0, (a,b) -> a + b);
			paymentCityMonth.setReceivable(recievableAmount);
			paymentCityMonth.setActual(actualAmount);
			result.add(paymentCityMonth);
		});
		return result;
	}
	
	@Override
	public List<ProductItems> computedProductItems(String type) {
		return dao.computedProductItems(type);
	}

	@Override
	public List<ProductItems> computedProductItems(String type) {
		return dao.computedProductItems(type);
	}
}
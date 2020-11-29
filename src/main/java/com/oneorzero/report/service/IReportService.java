package com.oneorzero.report.service;

import java.util.List;

import com.oneorzero.report.model.AreaTotalAmountReport;
import com.oneorzero.report.model.OrderAmountByDays;
import com.oneorzero.report.model.OrderAmountByTimes;
import com.oneorzero.report.model.PaymentCityMonth;
import com.oneorzero.report.model.ProductItems;

public interface IReportService {
	List<AreaTotalAmountReport> computedAreaAmountByCity(String city);

	List<PaymentCityMonth> computedPaymentCityMonth(String month, String city);
	
	List<ProductItems> computedProductItems(String type);

	List<OrderAmountByDays> computedOrderByDays(String area);

	List<OrderAmountByTimes> computedOrderByTimes(String area);
	
}
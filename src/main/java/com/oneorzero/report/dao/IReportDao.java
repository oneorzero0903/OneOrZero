package com.oneorzero.report.dao;

 import java.util.List;

import com.oneorzero.report.model.AreaTotalAmountReport;
import com.oneorzero.report.model.OrderAmountByDays;
import com.oneorzero.report.model.PaymentCityMonth;
import com.oneorzero.report.model.ProductItems;

 public interface IReportDao {
	 List<AreaTotalAmountReport> computedAreaAmountByCity(String city);

	 List<OrderAmountByDays> computedOrderByDays(String area);
	 
	 List<PaymentCityMonth> computedPaymentCityMonth(String month, String city);
	 
	 List<ProductItems> computedProductItems(String type);

	List<String> computedOrderByTimes(String area);
	 
 }
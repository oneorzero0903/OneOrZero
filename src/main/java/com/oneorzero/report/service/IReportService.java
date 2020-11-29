package com.oneorzero.report.service;

import java.util.List;

import com.oneorzero.report.model.AreaTotalAmountReport;
<<<<<<< HEAD
import com.oneorzero.report.model.OrderAmountByDays;
import com.oneorzero.report.model.OrderAmountByTimes;
import com.oneorzero.report.model.PaymentCityMonth;
=======
import com.oneorzero.report.model.AreaTotalOrderByCustomer;
>>>>>>> f1b340708c8dd0adc4ffdf8f55f1fd7540ba6612
import com.oneorzero.report.model.ProductItems;

public interface IReportService {
	List<AreaTotalAmountReport> computedAreaAmountByCity(String city);

<<<<<<< HEAD
	List<PaymentCityMonth> computedPaymentCityMonth(String month, String city);
	
	List<ProductItems> computedProductItems(String type);

	List<OrderAmountByDays> computedOrderByDays(String area);

	List<OrderAmountByTimes> computedOrderByTimes(String area);
	
=======
	List<AreaTotalOrderByCustomer> computedAreaOrderByCustomer(String city);

	List<ProductItems> computedProductItems(String type);
>>>>>>> f1b340708c8dd0adc4ffdf8f55f1fd7540ba6612
}
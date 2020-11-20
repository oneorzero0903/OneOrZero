package com.oneorzero.report.dao;

 import java.util.List;

import com.oneorzero.report.model.AreaTotalAmountReport;
import com.oneorzero.report.model.AreaTotalOrderByCustomer;
import com.oneorzero.report.model.ProductItems;

 public interface IReportDao {
	 List<AreaTotalAmountReport> computedAreaAmountByCity(String city);

	 List<AreaTotalOrderByCustomer> computedAreaOrderByCustomer(String city);
	 
	 List<ProductItems> computedProductItems(String type);
 }
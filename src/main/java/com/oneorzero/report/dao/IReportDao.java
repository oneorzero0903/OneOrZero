package com.oneorzero.report.dao;

 import java.util.List;

 import com.oneorzero.bean.StoreBean;
import com.oneorzero.report.model.AreaTotalAmountReport;
import com.oneorzero.report.model.AreaTotalOrderByCustomer;

 public interface IReportDao {
	 List<AreaTotalAmountReport> computedAreaAmountByCity(String city);

	List<AreaTotalOrderByCustomer> computedAreaOrderByCustomer(String city);
 }
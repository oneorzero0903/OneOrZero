package com.oneorzero.report.service;

import java.util.List;

import com.oneorzero.bean.StoreBean;
import com.oneorzero.report.model.AreaTotalAmountReport;

public interface IReportService {
	List<AreaTotalAmountReport> computedAreaAmountByCity(String city);
}
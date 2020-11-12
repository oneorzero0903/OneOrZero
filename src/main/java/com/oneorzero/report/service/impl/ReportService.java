package com.oneorzero.report.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oneorzero.report.dao.IReportDao;
import com.oneorzero.report.model.AreaTotalAmountReport;
import com.oneorzero.report.model.AreaTotalOrderByCustomer;
import com.oneorzero.report.service.IReportService;

@Service
@Transactional
public class ReportService implements IReportService {

	@Autowired
	IReportDao dao;

	@Override
	public List<AreaTotalAmountReport> computedAreaAmountByCity(String city) {
		return dao.computedAreaAmountByCity(city);
	}

	@Override
	public List<AreaTotalOrderByCustomer> computedAreaOrderByCustomer(String city) {
		return dao.computedAreaOrderByCustomer(city);
	}
}
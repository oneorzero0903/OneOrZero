package com.oneorzero.report.dao.impl;

 import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oneorzero.report.dao.IReportDao;
import com.oneorzero.report.model.AreaTotalAmountReport;
import com.oneorzero.report.model.AreaTotalOrderByCustomer;

 @Repository
 public class ReportDao implements IReportDao{

 	@Autowired
 	SessionFactory factory;

 	@Override
 	public List<AreaTotalAmountReport> computedAreaAmountByCity(String city) {
 		String hql = "select address_area, count(address_area) as amount from StoreBean sb where address_city = :city group by address_area";
 		Session session = factory.getCurrentSession();
 		List list = session.createQuery(hql).setParameter("city", city).list();
 		Iterator it = list.iterator();
 		List<AreaTotalAmountReport> reports = new ArrayList<AreaTotalAmountReport>();
 		while (it.hasNext()) {
 			Object[] results = (Object[]) it.next();
 			AreaTotalAmountReport report = new AreaTotalAmountReport();
 			report.setArea((String) results[0]);
 			report.setAmount((Long) results[1]);
 			reports.add(report);
 		}
 		return reports;
 	}

	@Override
	public List<AreaTotalOrderByCustomer> computedAreaOrderByCustomer(String city) {
		String hql = "select times, count(peple_count) as amount from OrdersBean sb where address_city = :city group by address_aeea";
		Session session = factory.getCurrentSession();
		List list = session.createQuery(hql).setParameter("city", city).list();
		Iterator it = list.iterator();
 		List<AreaTotalOrderByCustomer> reports = new ArrayList<AreaTotalOrderByCustomer>();
 		while (it.hasNext()) {
 			Object[] results = (Object[]) it.next();
 			AreaTotalOrderByCustomer report = new AreaTotalOrderByCustomer();
 			report.setArea((String) results[0]);
 			report.setAmount((Long) results[1]);
 			reports.add(report);
 		}
 		return reports;
	}
 }
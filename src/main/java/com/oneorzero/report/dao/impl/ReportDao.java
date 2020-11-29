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
<<<<<<< HEAD
import com.oneorzero.report.model.OrderAmountByDays;
import com.oneorzero.report.model.PaymentCityMonth;
=======
import com.oneorzero.report.model.AreaTotalOrderByCustomer;
>>>>>>> f1b340708c8dd0adc4ffdf8f55f1fd7540ba6612
import com.oneorzero.report.model.ProductItems;

@Repository
@SuppressWarnings("rawtypes")
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
<<<<<<< HEAD
	public List<OrderAmountByDays> computedOrderByDays(String area) {
		String hql = "select days, count(ob.days) from OrdersBean ob LEFT JOIN StoreBean sb "
				+ "ON ob.store_id = sb.store_id "
				+ "where sb.address_area = :area "
				+ "group by days"; 
		Session session = factory.getCurrentSession();
		List list = session.createNativeQuery(hql).setParameter("area", area).list();
=======
	public List<AreaTotalOrderByCustomer> computedAreaOrderByCustomer(String city) {
		String hql="from OrdersBean"; 
		Session session = factory.getCurrentSession();
		session.createNativeQuery(hql);
		List list = session.createQuery(hql).setParameter("city", city).list();
>>>>>>> f1b340708c8dd0adc4ffdf8f55f1fd7540ba6612
		Iterator it = list.iterator();
 		List<OrderAmountByDays> reports = new ArrayList<OrderAmountByDays>();
 		while (it.hasNext()) {
 			Object[] results = (Object[]) it.next();
<<<<<<< HEAD
 			OrderAmountByDays report = new OrderAmountByDays();
 			report.setDay((String) results[0]); 
 			report.setAmount((Integer) results[1]);
 			reports.add(report);
 		}
 		return reports;
	}
	
	@Override
	public List<String> computedOrderByTimes(String area) {
		String hql = "select times from OrdersBean ob LEFT JOIN StoreBean sb "
				+ "ON ob.store_id = sb.store_id "
				+ "where sb.address_area = :area "; 
		Session session = factory.getCurrentSession();
		List<String> list = session.createNativeQuery(hql).setParameter("area", area).list();
		return list;
	}
	
	@Override
	public List<PaymentCityMonth> computedPaymentCityMonth(String month, String city){
		String hql ="select PaymentBean.receivable, PaymentBean.actual, StoreBean.address_area from PaymentBean "
				+ "LEFT JOIN StoreBean "
				+ "ON PaymentBean.store_id =StoreBean.store_id "
				+ "where SUBSTRING(PaymentBean.month, 5, 2) = :month and StoreBean.address_city =:city";
		Session session = factory.getCurrentSession();
		List<Object[]> list = session.createNativeQuery(hql).setParameter("month", month).setParameter("city", city).list();
		Iterator it = list.iterator();
 		List<PaymentCityMonth> reports = new ArrayList<PaymentCityMonth>();
 		while (it.hasNext()) {
 			Object[] results = (Object[]) it.next();
 			PaymentCityMonth report = new PaymentCityMonth();
 			report.setReceivable((int) results[0]);
 			report.setActual((int) results[1]);
 			report.setArea((String) results[2]);
=======
 			AreaTotalOrderByCustomer report = new AreaTotalOrderByCustomer();
 			report.setArea((String) results[0]); 
 			report.setAmount((Long) results[1]);
>>>>>>> f1b340708c8dd0adc4ffdf8f55f1fd7540ba6612
 			reports.add(report);
 		}
 		return reports;
	}
	
	public List<ProductItems> computedProductItems(String type) {
<<<<<<< HEAD
		Session session = factory.getCurrentSession();
		String hql;
		List list;
		if (type.equals("bean")) {
			hql = "select pb.name ,pdb.quantity From ProductBean as pb "
	 				+ "LEFT JOIN ProductDetailBean as pdb "
	 				+ "ON pb.id=pdb.product "
	 				+ "WHERE pType = :type order by pdb.quantity DESC";	
	 		list = session.createQuery(hql).setParameter("type", type).setMaxResults(5).list();
		} else {
			hql = "select pb.name ,pdb.quantity From ProductBean as pb "
	 				+ "LEFT JOIN ProductDetailBean as pdb "
	 				+ "ON pb.id=pdb.product "
	 				+ "WHERE pType = :type order by pdb.quantity DESC";
	 		list = session.createQuery(hql).setParameter("type", type).setMaxResults(10).list();
		}	
=======
 		String hql = "select pb.name ,pdb.quantity From ProductBean as pb "
 				+ "LEFT JOIN ProductDetailBean as pdb "
 				+ "ON pb.id=pdb.product "
 				+ "WHERE pb.type = :type";
 		Session session = factory.getCurrentSession();
 		List list = session.createQuery(hql).setParameter("type", type).list();
>>>>>>> f1b340708c8dd0adc4ffdf8f55f1fd7540ba6612
 		Iterator it = list.iterator();
 		List<ProductItems> reports = new ArrayList<ProductItems>();
 		while (it.hasNext()) {
 			Object[] results = (Object[]) it.next();
 			ProductItems report = new ProductItems();
 			report.setName((String) results[0]);
 			report.setQuantity((int) results[1]);
 			reports.add(report);
 		}
 		return reports;
 	}
 }
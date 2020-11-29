package com.oneorzero.collection.dao.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oneorzero.bean.PaymentBean;
import com.oneorzero.bean.StoreBean;
import com.oneorzero.collection.dao.ICollectionDao;
import com.oneorzero.collection.model.GetPaymentDtlResponse;
import com.oneorzero.collection.model.RemarkUpdateRequest;

@Repository
public class CollectionDao implements ICollectionDao {

	@Autowired
	SessionFactory factory;

	@SuppressWarnings("unchecked")
	@Override
	public List<GetPaymentDtlResponse> getPaymentDtl(String id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM StoreBean WHERE email = :id";
		StoreBean sb = (StoreBean) session.createQuery(hql).setParameter("id", id).getSingleResult();
		String hql2 = "FROM PaymentBean WHERE store_id = :id";
		List<PaymentBean> pb = (List<PaymentBean>) session.createQuery(hql2).setParameter("id", sb.getStore_id())
				.getResultList();
		List<GetPaymentDtlResponse> getPaymentDtlList = new ArrayList<>();
		for (int i = 0; i < pb.size(); i++) {
			getPaymentDtlList.add(getPaymentDtl(sb, pb, i));
		}
		return getPaymentDtlList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<GetPaymentDtlResponse> emailList() {
		Session session = factory.getCurrentSession();

		String hql2 = "FROM PaymentBean WHERE dueDayCount = 22 AND isSend = 0";
		List<PaymentBean> pb = (List<PaymentBean>) session.createQuery(hql2).getResultList();
		List<GetPaymentDtlResponse> getPaymentDtlList = new ArrayList<>();
		for (int i = 0; i < pb.size(); i++) {
			String hql = "FROM StoreBean WHERE store_id = :store_id";
			StoreBean sb = (StoreBean) session.createQuery(hql)
					.setParameter("store_id", pb.get(i).getStore().getStore_id()).getSingleResult();
			GetPaymentDtlResponse getPaymentDtl = new GetPaymentDtlResponse();
			getPaymentDtl.setStore_id(sb.getStore_id());
			getPaymentDtl.setEmail(sb.getEmail());
			getPaymentDtl.setStore_name(sb.getStore_name());
			getPaymentDtl.setDueDayCount(pb.get(i).getDueDayCount());
			getPaymentDtl.setBalance_due(pb.get(i).getBalance_due());
			getPaymentDtlList.add(getPaymentDtl);
		}
		return getPaymentDtlList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean calculation() {
		try {
			Session session = factory.getCurrentSession();
			String hql = "FROM PaymentBean";
			List<PaymentBean> pb = (List<PaymentBean>) session.createQuery(hql).getResultList();
			for (int i = 0; i < pb.size(); i++) {
				Integer balance_due = pb.get(i).getReceivable() - pb.get(i).getActual();
				if (balance_due > 0) {
					String hql2 = "UPDATE PaymentBean " + "SET balance_due = :balance_due "
							+ "WHERE payment_id = :payment_id";
					session.createQuery(hql2).setParameter("balance_due", balance_due)
							.setParameter("payment_id", pb.get(i).getPayment_id()).executeUpdate();

					String now = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy/MM/dd"));
					SimpleDateFormat simpleFormat = new SimpleDateFormat("yyyy/MM/dd");
					Date fromDate1 = simpleFormat.parse(pb.get(i).getPaymentEnd());
					Date toDate1 = simpleFormat.parse(now);
					long from1 = fromDate1.getTime();
					long to1 = toDate1.getTime();
					int days = (int) ((to1 - from1) / (1000 * 60 * 60 * 24));

					String level = "";
					if (days <= 20) {
						level = "C0";
					} else if (days > 20 && days <= 30) {
						level = "M1";
					} else if (days > 30) {
						int j = (int) Math.ceil((days / 30));
						level = "M" + (j + 1);
					} else {
						level = "ERR";
					}

					String hql3 = "UPDATE PaymentBean "
							+ "SET dueDay = :dueDay, dueDayCount = :dueDayCount, update_dt = GETDATE() "
							+ "WHERE payment_id = :payment_id";
					session.createQuery(hql3).setParameter("dueDay", level).setParameter("dueDayCount", days)
							.setParameter("payment_id", pb.get(i).getPayment_id()).executeUpdate();

				}
			}
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		} catch (ParseException e) {
			e.printStackTrace();
			return false;
		}

	}

	@Override
	public boolean demo() {
		try {
			Session session = factory.getCurrentSession();
			String hql = "UPDATE PaymentBean " + "SET paymentEnd = :paymentEnd, paymentStart = :paymentStart "
					+ "WHERE store_id = :store_id";
			for (Integer i = 2; i <= 4; i++) {// demo 寄Email
				session.createQuery(hql).setParameter("paymentEnd", updateTime(-22))
						.setParameter("paymentStart", updateTime(-52)).setParameter("store_id", i).executeUpdate();
			}
			for (Integer i = 5; i <= 7; i++) {// demo 停止功能
				session.createQuery(hql).setParameter("paymentEnd", updateTime(-35))
						.setParameter("paymentStart", updateTime(-65)).setParameter("store_id", i).executeUpdate();
			}
			for (Integer i = 8; i <= 10; i++) {// demo 電話通知
				session.createQuery(hql).setParameter("paymentEnd", updateTime(-40))
						.setParameter("paymentStart", updateTime(-70)).setParameter("store_id", i).executeUpdate();
			}
			session.createQuery(hql).setParameter("paymentEnd", updateTime(-52))//demo 存證信函
					.setParameter("paymentStart", updateTime(-82)).setParameter("store_id", 11).executeUpdate();
			session.createQuery(hql).setParameter("paymentEnd", updateTime(-71))
					.setParameter("paymentStart", updateTime(-101)).setParameter("store_id", 12).executeUpdate();
			session.createQuery(hql).setParameter("paymentEnd", updateTime(-92))
					.setParameter("paymentStart", updateTime(-122)).setParameter("store_id", 133).executeUpdate();
			for (Integer i = 14; i <= 15; i++) {// demo 債權外售
				session.createQuery(hql).setParameter("paymentEnd", updateTime(-510))
						.setParameter("paymentStart", updateTime(-540)).setParameter("store_id", i).executeUpdate();
			}
			String hql3 = "UPDATE PaymentBean " + "SET isSend = 0, isAutodiler = 0";
			session.createQuery(hql3).executeUpdate();
			
			
			
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	}

	private String updateTime(Integer days) {
		try {
			String now = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy/MM/dd"));
			SimpleDateFormat simpleFormat = new SimpleDateFormat("yyyy/MM/dd");
			Date toDate1 = simpleFormat.parse(now);
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(toDate1);
			calendar.add(Calendar.DATE, days);
			System.out.println();
			return simpleFormat.format(calendar.getTime());
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public void sendMail(GetPaymentDtlResponse sendMail) {
		try {
			Session session = factory.getCurrentSession();
			String hql = "UPDATE PaymentBean " + "SET isSend = 1 " + "WHERE store_id = :store_id "
					+ "AND balance_due = :balance_due";
			session.createQuery(hql).setParameter("store_id", sendMail.getStore_id())
					.setParameter("balance_due", sendMail.getBalance_due()).executeUpdate();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<GetPaymentDtlResponse> autodilerList() {
		Session session = factory.getCurrentSession();

		String hql2 = "FROM PaymentBean WHERE dueDayCount = 40";
		List<PaymentBean> pb = (List<PaymentBean>) session.createQuery(hql2).getResultList();
		List<GetPaymentDtlResponse> getPaymentDtlList = new ArrayList<>();
		for (int i = 0; i < pb.size(); i++) {
			String hql = "FROM StoreBean WHERE store_id = :store_id";
			StoreBean sb = (StoreBean) session.createQuery(hql)
					.setParameter("store_id", pb.get(i).getStore().getStore_id()).getSingleResult();
			getPaymentDtlList.add(getPaymentDtl(sb, pb, i));
		}
		return getPaymentDtlList;
	}

	private GetPaymentDtlResponse getPaymentDtl(StoreBean sb, List<PaymentBean> pb, Integer i) {
		GetPaymentDtlResponse getPaymentDtl = new GetPaymentDtlResponse();
		getPaymentDtl.setStore_id(sb.getStore_id());
		getPaymentDtl.setEmail(sb.getEmail());
		getPaymentDtl.setStore_name(sb.getStore_name());
		getPaymentDtl.setAddress_area(sb.getAddress_area());
		getPaymentDtl.setTel(sb.getTel());
		getPaymentDtl.setPhone(sb.getPhone());
		getPaymentDtl.setContact_person(sb.getContact_person());
		getPaymentDtl.setPayment_id(pb.get(i).getPayment_id());
		getPaymentDtl.setMonth(pb.get(i).getMonth());
		getPaymentDtl.setReceivable(pb.get(i).getReceivable());
		getPaymentDtl.setActual(pb.get(i).getActual());
		getPaymentDtl.setPaymentStart(pb.get(i).getPaymentStart());
		getPaymentDtl.setPaymentEnd(pb.get(i).getPaymentEnd());
		getPaymentDtl.setDueDay(pb.get(i).getDueDay());
		getPaymentDtl.setDueDayCount(pb.get(i).getDueDayCount());
		getPaymentDtl.setBalance_due(pb.get(i).getBalance_due());
		getPaymentDtl.setRemark(pb.get(i).getRemark());
		getPaymentDtl.setUpdate_dt(pb.get(i).getUpdate_dt());
		getPaymentDtl.setIsAutodiler(pb.get(i).getIsAutodiler());
		return getPaymentDtl;
	}

	@Override
	public boolean autodilerRemarkUpdate(RemarkUpdateRequest remarkUpdateRequest) {
		try {
			Session session = factory.getCurrentSession();
			String hql = "UPDATE PaymentBean " + "SET isAutodiler = 1, update_dt = GETDATE(), remark = :remark "
					+ "WHERE payment_id = :payment_id";
			session.createQuery(hql).setParameter("remark", remarkUpdateRequest.getRemark())
					.setParameter("payment_id", remarkUpdateRequest.getPayment_id()).executeUpdate();
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<GetPaymentDtlResponse> depositList() {
		Session session = factory.getCurrentSession();

		String hql2 = "FROM PaymentBean WHERE dueDayCount IN (52,71,92)";
		List<PaymentBean> pb = (List<PaymentBean>) session.createQuery(hql2).getResultList();
		List<GetPaymentDtlResponse> getPaymentDtlList = new ArrayList<>();
		for (int i = 0; i < pb.size(); i++) {
			String hql = "FROM StoreBean WHERE store_id = :store_id";
			StoreBean sb = (StoreBean) session.createQuery(hql)
					.setParameter("store_id", pb.get(i).getStore().getStore_id()).getSingleResult();
			getPaymentDtlList.add(getPaymentDtl(sb, pb, i));
		}
		return getPaymentDtlList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PaymentBean> functIsDisabled(Integer store_id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM PaymentBean where dueDayCount >= 35 and store_id = :sid";
		return session.createQuery(hql).setParameter("sid", store_id).getResultList();
	}
}

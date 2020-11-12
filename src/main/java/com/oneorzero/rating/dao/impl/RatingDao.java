package com.oneorzero.rating.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oneorzero.bean.MemberBean;
import com.oneorzero.bean.RatingBean;
import com.oneorzero.bean.StoreBean;
import com.oneorzero.rating.dao.IRatingDao;

@Repository
public class RatingDao implements IRatingDao {

	@Autowired
	SessionFactory factory;
	
	@SuppressWarnings("unchecked")
	@Override
	public boolean newRating(Integer member_id, Integer store_id, Integer rating) {
		Session session = factory.getCurrentSession();
		String hql = "FROM RatingBean where member_id = :mid and store_id = :sid";
		List<RatingBean> list = session.createQuery(hql).setParameter("mid", member_id).setParameter("sid", store_id).getResultList();
		if (list.size() > 0) {
			return false;
		} else {
			RatingBean rb = new RatingBean();
			MemberBean mb = session.get(MemberBean.class, member_id);
			StoreBean sb =  session.get(StoreBean.class, store_id);
			sb.setRateCount(sb.getRateCount()+1);
			sb.setRating(sb.getRating()+rating);
			rb.setRating(rating);
			rb.setMember(mb);
			rb.setStore(sb);
			session.update(sb);
			session.save(rb);
			return true;
		}
	}

}

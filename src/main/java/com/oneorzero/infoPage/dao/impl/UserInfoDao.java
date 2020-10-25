package com.oneorzero.infoPage.dao.impl;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oneorzero.bean.MemberBean;
import com.oneorzero.infoPage.dao.IUserInfoDao;

@Repository
public class UserInfoDao implements IUserInfoDao{
	
	@Autowired
	SessionFactory factory;

	@Override
	public MemberBean findByPK(Integer pk) {
		Session session = factory.getCurrentSession();
		return session.get(MemberBean.class, pk);
	}

	@Override
	public void updateMember(MemberBean mb) {
		Session session = factory.getCurrentSession();
		mb.setUpdate_dt(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
		session.update(mb);
	}
	
	@Override
	public void evitMember(MemberBean mb) {
		Session session = factory.getCurrentSession();
		session.evict(mb);
	}

}

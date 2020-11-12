package com.oneorzero.comment.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.oneorzero.bean.CommentBean;
import com.oneorzero.bean.MemberBean;
import com.oneorzero.bean.StoreBean;
import com.oneorzero.comment.dao.ICommentDao;

@Repository
public class CommentDao implements ICommentDao {
	
	@Autowired
	SessionFactory factory;

	@Override
	public void newComment(String comment, Integer store_id, Integer member_id) {
		Session session = factory.getCurrentSession();
		CommentBean cb = new CommentBean();
		StoreBean sb = session.get(StoreBean.class, store_id);
		MemberBean mb = session.get(MemberBean.class, member_id);
		cb.setContent(comment);
		cb.setStore(sb);
		cb.setMember(mb);
		cb.setName(mb.getName());
		session.save(cb);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CommentBean> getComment(Integer store_id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM CommentBean where store_id = :sid ORDER BY create_dt DESC";
		return session.createQuery(hql).setParameter("sid", store_id).getResultList();
	}

}

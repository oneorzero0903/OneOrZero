package com.oneorzero.storeOrder.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oneorzero.bean.MemberBean;
import com.oneorzero.storeOrder.dao.IUserOrderDao;
import com.oneorzero.storeOrder.service.IUserOrderService;
@Service
@Transactional
public class UserOrderService implements IUserOrderService {
	@Autowired
	IUserOrderDao dao;
	
	@Override
	public boolean signUp(MemberBean mb) {
		return dao.signUp(mb);
	}

	@Override
	public void verifyAccount(String email) {
		dao.verifyAccount(email);
	}
}

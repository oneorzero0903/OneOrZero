package com.oneorzero.signup.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oneorzero.bean.StoreBean;
import com.oneorzero.signup.dao.IStoreSignUpDao;
import com.oneorzero.signup.service.IStoreSignUpService;
@Service
@Transactional
public class StoreSignUpService implements IStoreSignUpService {
	@Autowired
	IStoreSignUpDao dao;
	
	@Override
	public boolean signUp(StoreBean sb) {
		return dao.signUp(sb);
	}

	@Override
	public void verifyAccount(String email) {
		dao.verifyAccount(email);
	}
}

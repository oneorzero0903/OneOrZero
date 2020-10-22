package com.oneorzero.signup.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oneorzero.bean.MemberBean;
import com.oneorzero.signup.dao.IUserSignUpDao;
import com.oneorzero.signup.service.IUserSignUpService;
@Service
@Transactional
public class UserSignUpService implements IUserSignUpService {
	@Autowired
	IUserSignUpDao dao;
	
	@Override
	public boolean signUp(MemberBean mb) {
		return dao.signUp(mb);
	}

	@Override
	public void verifyAccount(String email) {
		dao.verifyAccount(email);
	}
}

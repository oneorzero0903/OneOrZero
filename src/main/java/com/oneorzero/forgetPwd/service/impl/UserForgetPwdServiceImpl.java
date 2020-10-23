package com.oneorzero.forgetPwd.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oneorzero.bean.MemberBean;
import com.oneorzero.forgetPwd.dao.IUserForgetPwdDaoI;
import com.oneorzero.forgetPwd.service.IUserForgetPwdService;

@Service
@Transactional
public class UserForgetPwdServiceImpl implements IUserForgetPwdService {

	@Autowired
	IUserForgetPwdDaoI dao;
	
	@Override
	public MemberBean checkAccountExist(String account) {
		return dao.checkAccountExist(account);
	}
}

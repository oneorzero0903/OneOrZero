package com.oneorzero.login.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oneorzero.bean.MemberBean;
import com.oneorzero.login.dao.IUserLoginDao;
import com.oneorzero.login.service.IUserLoginService;
@Service
@Transactional
public class UserLoginService implements IUserLoginService {
	@Autowired
	IUserLoginDao dao;
	
	@Override
	public List<MemberBean> checkAccountPassword(String account, String password) {
		return dao.checkAccountPassword(account, password);
	}
}

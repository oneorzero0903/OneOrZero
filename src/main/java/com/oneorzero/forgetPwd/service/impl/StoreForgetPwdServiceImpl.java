package com.oneorzero.forgetPwd.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oneorzero.bean.StoreBean;
import com.oneorzero.forgetPwd.dao.IStoreForgetPwdDao;
import com.oneorzero.forgetPwd.service.IStoreForgetPwdService;

@Service
@Transactional
public class StoreForgetPwdServiceImpl implements IStoreForgetPwdService {
	
	@Autowired
	IStoreForgetPwdDao dao;
	
	@Override
	public StoreBean checkAccountExist(String account) {
		return dao.checkAccountExist(account);
	}
}

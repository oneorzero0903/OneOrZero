package com.oneorzero.login.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oneorzero.bean.StoreBean;
import com.oneorzero.login.dao.IStoreLoginDao;
import com.oneorzero.login.service.IStoreLoginService;

@Service
@Transactional
public class StoreLoginService implements IStoreLoginService {
	@Autowired
	IStoreLoginDao dao;
	
	@Override
	public StoreBean checkAccountPassword(String account, String password) {
		return dao.checkAccountPassword(account, password);
	}
}

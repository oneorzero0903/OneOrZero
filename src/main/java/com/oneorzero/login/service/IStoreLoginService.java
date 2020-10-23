package com.oneorzero.login.service;

import com.oneorzero.bean.StoreBean;

public interface IStoreLoginService {
	StoreBean checkAccountPassword(String account, String password);
}
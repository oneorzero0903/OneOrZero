package com.oneorzero.login.dao;

import com.oneorzero.bean.StoreBean;

public interface IStoreLoginDao {

	StoreBean checkAccountPassword(String account, String password);

}
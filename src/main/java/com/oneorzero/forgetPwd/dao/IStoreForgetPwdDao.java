package com.oneorzero.forgetPwd.dao;

import com.oneorzero.bean.StoreBean;

public interface IStoreForgetPwdDao {

	StoreBean checkAccountExist(String account);

}
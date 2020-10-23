package com.oneorzero.forgetPwd.service;

import com.oneorzero.bean.StoreBean;

public interface IStoreForgetPwdService {

	StoreBean checkAccountExist(String account);

}
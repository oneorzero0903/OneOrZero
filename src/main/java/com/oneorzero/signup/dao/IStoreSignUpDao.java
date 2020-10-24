package com.oneorzero.signup.dao;

import com.oneorzero.bean.StoreBean;

public interface IStoreSignUpDao {

	boolean signUp(StoreBean sb);
	
	void verifyAccount(String email);

}
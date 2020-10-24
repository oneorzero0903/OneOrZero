package com.oneorzero.signup.service;

import com.oneorzero.bean.StoreBean;

public interface IStoreSignUpService {
	public boolean signUp(StoreBean sb);
	
	void verifyAccount(String email);
}
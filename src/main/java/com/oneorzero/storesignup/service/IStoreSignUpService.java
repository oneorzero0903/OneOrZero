package com.oneorzero.storesignup.service;

import com.oneorzero.bean.MemberBean;

public interface IStoreSignUpService {
	public boolean signUp(MemberBean mb);
	
	void verifyAccount(String email);
}
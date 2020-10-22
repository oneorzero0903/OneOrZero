package com.oneorzero.signup.service;

import com.oneorzero.bean.MemberBean;

public interface IUserSignUpService {
	public boolean signUp(MemberBean mb);
	
	void verifyAccount(String email);
}
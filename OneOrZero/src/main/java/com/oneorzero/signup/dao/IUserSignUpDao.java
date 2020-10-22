package com.oneorzero.signup.dao;

import com.oneorzero.bean.MemberBean;

public interface IUserSignUpDao {

	boolean signUp(MemberBean mb);
	
	void verifyAccount(String email);

}
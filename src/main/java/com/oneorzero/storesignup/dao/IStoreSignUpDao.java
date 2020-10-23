package com.oneorzero.storesignup.dao;

import com.oneorzero.bean.MemberBean;

public interface IStoreSignUpDao {

	boolean signUp(MemberBean mb);
	
	void verifyAccount(String email);

}
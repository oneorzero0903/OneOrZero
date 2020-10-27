package com.oneorzero.storeOrder.dao;

import com.oneorzero.bean.MemberBean;

public interface IUserOrderDao {

	boolean signUp(MemberBean mb);
	
	void verifyAccount(String email);

}
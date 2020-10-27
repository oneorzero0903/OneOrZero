package com.oneorzero.storeOrder.service;

import com.oneorzero.bean.MemberBean;

public interface IUserOrderService {
	public boolean signUp(MemberBean mb);
	
	void verifyAccount(String email);
}
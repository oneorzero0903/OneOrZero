package com.oneorzero.login.service;

import com.oneorzero.bean.MemberBean;

public interface IUserLoginService {
	MemberBean checkAccountPassword(String account, String password);
}
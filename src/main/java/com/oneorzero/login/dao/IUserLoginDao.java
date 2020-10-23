package com.oneorzero.login.dao;

import com.oneorzero.bean.MemberBean;

public interface IUserLoginDao {

	MemberBean checkAccountPassword(String account, String password);

}
package com.oneorzero.login.dao;

import java.util.List;

import com.oneorzero.bean.MemberBean;

public interface IUserLoginDao {

	List<MemberBean> checkAccountPassword(String account, String password);

}
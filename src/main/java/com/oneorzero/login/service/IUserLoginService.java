package com.oneorzero.login.service;

import java.util.List;

import com.oneorzero.bean.MemberBean;

public interface IUserLoginService {
	public List<MemberBean> checkAccountPassword(String account, String password);
}
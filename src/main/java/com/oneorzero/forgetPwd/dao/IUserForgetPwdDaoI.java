package com.oneorzero.forgetPwd.dao;

import com.oneorzero.bean.MemberBean;

public interface IUserForgetPwdDaoI {

	MemberBean checkAccountExist(String account);

}
package com.oneorzero.forgetPwd.service;

import com.oneorzero.bean.MemberBean;

public interface IUserForgetPwdService {

	MemberBean checkAccountExist(String account);

}
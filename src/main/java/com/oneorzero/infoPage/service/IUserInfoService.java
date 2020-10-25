package com.oneorzero.infoPage.service;

import com.oneorzero.bean.MemberBean;

public interface IUserInfoService {
	MemberBean findByPK(Integer pk);
	void updateMember(MemberBean mb);
	public void evitMember(MemberBean mb);
}

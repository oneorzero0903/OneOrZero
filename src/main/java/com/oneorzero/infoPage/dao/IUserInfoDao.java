package com.oneorzero.infoPage.dao;

import com.oneorzero.bean.MemberBean;

public interface IUserInfoDao {
	MemberBean findByPK(Integer pk);
	void updateMember(MemberBean mb);
	public void evitMember(MemberBean mb);
}
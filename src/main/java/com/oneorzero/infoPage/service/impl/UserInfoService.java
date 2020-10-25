package com.oneorzero.infoPage.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.oneorzero.bean.MemberBean;
import com.oneorzero.infoPage.dao.IUserInfoDao;
import com.oneorzero.infoPage.service.IUserInfoService;

@Service
@Transactional
public class UserInfoService implements IUserInfoService {
	
	@Autowired
	IUserInfoDao dao;

	@Override
	public MemberBean findByPK(Integer pk) {
		return dao.findByPK(pk);
	}

	@Override
	public void updateMember(MemberBean mb) {
		dao.updateMember(mb);
	}

	@Override
	public void evitMember(MemberBean mb) {
		dao.evitMember(mb);
	}

}

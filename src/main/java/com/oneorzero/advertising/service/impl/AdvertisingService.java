package com.oneorzero.advertising.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oneorzero.advertising.dao.IAdvertisingDao;
import com.oneorzero.advertising.service.IAdvertisingService;
import com.oneorzero.bean.AdvertisingBean;

@Service
@Transactional
public class AdvertisingService implements IAdvertisingService {

	@Autowired
	IAdvertisingDao dao;
	
	@Override
	public List<AdvertisingBean> showOKAd() {
		dao.deleteExpiredAd();
		return dao.showOKAd();
	}

	@Override
	public boolean buyAd(AdvertisingBean adBean) {
		return dao.buyAd(adBean);
	}

}

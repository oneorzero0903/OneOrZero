package com.oneorzero.advertising.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oneorzero.advertising.dao.IAdvertisingDao;
import com.oneorzero.advertising.service.IAdvertisingService;
import com.oneorzero.bean.AdvertisingBean;
import com.oneorzero.bean.StoreBean;
import com.oneorzero.program.dao.IProgramDao;

@Service
@Transactional
public class AdvertisingService implements IAdvertisingService {

	@Autowired
	IAdvertisingDao dao;
	
	@Autowired
	IProgramDao checkProgram;
	
	@Override
	public List<AdvertisingBean> showOKAd() {
		dao.deleteExpiredAd();
		return dao.showOKAd();
	}

	@Override
	public boolean buyAd(AdvertisingBean adBean) {
		return dao.buyAd(adBean);
	}

	@Override
	public void updateAdImgPath(AdvertisingBean adBean) {
		dao.updateAdImgPath(adBean);
	}

	@Override
	public AdvertisingBean findByPK(Integer ad_id) {
		return dao.findByPK(ad_id);
	}

	@Override
	public void timeMachine() {
		dao.timeMachine();
	}

	@Override
	public StoreBean getStore(Integer id) {
		return dao.getStore(id);
	}

	@Override
	public boolean checkProgram(Integer store_id, String name) {
		return checkProgram.checkProgram(store_id, name);
	}

}

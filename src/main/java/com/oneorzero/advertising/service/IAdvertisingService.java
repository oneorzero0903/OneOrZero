package com.oneorzero.advertising.service;

import java.util.List;

import com.oneorzero.bean.AdvertisingBean;
import com.oneorzero.bean.StoreBean;

public interface IAdvertisingService {

	List<AdvertisingBean> showOKAd();
	boolean buyAd(AdvertisingBean adBean);
	void updateAdImgPath(AdvertisingBean adBean);
	AdvertisingBean findByPK(Integer ad_id);
	void timeMachine();
	StoreBean getStore(Integer id);
	boolean checkProgram(Integer store_id, String name);
}

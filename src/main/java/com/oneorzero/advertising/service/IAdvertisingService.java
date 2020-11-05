package com.oneorzero.advertising.service;

import java.util.List;

import com.oneorzero.bean.AdvertisingBean;

public interface IAdvertisingService {

	List<AdvertisingBean> showOKAd();
	boolean buyAd(AdvertisingBean adBean);
	void updateAdImgPath(AdvertisingBean adBean);
	AdvertisingBean findByPK(Integer ad_id);
}

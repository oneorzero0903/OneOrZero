package com.oneorzero.advertising.service;

import java.util.List;

import com.oneorzero.bean.AdvertisingBean;

public interface IAdvertisingService {

	List<AdvertisingBean> showOKAd();
	boolean buyAd(AdvertisingBean adBean);

}

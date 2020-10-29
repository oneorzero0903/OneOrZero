package com.oneorzero.showStore.service;

import java.util.List;

import com.oneorzero.bean.StoreBean;

public interface IShowStoreService {
	List<StoreBean> showStore();

	StoreBean findByPK(int key);

	int getTotalPages();

	List<StoreBean> showStoresByPageNo(Integer pageNo);
}
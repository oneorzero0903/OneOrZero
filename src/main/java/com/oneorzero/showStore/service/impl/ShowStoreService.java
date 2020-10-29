package com.oneorzero.showStore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oneorzero.bean.StoreBean;
import com.oneorzero.showStore.dao.IShowStoreDao;
import com.oneorzero.showStore.service.IShowStoreService;

@Service
@Transactional
public class ShowStoreService implements IShowStoreService {
	
	@Autowired
	IShowStoreDao dao;

	@Override
	public List<StoreBean> showStore() {
		return dao.showStore();
	}

	@Override
	public StoreBean findByPK(int key) {
		return dao.findByPK(key);
	}

	@Override
	public int getTotalPages() {
		return dao.getTotalPages();
	}

	@Override
	public List<StoreBean> showStoresByPageNo(Integer pageNo) {
		return dao.showStoresByPageNo(pageNo);
	}

}

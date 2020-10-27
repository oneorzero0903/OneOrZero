package com.oneorzero.showStore.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oneorzero.bean.StoreBean;
import com.oneorzero.showStore.dao.IShowStore;

@Repository
public class ShowStoreDao implements IShowStore{

	@Override
	public @ResponseBody List<StoreBean> showStore() {
		return null;
	}

}

package com.oneorzero.storeOrder.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oneorzero.bean.StoreBean;
import com.oneorzero.bean.Store_OrderSettingBean;
import com.oneorzero.storeOrder.dao.IStoreOrderDao;
import com.oneorzero.storeOrder.service.IStoreOrderService;

@Service
@Transactional
public class StoreOrderService implements IStoreOrderService {
	@Autowired
	IStoreOrderDao dao;

	@Override
	public boolean insertStoreOrder(List<Store_OrderSettingBean> sob, StoreBean store) {
		try {
			for (Store_OrderSettingBean list : sob) {
//				list.setDateStart(Getgroup_type_name(list.getDateStart()));
//				list.setDateEnd(Getgroup_type_name(list.getDateEnd()));
				String[] timeStart = list.getTimeStart().split("\\.");
				if (timeStart[1].equals("5")) {
					list.setTimeStart(timeStart[0] + ":30");
				}else {
					list.setTimeStart(timeStart[0] + ":00");
				}
				
				String[] timeEnd = list.getTimeEnd().split("\\.");
				if (timeEnd[1].equals("5")) {
					list.setTimeEnd(timeEnd[0] + ":30");
				}else {
					list.setTimeEnd(timeEnd[0] + ":00");
				}
			}
			return dao.insertStoreOrder(sob, store);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Integer getStore_Id(String email) {
		return dao.getStore_Id(email);
	}

}

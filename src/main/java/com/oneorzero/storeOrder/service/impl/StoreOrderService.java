package com.oneorzero.storeOrder.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oneorzero.bean.StoreBean;
import com.oneorzero.bean.Store_OrderSettingBean;
import com.oneorzero.program.dao.IProgramDao;
import com.oneorzero.storeOrder.dao.IStoreOrderDao;
import com.oneorzero.storeOrder.model.BookingTimeRequest;
import com.oneorzero.storeOrder.model.StoreOrderListResponse;
import com.oneorzero.storeOrder.service.IStoreOrderService;

@Service
@Transactional
public class StoreOrderService implements IStoreOrderService {
	@Autowired
	IStoreOrderDao dao;
	
	@Autowired
	IProgramDao checkProgram;

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

	@Override
	public Integer checkStoreOrder(StoreBean store) {
		return dao.checkStoreOrder(store);
	}
	
	@Override
	public List<Store_OrderSettingBean> findOrder(String store_id) {
		return dao.findOrder(store_id);
	}
	
	@SuppressWarnings("null")
	@Override
	public List<String> checkDayToGetSetting(List<Store_OrderSettingBean> orderSetting, 
			BookingTimeRequest date) {
		
		String[] dateArr = date.getDate().split("\\-");
		List<String> list = new ArrayList<>();
		A:for (int i = 0; i < orderSetting.size(); i++) {
			boolean check = dao.checkDayToGetSetting(orderSetting.get(i).getSetting_id(), getDay(dateArr[1]));
			if (check) {
				list.add(String.valueOf(orderSetting.get(i).getSetting_id()));
			}else {
				continue A;
			}
		}
		return list;
		
	}
	
	@Override
	public List<StoreOrderListResponse> getOrdersList(Integer setting_id, String date) {
		return dao.getOrdersList(setting_id, date);
	}
	
	private String getDay(String date) {
		switch (date) {
			case "Monday": return "1";
			case "Tuesday": return "2";
			case "Wednesday": return "3";
			case "Thursday": return "4";
			case "Friday": return "5";
			case "Saturday": return "6";
			case "Sunday": return "7";
			default: return "0";
		}
	}

	@Override
	public boolean checkProgram(Integer store_id, String name) {
		return checkProgram.checkProgram(store_id, name);
	}

}

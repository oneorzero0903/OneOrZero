package com.oneorzero.showStore.dao;

 import java.util.List;

 import com.oneorzero.bean.StoreBean;

 public interface IShowStoreDao {
 	List<StoreBean> showStore();
 	StoreBean findByPK(int key);
 	int getTotalPages();
 	List<StoreBean> showStoresByPageNo(Integer pageNo);
 }
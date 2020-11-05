package com.oneorzero.showStore.dao;

 import java.util.List;

 import com.oneorzero.bean.StoreBean;

 public interface IShowStoreDao {
 	List<StoreBean> showStore();
 	StoreBean findByPK(int key);
 	int getTotalPages();
 	int getTotalAreaPages(String area);
 	List<StoreBean> showStoresByPageNo(Integer pageNo);
 	List<StoreBean> showStoresByArea(Integer pageNo, String area);
 	boolean existStore_Id(String store_id);
 }
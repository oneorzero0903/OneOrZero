package com.oneorzero.product.dao;

import java.util.List;

import com.oneorzero.bean.ProductBean;

public interface IProductDao {

	List<ProductBean> getAllProducts();
	int getTotalPages();    //取得商品頁面總數  //interface不能有任何實作,所以不能用{} 
	List<ProductBean> getProductsByPageNo(Integer pageNo);  //照頁碼顯示商品
}

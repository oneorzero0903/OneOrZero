package com.oneorzero.product.dao;

import java.util.List;

import com.oneorzero.bean.ProductBean;

public interface IProductDao {

	List<ProductBean> getAllProducts();
 	ProductBean findByPK(int key);  //取得商品單筆詳細資料
	int getTotalPages();    //取得商品頁面總數  //interface不能有任何實作,所以不能用{} 
	List<ProductBean> getProductsByPageNo(Integer pageNo);  //照頁碼顯示商品
	void insertAddProduct(ProductBean pb);  //給商家新增商品頁面

}

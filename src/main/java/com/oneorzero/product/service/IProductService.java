package com.oneorzero.product.service;

import java.util.List;

import com.oneorzero.bean.ProductBean;

public interface IProductService {

	List<ProductBean> getAllProducts();
	ProductBean findByPK(int key);  //取得商品單筆詳細資料
	List<ProductBean> getProductsByPageNo(Integer pageNo);
	int getTotalPages();
	void insertAddProduct(ProductBean pb);  //給商家新增商品頁面

}

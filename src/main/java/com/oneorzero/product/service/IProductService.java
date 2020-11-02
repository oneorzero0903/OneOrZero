package com.oneorzero.product.service;

import java.util.List;

import com.oneorzero.bean.ProductBean;

public interface IProductService {

	List<ProductBean> getAllProducts();
	List<ProductBean> getProductsByPageNo(Integer pageNo);
	int getTotalPages();

}

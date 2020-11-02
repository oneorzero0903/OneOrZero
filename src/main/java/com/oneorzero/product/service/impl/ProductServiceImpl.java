package com.oneorzero.product.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oneorzero.bean.ProductBean;
import com.oneorzero.product.dao.IProductDao;
import com.oneorzero.product.service.IProductService;

@Service
@Transactional
public class ProductServiceImpl implements IProductService{
	@Autowired
	IProductDao dao;
	
	@Override
	public List<ProductBean> getAllProducts() {
		return dao.getAllProducts();
	}

	@Override
	public List<ProductBean> getProductsByPageNo(Integer pageNo) {
		return dao.getProductsByPageNo(pageNo);
	}

	@Override
	public int getTotalPages() {
		return dao.getTotalPages();
	}

}

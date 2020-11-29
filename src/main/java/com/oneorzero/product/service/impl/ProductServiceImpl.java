package com.oneorzero.product.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oneorzero.bean.ProductBean;
import com.oneorzero.product.dao.IProductDao;
import com.oneorzero.product.service.IProductService;
import com.oneorzero.program.dao.IProgramDao;

@Service
@Transactional
public class ProductServiceImpl implements IProductService{
	@Autowired
	IProductDao dao;
	
	@Autowired
	IProgramDao checkProgram;
	
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

	@Override
	public ProductBean findByPK(int key) {
		return dao.findByPK(key);
	}

	@Override
	public void insertAddProduct(ProductBean pb) {
		dao.insertAddProduct(pb);
	}

	@Override
	public List<ProductBean> showMyProduct(Integer id) {
		return dao.showMyProduct(id);
	}

	@Override
	public void dropProduct(Integer id) {
		dao.dropProduct(id);
	}

	@Override
	public void updateProduct(String name, Integer price, Integer stock, String description, Integer id) {
		dao.updateProduct(name, price, stock, description, id);
	}
	
	@Override
	public boolean checkProgram(Integer store_id, String name) {
		return checkProgram.checkProgram(store_id, name);
	}

	@Override
	public List<ProductBean> ambiguousSearch(String searchStr) {
		return dao.ambiguousSearch(searchStr);
	}

}

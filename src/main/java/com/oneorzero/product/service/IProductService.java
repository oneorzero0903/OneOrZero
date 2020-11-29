<<<<<<< HEAD
package com.oneorzero.product.service;

import java.util.List;

import com.oneorzero.bean.ProductBean;

public interface IProductService {

	List<ProductBean> getAllProducts();
	ProductBean findByPK(int key);  //取得商品單筆詳細資料
	List<ProductBean> getProductsByPageNo(Integer pageNo);
	int getTotalPages();
	void insertAddProduct(ProductBean pb);  //給商家新增商品頁面
	List<ProductBean> showMyProduct(Integer id);
	void dropProduct(Integer id);	
	void updateProduct(String name, Integer price, Integer stock, String description, Integer id);
	boolean checkProgram(Integer store_id, String name);
	List<ProductBean> ambiguousSearch(String searchStr);  // 商城模糊搜尋

}
=======
package com.oneorzero.product.service;

import java.util.List;

import com.oneorzero.bean.ProductBean;

public interface IProductService {

	List<ProductBean> getAllProducts();
	ProductBean findByPK(int key);  //取得商品單筆詳細資料
	List<ProductBean> getProductsByPageNo(Integer pageNo);
	int getTotalPages();
	void insertAddProduct(ProductBean pb);  //給商家新增商品頁面
	List<ProductBean> showMyProduct(Integer id);
	void dropProduct(Integer id);	
	void updateProduct(String name, Integer price, Integer stock, String description, Integer id);
	boolean checkProgram(Integer store_id, String name);
}
>>>>>>> f1b340708c8dd0adc4ffdf8f55f1fd7540ba6612

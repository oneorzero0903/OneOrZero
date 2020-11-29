package com.oneorzero.shoppingCart.dao;

import java.util.List;

import com.oneorzero.bean.MemberBean;
import com.oneorzero.bean.ProductDetailBean;

public interface IShoppingCartDao {
	void buy(Integer pid, Integer quantity, MemberBean mb);
	List<ProductDetailBean> getMemberCart(Integer member_id);
	void dropItem(Integer id);
	void changeNumber (Integer id, Integer number);
	long getTotalAmount(Integer id);
	void clearShoppingCart(Integer id);
	long getCartQuantity (Integer id);
	List<ProductDetailBean> getOrderProductHistory (Integer id);
}

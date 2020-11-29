<<<<<<< HEAD
package com.oneorzero.shppingCart.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oneorzero.bean.MemberBean;
import com.oneorzero.bean.ProductDetailBean;
import com.oneorzero.shppingCart.dao.IShoppingCartDao;
import com.oneorzero.shppingCart.service.IShoppingCartService;

@Service
@Transactional
public class ShoppingCartService implements IShoppingCartService {

	@Autowired
	IShoppingCartDao dao;
	
	@Override
	public void buy(Integer pid, Integer quantity, MemberBean mb) {
		dao.buy(pid, quantity, mb);
	}

	@Override
	public List<ProductDetailBean> getMemberCart(Integer member_id) {
		return dao.getMemberCart(member_id);
	}

	@Override
	public void dropItem(Integer id) {
		dao.dropItem(id);
	}

	@Override
	public void changeNumber(Integer id, Integer number) {
		dao.changeNumber(id, number);
	}

	@Override
	public long getTotalAmount(Integer id) {
		return dao.getTotalAmount(id);
	}

	@Override
	public void clearShoppingCart(Integer id) {
		dao.clearShoppingCart(id);
	}

}
=======
package com.oneorzero.shppingCart.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oneorzero.bean.MemberBean;
import com.oneorzero.bean.ProductDetailBean;
import com.oneorzero.shppingCart.dao.IShoppingCartDao;
import com.oneorzero.shppingCart.service.IShoppingCartService;

@Service
@Transactional
public class ShoppingCartService implements IShoppingCartService {

	@Autowired
	IShoppingCartDao dao;
	
	@Override
	public void buy(Integer pid, Integer quantity, MemberBean mb) {
		dao.buy(pid, quantity, mb);
	}

	@Override
	public List<ProductDetailBean> getMemberCart(Integer member_id) {
		return dao.getMemberCart(member_id);
	}

	@Override
	public void dropItem(Integer id) {
		dao.dropItem(id);
	}

	@Override
	public void changeNumber(Integer id, Integer number) {
		dao.changeNumber(id, number);
	}

	@Override
	public long getTotalAmount(Integer id) {
		return dao.getTotalAmount(id);
	}

	@Override
	public void clearShoppingCart(Integer id) {
		dao.clearShoppingCart(id);
	}

}
>>>>>>> f1b340708c8dd0adc4ffdf8f55f1fd7540ba6612

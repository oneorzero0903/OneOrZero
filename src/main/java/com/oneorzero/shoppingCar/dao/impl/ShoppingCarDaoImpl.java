package com.oneorzero.shoppingCar.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oneorzero.bean.ShoppingCarBean;
import com.oneorzero.shoppingCar.dao.IShoppingCarDao;

@Repository
public class ShoppingCarDaoImpl implements IShoppingCarDao{
	
	@Autowired
	SessionFactory factory;

	@Override
	public void insertOrder(ShoppingCarBean sp) {
		Session session = factory.getCurrentSession();
        session.save(sp);
	}
	

}

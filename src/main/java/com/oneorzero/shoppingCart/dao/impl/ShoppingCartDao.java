package com.oneorzero.shoppingCart.dao.impl;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oneorzero.bean.MemberBean;
import com.oneorzero.bean.ProductBean;
import com.oneorzero.bean.ProductDetailBean;
import com.oneorzero.shoppingCart.dao.IShoppingCartDao;

@SuppressWarnings("unchecked")
@Repository
public class ShoppingCartDao implements IShoppingCartDao {

	@Autowired
	SessionFactory factory;
	
	@Override
	public void buy(Integer pid, Integer quantity, MemberBean mb) {
		Session session = factory.getCurrentSession();
		ProductDetailBean pdb = new ProductDetailBean();
		String hql = "FROM ProductDetailBean WHERE product_id = :pid and member_id = :mid and isPaid = false";
		List<ProductDetailBean> list = session.createQuery(hql).setParameter("pid", pid).setParameter("mid", mb.getMember_id()).getResultList();
		ProductBean product = session.get(ProductBean.class, pid);
		if (list.size() > 0) {  //代表購物車內已有購買過此商品 只須更新總數與總金額
			list.get(0).setQuantity(list.get(0).getQuantity() + quantity);
			list.get(0).setTotalAmount(list.get(0).getTotalAmount() + product.getPrice() * quantity);
			session.update(list.get(0));
		} else {
			pdb.setProduct(product);
			pdb.setMember(mb);
			pdb.setQuantity(quantity);
			pdb.setTotalAmount(product.getPrice() * quantity);
			session.save(pdb);
		}
	}

	@Override
	public List<ProductDetailBean> getMemberCart(Integer member_id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ProductDetailBean WHERE member_id = :mid and isPaid = false";
		List<ProductDetailBean> list = session.createQuery(hql).setParameter("mid", member_id).getResultList();
		return list;
	}

	@Override
	public void dropItem(Integer id) {
		Session session = factory.getCurrentSession();
		String hql = "delete ProductDetailBean WHERE id = :id";
		session.createQuery(hql).setParameter("id", id).executeUpdate();
	}

	@Override
	public void changeNumber(Integer id, Integer number) {
		Session session = factory.getCurrentSession();
		ProductDetailBean pdb = session.get(ProductDetailBean.class, id);
		ProductBean pb = pdb.getProduct();
		pdb.setQuantity(number);
		pdb.setTotalAmount(number * pb.getPrice());
		session.update(pdb);
	}

	@Override
	public long getTotalAmount(Integer id) {
		Session session = factory.getCurrentSession();
		String hql = "Select SUM(totalAmount) FROM ProductDetailBean where member_id = :id and isPaid = false";
		try {
			return (long) session.createQuery(hql).setParameter("id", id).getSingleResult();
		} catch (Exception e) {
			return 0l;
		}
	}

	@Override
	public void clearShoppingCart(Integer id) {
		Session session = factory.getCurrentSession();
		String hql = "update ProductDetailBean set isPaid = true, bookingNo = :bn where member_id = :id and bookingNo is null";
		session.createQuery(hql).setParameter("id", id).setParameter("bn", "BN"+LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss"))).executeUpdate();	
	}

	@Override
	public long getCartQuantity(Integer id) {
		Session session = factory.getCurrentSession();
		String hql = "Select SUM(quantity) FROM ProductDetailBean WHERE member_id = :id and isPaid = false";
		try {
			return (long) session.createQuery(hql).setParameter("id", id).getSingleResult();
		} catch (Exception e) {
			return 0l;
		}
	}
	
	@Override
	public List<ProductDetailBean> getOrderProductHistory(Integer id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ProductDetailBean WHERE member_id = :id and isPaid = true order by bookingNo DESC ";
		List<ProductDetailBean> list = session.createQuery(hql).setParameter("id", id).getResultList();
		return list;
		
	}
	
}

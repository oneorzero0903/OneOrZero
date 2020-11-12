package com.oneorzero.program.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oneorzero.bean.ProgramBean;
import com.oneorzero.program.dao.IProgramDao;

@Repository
public class ProgramDaoImpl implements IProgramDao {
	@Autowired
	SessionFactory factory;
	
	@Override
	public void buyProgramAD(ProgramBean pb) {
		Session session = factory.getCurrentSession();
		pb.setEndTime(pb.getStartTime() + 365 * 24 * 60 * 60 * 1000);  //一年後方案到期
		session.save(pb);
	}

	@Override
	public void buyProgramBT(ProgramBean pb) {
		Session session = factory.getCurrentSession();
		pb.setEndTime(pb.getStartTime() + 365 * 24 * 60 * 60 * 1000);  //一年後方案到期
		session.save(pb);		
	}

	@Override
	public void buyProgramSM(ProgramBean pb) {
		Session session = factory.getCurrentSession();
		pb.setEndTime(pb.getStartTime() + 365 * 24 * 60 * 60 * 1000);  //一年後方案到期
		session.save(pb);		
	}

//	@Override
//	public void buyProgramBT(Integer sod) {
//		Session session = factory.getCurrentSession();
//		StoreBean bean = session.get(StoreBean.class, sod);
//		bean.setProgramBT(1);
//		session.update(bean);
//	}
//	
//	@Override
//	public void buyProgramSM(Integer sod) {
//		Session session = factory.getCurrentSession();
//		String hql = "UPDATE StoreBean SET programSM = 1 WHERE store_id = :pornHub";
//		session.createQuery(hql).setParameter("pornHub", sod).executeUpdate();
//	}
}

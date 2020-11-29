package com.oneorzero.program.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oneorzero.bean.ProgramBean;
import com.oneorzero.program.dao.IProgramDao;

@SuppressWarnings("unchecked")
@Repository
public class ProgramDaoImpl implements IProgramDao {
	@Autowired
	SessionFactory factory;
	
	@Override
	public boolean buyProgramAD(ProgramBean pb) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ProgramBean where name = 'programAD' and store_id = :id and startTime <= :time1 and :time2 <= endTime"; //檢查目前是否已有購買方案
		List<ProgramBean> list = session.createQuery(hql).setParameter("id", pb.getStore()
								.getStore_id())
								.setParameter("time1", pb.getStartTime())
								.setParameter("time2", pb.getStartTime())
								.getResultList();
		if (list.size()>0) return false;
		else {
			pb.setEndTime(pb.getStartTime() + 365 * 24 * 60 * 60 * 1000);  //一年後方案到期
			session.save(pb);
			return true;
		}
	}

	@Override
	public boolean buyProgramBT(ProgramBean pb) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ProgramBean where name = 'programBT' and store_id = :id and startTime <= :time1 and :time2 <= endTime"; //檢查目前是否已有購買方案
		List<ProgramBean> list = session.createQuery(hql).setParameter("id", pb.getStore()
								.getStore_id())
								.setParameter("time1", pb.getStartTime())
								.setParameter("time2", pb.getStartTime())
								.getResultList();
		if (list.size()>0) return false;
		else {
			pb.setEndTime(pb.getStartTime() + 365 * 24 * 60 * 60 * 1000);  //一年後方案到期
			session.save(pb);
			return true;
		}
	}

	@Override
	public boolean buyProgramSM(ProgramBean pb) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ProgramBean where name = 'programSM' and store_id = :id and startTime <= :time1 and :time2 <= endTime"; //檢查目前是否已有購買方案
		List<ProgramBean> list = session.createQuery(hql).setParameter("id", pb.getStore()
								.getStore_id())
								.setParameter("time1", pb.getStartTime())
								.setParameter("time2", pb.getStartTime())
								.getResultList();
		if (list.size()>0) return false;
		else {
			pb.setEndTime(pb.getStartTime() + 365 * 24 * 60 * 60 * 1000);  //一年後方案到期
			session.save(pb);
			return true;
		}
	}
	
	@Override
	public boolean checkProgram(Integer store_id, String name) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ProgramBean WHERE store_id = :store_id AND name = :name";
		List<ProgramBean> nameList = (List<ProgramBean>)session.createQuery(hql)
				.setParameter("store_id", store_id)
				.setParameter("name", name)
				.getResultList();
		return (nameList.size() > 0);
	}
}

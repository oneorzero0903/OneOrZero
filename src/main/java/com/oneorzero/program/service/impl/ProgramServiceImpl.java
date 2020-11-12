package com.oneorzero.program.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oneorzero.bean.ProgramBean;
import com.oneorzero.program.dao.IProgramDao;
import com.oneorzero.program.service.IProgramService;

@Service
@Transactional
public class ProgramServiceImpl implements IProgramService {
	@Autowired
	IProgramDao dao;

	@Override
	public void buyProgramAD(ProgramBean pb) {
		dao.buyProgramAD(pb);
	}

	@Override
	public void buyProgramBT(ProgramBean pb) {
		dao.buyProgramBT(pb);
	}

	@Override
	public void buyProgramSM(ProgramBean pb) {
		dao.buyProgramSM(pb);
	}

	@Override
	public void buyAll(List<ProgramBean> pbList) {
		dao.buyProgramAD(pbList.get(0));
		dao.buyProgramBT(pbList.get(1));
		dao.buyProgramSM(pbList.get(2));
	}

}

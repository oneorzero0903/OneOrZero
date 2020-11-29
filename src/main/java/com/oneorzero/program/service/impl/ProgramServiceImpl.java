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
	public boolean buyProgramAD(ProgramBean pb) {
		return dao.buyProgramAD(pb);
	}

	@Override
	public boolean buyProgramBT(ProgramBean pb) {
		return dao.buyProgramBT(pb);
	}

	@Override
	public boolean buyProgramSM(ProgramBean pb) {
		return dao.buyProgramSM(pb);
	}

	@Override
	public boolean buyAll(List<ProgramBean> pbList) {
		return (dao.buyProgramAD(pbList.get(0)) &&  dao.buyProgramBT(pbList.get(1)) && dao.buyProgramSM(pbList.get(2)));
	}

}

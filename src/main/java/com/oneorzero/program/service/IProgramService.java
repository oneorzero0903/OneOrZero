package com.oneorzero.program.service;

import java.util.List;

import com.oneorzero.bean.ProgramBean;



public interface IProgramService {
	void buyProgramAD(ProgramBean pb);
	void buyProgramBT(ProgramBean pb);
	void buyProgramSM(ProgramBean pb);
	void buyAll(List<ProgramBean> pbList);
}

package com.oneorzero.program.service;

import java.util.List;

import com.oneorzero.bean.ProgramBean;



public interface IProgramService {
	boolean buyProgramAD(ProgramBean pb);
	boolean buyProgramBT(ProgramBean pb);
	boolean buyProgramSM(ProgramBean pb);
	boolean buyAll(List<ProgramBean> pbList);
}

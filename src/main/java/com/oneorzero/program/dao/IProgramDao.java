package com.oneorzero.program.dao;

import com.oneorzero.bean.ProgramBean;

public interface IProgramDao {
	void buyProgramAD(ProgramBean pb);
	void buyProgramBT(ProgramBean pb);
	void buyProgramSM(ProgramBean pb);
	
	
//	void buyProgramBT(Integer sod); 
//	void buyProgramSM(Integer sod);
}

package com.oneorzero.program.dao;

import com.oneorzero.bean.ProgramBean;

public interface IProgramDao {
	boolean buyProgramAD(ProgramBean pb);
	boolean buyProgramBT(ProgramBean pb);
	boolean buyProgramSM(ProgramBean pb);
	boolean checkProgram(Integer store_id, String name);
}

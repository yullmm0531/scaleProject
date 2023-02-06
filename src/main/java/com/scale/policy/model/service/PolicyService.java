package com.scale.policy.model.service;

import static com.scale.common.JDBCTemplate.*;

import java.sql.Connection;

import com.scale.policy.model.dao.PolicyDao;
import com.scale.policy.model.vo.Policy;

public class PolicyService {

	public Policy selectInspectionPolicy() {
		Connection conn = getConnection();
		Policy p = new PolicyDao().selectInspectionPolicy(conn);
		close(conn);
		return p;
	}
	
	public int updateInspectionPolicy(String content) {
		Connection conn = getConnection();
		int result = new PolicyDao().updateInspectionPolicy(conn, content);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
}

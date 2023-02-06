package com.scale.policy.model.service;

import static com.scale.common.JDBCTemplate.*;

import java.sql.Connection;

import com.scale.policy.model.dao.PolicyDao;
import com.scale.policy.model.vo.Policy;

public class PolicyService {

	public Policy selectPolicy(int policyType) {
		Connection conn = getConnection();
		Policy p = new PolicyDao().selectPolicy(conn, policyType);
		close(conn);
		return p;
	}
	
	public int updatePolicy(String content, int policyType) {
		Connection conn = getConnection();
		int result = new PolicyDao().updatePolicy(conn, content, policyType);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
}

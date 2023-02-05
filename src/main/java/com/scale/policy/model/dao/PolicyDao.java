package com.scale.policy.model.dao;

import static com.scale.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.scale.policy.model.vo.Policy;

public class PolicyDao {

private Properties prop = new Properties();
	
	public PolicyDao() {
		String filePath = PolicyDao.class.getResource("/db/sql/policy-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Policy selectInspectionPolicy(Connection conn) {
		Policy p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectInspectionPolicy");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				p = new Policy(rset.getString("POLICY_CONTENT"),
							   rset.getString("MODIFY_DATE"),
							   rset.getString("POLICY_TYPE")
							   );
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return p;
	}
	
	public int updateInspectionPolicy(Connection conn, String content) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateInspectionPolicy");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, content);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}

package com.scale.admin.user.model.dao;

import static com.scale.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.scale.admin.user.model.dao.AdminUserDao;
import com.scale.admin.user.model.vo.AdminUser;

public class AdminUserDao {
	
private Properties prop = new Properties();
	
	public AdminUserDao() {
		String filePath = AdminUserDao.class.getResource("/db/sql/admin-user-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public AdminUser adminLogin(Connection conn, String userId, String userPwd) {
		AdminUser adminUser = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adminLogin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				adminUser = new AdminUser(rset.getInt("user_no"),
										 rset.getString("user_id"),
										 rset.getString("user_pwd"),
										 rset.getString("user_name"),
										 rset.getString("phone"),
										 rset.getString("email"),
										 rset.getDate("enroll_date"),
										 rset.getString("status"),
										 rset.getDate("delete_date"),
										 rset.getString("manager_check")
									 );
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return adminUser;
	}

}

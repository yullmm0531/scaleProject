package com.scale.user.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.scale.user.model.vo.User;
import static com.scale.common.JDBCTemplate.*;

public class UserDao {

	private Properties prop = new Properties();
	
	public UserDao() {
		String filePath = UserDao.class.getResource("/db/sql/user-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public User userLogin(Connection conn, String userId, String userPwd) {
		User loginUser = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("userLogin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new User(rset.getInt("user_no"),
									 rset.getString("user_id"),
									 rset.getString("user_pwd"),
									 rset.getString("user_name"),
									 rset.getString("user_nickname"),
									 rset.getString("phone"),
									 rset.getString("email"),
									 rset.getDate("enroll_date"),
									 rset.getString("status"),
									 rset.getDate("delete_date"),
									 rset.getString("manager_check"),
									 rset.getString("user_acc_bank"),
									 rset.getString("user_acc_number"),
									 rset.getDate("shop_block_date"),
									 rset.getDate("style_block_date"),
									 rset.getString("introduce"),
									 rset.getString("profile_img")
									 );
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return loginUser;
	}
}

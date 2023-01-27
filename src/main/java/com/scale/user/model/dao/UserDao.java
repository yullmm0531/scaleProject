package com.scale.user.model.dao;

import static com.scale.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.scale.user.model.vo.Address;
import com.scale.user.model.vo.User;

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
	
	public int insertUser(Connection conn, User u) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u.getUserId());
			pstmt.setString(2, u.getUserPwd());
			pstmt.setString(3, u.getUserName());
			pstmt.setString(4, u.getUserNickName());
			pstmt.setString(5, u.getPhone());
			pstmt.setString(6, u.getEmail());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertAdd(Connection conn, Address add) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAdd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, add.getZipCode());
			pstmt.setString(2, add.getAddress1());
			pstmt.setString(3, add.getAddress2());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int idCheck(Connection conn, String checkId) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, checkId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	}
	
	public User findId(Connection conn, String userName, String email) {
		User u = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("findId");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userName);
			pstmt.setString(2, email);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				u = new User();
				u.setUserNo(rset.getInt("user_no"));
				u.setUserId(rset.getString("user_id"));
				u.setUserName(rset.getString("user_name"));
				u.setEmail(rset.getString("email"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return u;
	}
}

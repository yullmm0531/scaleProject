package com.scale.user.model.service;

import static com.scale.common.JDBCTemplate.*;

import java.sql.Connection;

import com.scale.user.model.dao.UserDao;
import com.scale.user.model.vo.Address;
import com.scale.user.model.vo.User;

public class UserService {

	public User userLogin(String userId, String userPwd) {
		Connection conn = getConnection();
		User loginUser = new UserDao().userLogin(conn, userId, userPwd);
		close(conn);
		return loginUser;
	}
	
	public int insertUser(User u, Address add) {
		Connection conn = getConnection();
		int result1 = new UserDao().insertUser(conn, u);
		int result2 = new UserDao().insertAdd(conn, add);

		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result1 * result2;
	}
	
	public int idCheck(String checkId) {
		Connection conn = getConnection();
		int count = new UserDao().idCheck(conn, checkId);
		close(conn);
		return count;
	}
	
	public User findId(String userName, String email) {
		Connection conn = getConnection();
		User u = new UserDao().findId(conn, userName, email);
		close(conn);
		return u;
	}
}

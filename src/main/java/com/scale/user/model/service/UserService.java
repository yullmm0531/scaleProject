package com.scale.user.model.service;

import static com.scale.common.JDBCTemplate.*;

import java.sql.Connection;

import com.scale.user.model.dao.UserDao;
import com.scale.user.model.vo.User;

public class UserService {

	public User userLogin(String userId, String userPwd) {
		Connection conn = getConnection();
		User loginUser = new UserDao().userLogin(conn, userId, userPwd);
		close(conn);
		return loginUser;
	}
}

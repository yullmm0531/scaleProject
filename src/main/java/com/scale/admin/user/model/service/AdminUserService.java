package com.scale.admin.user.model.service;

import static com.scale.common.JDBCTemplate.*;

import java.sql.Connection;

import com.scale.admin.user.model.vo.AdminUser;
import com.scale.admin.user.model.dao.AdminUserDao;


public class AdminUserService {

	public AdminUser adminLogin(String userId, String userPwd) {
		Connection conn = getConnection();
		AdminUser adminUser = new AdminUserDao().adminLogin(conn, userId, userPwd);
		close(conn);
		return adminUser;
	}
}

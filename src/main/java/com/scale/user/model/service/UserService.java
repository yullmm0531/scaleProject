package com.scale.user.model.service;

import static com.scale.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.scale.product.model.vo.Product;
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
	
	public User findPwd(String userId, String userName, String email) {
		Connection conn = getConnection();
		User u = new UserDao().findPwd(conn, userId, userName, email);
		close(conn);
		return u;
	}
	
	public int setNewPwd(String userId, String newPwd) {
		Connection conn = getConnection();
		int result = new UserDao().setNewPwd(conn, userId, newPwd);
		
		if(result > 0) {
			commit(conn);
		}else{
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	/**
	 * @param 김진우
	 * @param 회원 삭제용 메소드
	 * @return
	 */
	public int deleteUser(String userId, String userPwd) {
		Connection conn = getConnection();
		int result = new UserDao().deleteUser(conn, userId, userPwd);
		
		if(result > 0) {
			commit(conn);
		}else{
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	


	/**
	 * @writer 먼지링
	 * @param 유저정보를 찾을 때 사용할 nickname
	 * @return User정보
	 */
	public User selectUserByNickname(String nickname) {
		Connection conn = getConnection();
		User user = new UserDao().selectUserByNickname(conn, nickname);
		close(conn);
		return user;
	}

	public Address selectDefaultAddress(int userNo) {
		
		Connection conn = getConnection();
		Address ad = new UserDao().selectDefaultAddress(conn, userNo);
		
		close(conn);
		
		return ad;

	}
	/**
	 * @param 김진우
	 * @param phone : 사용자가 변경하기 위해 새로 입력한 연락처
	 * @return
	 */
	public User updatePhone(String userId, String phone) {
		Connection conn = getConnection();
		int result = new UserDao().updatePhone(conn, userId, phone);
		
		User updateUser = null;
		
		if(result > 0) {
			commit(conn);
			updateUser = new UserDao().selectUserForUpdateUser(conn, userId);
		}else{
			rollback(conn);
		}
		
		close(conn);
		return updateUser;

	}
	
	public User updatePwd(String userId, String updatePwd) {
		Connection conn = getConnection();
		int result = new UserDao().updatePwd(conn, userId, updatePwd);
		
		User updateUser = null;
		
		if(result > 0) {
			commit(conn);
			updateUser = new UserDao().selectUserForUpdateUser(conn, userId);
		}else{
			rollback(conn);
		}
		
		close(conn);
		return updateUser;

	}
	
	public User updateEmail(String userId, String email) {
		Connection conn = getConnection();
		int result = new UserDao().updateEmail(conn, userId, email);
		
		User updateUser = null;
		
		if(result > 0) {
			commit(conn);
			updateUser = new UserDao().selectUserForUpdateUser(conn, userId);
		}else{
			rollback(conn);
		}
		
		close(conn);
		return updateUser;
	}
	
	public ArrayList<Product> userSellList(int userNo) {
		Connection conn = getConnection();
		ArrayList<Product> list = new UserDao().userSellList(conn, userNo);
		close(conn);
		return list;
	}
	
	public User updateNickname(User u) {
		Connection conn = getConnection();
		int result = new UserDao().updateNickname(conn, u);
		User loginUser = null;
		if(result > 0) {
			commit(conn);
			loginUser = new UserDao().userLogin(conn, u.getUserId(), u.getUserPwd());
		} else {
			rollback(conn);
		}
		close(conn);
		return loginUser;
	}
	
	/**
	 * @author yurim
	 * @param userNo : 사용자의 계좌 정보를 찾기 위한 회원번호
	 * @return u
	 */
	public User selectUserAcc(int userNo) {
		
		Connection conn = getConnection();
		User u = new UserDao().selectUserAcc(conn, userNo);
		
		close(conn);
		
		return u;
	}
	
	public Product userDetailImg(int biddingNo) {
		
		Connection conn = getConnection();
		Product p = new UserDao().userDetailImg(conn, biddingNo);
		
		close(conn);
		
		return p;
	}
}

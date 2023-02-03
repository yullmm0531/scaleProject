package com.scale.user.model.dao;

import static com.scale.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.scale.bidding.model.vo.Bidding;
import com.scale.product.model.vo.Product;
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
			pstmt.setString(4, add.getRecipient());
			pstmt.setString(5, add.getPhone());
			
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
	
	public User findPwd(Connection conn, String userId, String userName, String email) {
		User u = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("findPwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userName);
			pstmt.setString(3, email);
			
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
	
	public int setNewPwd(Connection conn, String userId, String newPwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("setNewPwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, newPwd);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int deleteUser(Connection conn, String userId, String userPwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	


	public User selectUserByNickname(Connection conn, String nickname) {
		User user = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectUserByNickname");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickname);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				user = new User();
				user.setUserNo(rset.getInt("user_no"));
				user.setUserId(rset.getString("user_id"));
				user.setUserNickName(rset.getString("user_nickname"));
				user.setProfileImg(rset.getString("profile_img"));
				user.setIntroduce(rset.getString("introduce"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return user;
	}

	public Address selectDefaultAddress(Connection conn, int userNo) {
		
		Address ad = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectDefaultAddress");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				ad = new Address(rset.getInt("address_no"),
								 rset.getString("zipcode"),
								 rset.getString("address1"),
								 rset.getString("address2"),
								 rset.getString("recipient"),
								 rset.getString("phone"));
								
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return ad;
		
	}
	/**
	 * @param conn
	 * @param userId
	 * @param phone : 사용자가 변경하기 위해 새로 입력한 연락처
	 * @return
	 */
	public int updatePhone(Connection conn, String userId, String phone) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePhone");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, phone);
			pstmt.setString(2, userId);
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;

	}
	
	/**
	 * @param 김진우
	 * @param 비밀번호 변경 메소드
	 * @param 
	 * @return
	 */
	public int updatePwd(Connection conn, String userId, String updatePwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, updatePwd);
			pstmt.setString(2, userId);
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;

	}
	
	/**
	 * @param 김진우
	 * @param 마이페이지 내 사항 변경 후 전체 user 정보 조회하는 메소드
	 * @return
	 */
	public User selectUserForUpdateUser(Connection conn, String userId) {
		
		User updateUser = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectUserForUpdateUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				updateUser = new User(rset.getInt("user_no"),
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return updateUser;
	}
	
	public int updateEmail(Connection conn, String userId, String email) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateEmail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, email);
			pstmt.setString(2, userId);
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;

	}
	
	public int updateNickname(Connection conn, User u) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateNickname");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u.getUserNickName());
			pstmt.setString(2, u.getProfileImg());
			pstmt.setString(3, u.getIntroduce());
			pstmt.setInt(4, u.getUserNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
		
	public ArrayList<Product> userSellList(Connection conn, int userNo) {
		ArrayList<Product> list = new ArrayList<>();
				
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("userSellList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product p = new Product();
				p.setProductImgM(rset.getString("product_img_m"));
				p.setProductNameEng(rset.getString("product_name_eng"));
				p.setBrandName(rset.getString("brand_name"));
				p.setDealDate(rset.getDate("deal_date"));
				p.setDealStep(rset.getInt("deal_step"));
				p.setBiddingNo(rset.getInt("bidding_no"));
				list.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public User selectUserAcc(Connection conn, int userNo) {
		
		User u = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectUserAcc");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				u = new User(rset.getInt("user_no"),
							  rset.getString("user_acc_bank"),
							  rset.getString("user_acc_number"),
							  rset.getString("user_name"));	
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return u;
		
	}
	

	public Product userDetailImg(Connection conn, int biddingNo) {
		
		Product p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("userDetailImg");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, biddingNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p = new Product(
				rset.getString("product_name_eng")
				,rset.getString("product_img_m")
				,rset.getString("brand_name")
				);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return p;
	}
	public ArrayList<Address> selectAddressList(Connection conn, int userNo){
		
		ArrayList<Address> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAddressList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Address ad = new Address(rset.getInt("address_no"),
										 rset.getString("zipcode"),
										 rset.getString("address1"),
										 rset.getString("address2"),
										 rset.getString("recipient"),
										 rset.getString("phone"));
				list.add(ad);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	
	public int updateUserAcc(Connection conn, User u) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateUserAcc");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u.getUserAccBank());
			pstmt.setString(2, u.getUserAccNum());
			pstmt.setInt(3, u.getUserNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

	public int updatePaymentAndShipping(Connection conn, Address ad) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updatePaymentAndShipping");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ad.getZipCode());
			pstmt.setString(2, ad.getAddress1());
			pstmt.setString(3, ad.getAddress2());
			pstmt.setString(4, ad.getRecipient());
			pstmt.setString(5, ad.getPhone());
			pstmt.setString(6, ad.getDefaultAdd());
			pstmt.setInt(7, ad.getUserNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public Address selectBasicAddress(Connection conn, int userNo) {
		
		Address ad = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBasicAddress");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				ad = new Address(rset.getInt("address_no")
								,rset.getString("zipCode")
								,rset.getString("address1")
								,rset.getString("address2")
								,rset.getString("recipient")
								,rset.getString("phone")								
								,rset.getInt("userNo")
								,rset.getString("default_add")
								
						);
						
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return ad;
		
	}
	
	public ArrayList<Product> userSellBidding(Connection conn, int userNo) {
		ArrayList<Product> list = new ArrayList<>();
				
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("userSellBidding");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product p = new Product();
				p.setProductImgM(rset.getString("product_img_m"));
				p.setProductNameEng(rset.getString("product_name_eng"));
				p.setBrandName(rset.getString("brand_name"));
				p.setDealDate(rset.getDate("bidding_date"));
				p.setBiddingNo(rset.getInt("bidding_no"));
				list.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public Bidding userDetailSellBidding(Connection conn, int biddingNo) {
		
		Bidding b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("userDetailSellBidding");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, biddingNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				b = new Bidding(rset.getInt("product_size")
						,rset.getString("BIDDING_PRICE")
						,rset.getDate("BIDDING_DATE")
						,rset.getInt("INSPECTION_COST")
						,rset.getInt("COMMISSION")
						,rset.getInt("DELIVERY_FEE")								
						,rset.getInt("SELLER_NO")
						,rset.getString("RECIPIENT_NAME")
						,rset.getString("RECIPIENT_PHONE")
						,rset.getString("RECIPIENT_ZIPCODE")
						,rset.getString("RECIPIENT_ADDRESS")
						,rset.getString("RECIPIENT_SHIPPING_MSG")
						,rset.getString("BANK_NAME")
						,rset.getString("BANK_ACCOUNT")
						,rset.getString("BANK_OWNER_NAME")
						,rset.getString("ADJUSTMENT_PRICE")
						,rset.getString("PRODUCT_IMG_M")
						,rset.getString("PRODUCT_NAME_ENG")
						,rset.getString("PRODUCT_NAME_KO")
						,rset.getString("DEAL_CHECK")
						);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
		}
		return b;
	}
}

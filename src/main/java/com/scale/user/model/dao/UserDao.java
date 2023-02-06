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
import com.scale.bidding.model.vo.Seller;
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
	


	public User selectUserByUserNo(Connection conn, int userNo) {
		User user = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectUserByUserNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
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
				p.setModelCode(rset.getString("model_code"));
				p.setUserNo(rset.getInt("user_no"));
				
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
	

	public Product userDetailImg(Connection conn, int userNo) {
		
		Product p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("userDetailImg");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
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
				p.setProductCode2(rset.getInt("product_code"));
				p.setProductSize(rset.getString("product_size"));
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		System.out.println(list);
		return list;
	}
	
	public int userSellBiddingDrop(Connection conn, int biddingNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("userSellBiddingDrop");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, biddingNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public Seller userDetailSellBidding1(Connection conn, int productCode2, String productSize) {
		
		Seller s = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
		
		String sql = prop.getProperty("userDetailSellBidding1");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productCode2);
			pstmt.setString(2, productSize);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				s = new Seller(rset.getString("RECIPIENT_NAME")
						,rset.getString("RECIPIENT_PHONE")
						
						,rset.getString("RECIPIENT_ADDRESS")
						,rset.getString("RECIPIENT_SHIPPING_MSG")
						,rset.getString("BANK_NAME")
						,rset.getString("BANK_ACCOUNT")
						,rset.getString("BANK_OWNER_NAME")
						,rset.getInt("ADJUSTMENT_PRICE")
						
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
		}
		return s;
	}
	
	public Product userDetailSellBidding2(Connection conn, int productCode2) {
		
		Product p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
		
		String sql = prop.getProperty("userDetailSellBidding2");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productCode2);
			
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				p = new Product(rset.getString("PRODUCT_NAME_ENG")
						,rset.getString("PRODUCT_IMG_M")
						,rset.getString("BRAND_NAME")
						,rset.getString("PRODUCT_NAME_KO")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
		}
		return p;
	}
	
public Bidding userDetailSellBidding3(Connection conn, int productCode2, String productSize, int userNo) {
		
		Bidding b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
		
		String sql = prop.getProperty("userDetailSellBidding3");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productCode2);
			pstmt.setInt(2, userNo);
			pstmt.setString(3, productSize);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				b = new Bidding(rset.getString("COMMISSION")
						,rset.getInt("BIDDING_PRICE")
						,rset.getInt("INSPECTION_COST")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
		}
		return b;
	}
	
	/**
	 * @author yurim
	 * @param conn
	 * @param userNo
	 * @return 기본배송지를 추가하기 전에 기존 기본배송지를 일반배송지로 변경 후 결과 반환 (1 : 성공 | 0 : 실패)
	 */
	public int changeDefAddress(Connection conn, int userNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("changeDefAddress");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	/**
	 * @author yurim
	 * @param conn
	 * @param ad
	 * @return 기본배송지가 아닌 일반 배송지 추가 후 결과 반환 (1 : 성공 | 0 : 실패)
	 */
	public int insertNewAdd(Connection conn, Address ad) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertNewAdd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ad.getZipCode());
			pstmt.setString(2, ad.getAddress1());
			pstmt.setString(3, ad.getAddress2());
			pstmt.setString(4, ad.getRecipient());
			pstmt.setString(5, ad.getPhone());
			pstmt.setInt(6, ad.getUserNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	/**
	 * @author yurim
	 * @param conn
	 * @param ad
	 * @return 기본배송지 추가하고 결과 반환 (1 : 성공 | 0 : 실패)
	 */
	public int insertDefAdd(Connection conn, Address ad) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertDefAdd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ad.getZipCode());
			pstmt.setString(2, ad.getAddress1());
			pstmt.setString(3, ad.getAddress2());
			pstmt.setString(4, ad.getRecipient());
			pstmt.setString(5, ad.getPhone());
			pstmt.setInt(6, ad.getUserNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

	public ArrayList<Address> selectBasicAddressList(Connection conn, int userNo){
		
		ArrayList<Address> list = new ArrayList<>();
		Address ad = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBasicAddressList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				 ad = new Address();
						 ad.setZipCode(rset.getString("zipcode"));
						 ad.setAddresNo(rset.getInt("address_no"));
						 ad.setAddress1(rset.getString("address1"));
						 ad.setAddress2(rset.getString("address2"));
						 ad.setRecipient(rset.getString("recipient"));
						 ad.setPhone(rset.getString("phone"));
						 ad.setUserNo(rset.getInt("user_no"));
						 
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
	
	public int updateBasicAddress(Connection conn, int userNo, int addressNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateBasicAddress");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, addressNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public Bidding selectDetailSellList(Connection conn, int userNo, int biddingNo) {
		
		Bidding b1 = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
						
		String sql = prop.getProperty("selectDetailSellList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, biddingNo);
						
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				b1 = new Bidding(
						rset.getString("BIDDING_PRICE")
						,rset.getDate("BIDDING_DATE")
						,rset.getInt("INSPECTION_COST")
						,rset.getInt("COMMISSION")
						,rset.getString("RECIPIENT_NAME")
						,rset.getString("RECIPIENT_PHONE")
						,rset.getString("RECIPIENT_ZIPCODE")
						,rset.getString("RECIPIENT_ADDRESS")
						,rset.getString("RECIPIENT_SHIPPING_MSG")						
						,rset.getString("BANK_NAME")
						,rset.getString("BANK_ACCOUNT")
						,rset.getString("BANK_OWNER_NAME")
						,rset.getString("MODEL_CODE")
						,rset.getString("ADJUSTMENT_PRICE")
						,rset.getDate("DEAL_DATE")
						);
												
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return b1;
	}
	
	public ArrayList<Product> userBuyList(Connection conn, int userNo) {
		
		ArrayList<Product> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("userBuyList");
		
		
		
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
				p.setUserNo(rset.getInt("user_no"));
				p.setPaymentNo(rset.getString("payment_number"));
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
	
	
	
	public Bidding selectDetailBuyList(Connection conn, String paymentNo, int userNo, int biddingNo) {
		
		Bidding b1 = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
						
		String sql = prop.getProperty("selectDetailBuyList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setString(2, paymentNo);
			pstmt.setInt(3, biddingNo);
						
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				b1 = new Bidding(
						rset.getString("PAYMENT_PRICE")
						,rset.getDate("DEAL_DATE")
						,rset.getInt("DELIVERY_FEE")
						,rset.getString("BIDDING_PRICE")
						,rset.getString("RECIPIENT_NAME")
						,rset.getString("RECIPIENT_PHONE")
						,rset.getString("RECIPIENT_ZIPCODE")
						,rset.getString("RECIPIENT_ADDRESS")
						,rset.getString("RECIPIENT_SHIPPING_MSG")
						
						,rset.getString("PAYMENT_METHOD")
						,rset.getString("PAYMENT_NUMBER")
						
						);
												
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return b1;
	}
	
public Product userDetailImgForBuy(Connection conn, int userNo) {
		
		Product p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("userDetailImgForBuy");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
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
}

package com.scale.bidding.model.dao;

import static com.scale.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.scale.bidding.model.vo.Bidding;
import com.scale.bidding.model.vo.Buyer;
import com.scale.bidding.model.vo.Seller;

public class BiddingDao {
	
	private Properties prop = new Properties();
	
	public BiddingDao() {
		try {
			String filePath = BiddingDao.class.getResource("/db/sql/bidding-mapper.xml").getPath();
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Bidding> selectDealList(Connection conn, String pCode) {
		
		ArrayList<Bidding> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectDealList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pCode);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Bidding b = new Bidding(rset.getInt("bidding_no"),
										rset.getString("product_size"),
										rset.getInt("bidding_price"),
										rset.getString("deal_date"));
				list.add(b);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
	
		return list;
		
	}
	
	
	public ArrayList<Bidding> selectBuyBiddingList(Connection conn, String pCode){
		
		ArrayList<Bidding> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBuyBiddingList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pCode);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Bidding b = new Bidding(rset.getString("product_size"),
										rset.getInt("bidding_price"),
										rset.getInt("count"));
				list.add(b);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	
	
	public ArrayList<Bidding> selectSellBiddingList(Connection conn, String pCode){
		
		ArrayList<Bidding> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSellBiddingList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pCode);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Bidding b = new Bidding(rset.getString("product_size"),
										rset.getInt("bidding_price"),
										rset.getInt("count"));
				list.add(b);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	
	public ArrayList<Bidding> selectDealSizeList(Connection conn, String pCode, String size){
		
		ArrayList<Bidding> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset= null;
		
		String sql = prop.getProperty("selectDealSizeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pCode);
			pstmt.setString(2, size);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Bidding b = new Bidding(rset.getInt("bidding_no"),
										rset.getString("product_size"),
										rset.getInt("bidding_price"),
										rset.getString("deal_date"));
				list.add(b);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	public ArrayList<Bidding> selectSellBiddingSizeList(Connection conn, String pCode, String size){
		
		ArrayList<Bidding> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSellBiddingSizeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pCode);
			pstmt.setString(2, size);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Bidding b = new Bidding(rset.getString("product_size"),
										rset.getInt("bidding_price"),
										rset.getInt("count"));
				list.add(b);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	public ArrayList<Bidding> selectBuyBiddingSizeList(Connection conn, String pCode, String size){
		
		ArrayList<Bidding> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBuyBiddingSizeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pCode);
			pstmt.setString(2, size);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Bidding b = new Bidding(rset.getString("product_size"),
										rset.getInt("bidding_price"),
										rset.getInt("count"));
				list.add(b);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	
	public ArrayList<Bidding> selectSellBiddingPrice(Connection conn, String pCode) {
		
		ArrayList<Bidding> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSellBiddingPriceList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pCode);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Bidding b = new Bidding(rset.getString("product_size"),
										rset.getInt("bidding_price"));
				list.add(b);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	
	public Bidding selectSellBidding(Connection conn, String pCode, String size, int price) {
		
		Bidding b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSellBidding");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pCode);
			pstmt.setString(2, size);
			pstmt.setInt(3, price);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Bidding(rset.getInt("bidding_no"),
								rset.getString("product_code"),
								rset.getString("product_size"),
								rset.getInt("bidding_price"),
								rset.getInt("delivery_fee"));		
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return b;
		
	}
	
	public ArrayList<Bidding> selectBuyBiddingPrice(Connection conn, String pCode) {
		
		ArrayList<Bidding> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBuyBiddingPriceList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pCode);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Bidding b = new Bidding(rset.getString("product_size"),
										rset.getInt("bidding_price"));
				list.add(b);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	public Bidding selectBuyBidding(Connection conn, String pCode, String size, int price) {
		
		Bidding b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBuyBidding");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pCode);
			pstmt.setString(2, size);
			pstmt.setInt(3, price);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Bidding(rset.getInt("bidding_no"),
								rset.getString("product_code"),
								rset.getString("product_size"),
								rset.getInt("bidding_price"),
								rset.getInt("inspection_cost"),
								rset.getInt("commission"));		
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return b;
		
	}
	
	
	public int insertBidding(Connection conn, Bidding b) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertBidding");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getpSize());
			pstmt.setInt(2, b.getbType());
			pstmt.setInt(3, b.getbPrice());
			pstmt.setInt(4, (int)(0.01 * b.getbPrice()));
			pstmt.setInt(5, (int)(0.02 * b.getbPrice()));
			pstmt.setString(6, b.getpCode());
			pstmt.setInt(7, b.getUserNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int insertSeller(Connection conn, Seller sr) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertSeller");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sr.getSellerNo());
			pstmt.setString(2, sr.getRecipientName());
			pstmt.setString(3, sr.getRecipientPhone());
			pstmt.setString(4, sr.getRecipientZipCode());
			pstmt.setString(5, sr.getRecipientAddress());
			pstmt.setString(6, sr.getRecipientShippingMsg());
			pstmt.setString(7, sr.getBankName());
			pstmt.setString(8, sr.getBankAccount());
			pstmt.setString(9, sr.getBankAccountOwner());
			pstmt.setInt(10, sr.getAdjustmentPrice());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	public Bidding selectBiddingSuccess(Connection conn, int userNo) {
		
		Bidding b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBiddingSuccess");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Bidding(rset.getInt("bidding_no"),
								rset.getInt("bidding_price"),
								rset.getInt("inspection_cost"),
								rset.getInt("commission"),
								rset.getInt("delivery_fee"),
								rset.getString("product_img_m"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return b;
		
	}
	
	
	public int updateDealCheck(Connection conn, int bNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateDealCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int updateSeller(Connection conn, int bNo, Seller sr) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateSeller");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNo);
			pstmt.setInt(2, sr.getSellerNo());
			pstmt.setString(3, sr.getRecipientName());
			pstmt.setString(4, sr.getRecipientPhone());
			pstmt.setString(5, sr.getRecipientZipCode());
			pstmt.setString(6, sr.getRecipientAddress());
			pstmt.setString(7, sr.getRecipientShippingMsg());
			pstmt.setString(8, sr.getBankName());
			pstmt.setString(9, sr.getBankAccount());
			pstmt.setString(10, sr.getBankAccountOwner());
			pstmt.setInt(11, sr.getAdjustmentPrice());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	public Bidding selectSellImediatelySuccess(Connection conn, int bNo) {
		
		Bidding b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSellImediatelySuccess");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Bidding(rset.getInt("bidding_no"),
								rset.getInt("bidding_price"),
								rset.getInt("inspection_cost"),
								rset.getInt("commission"),
								rset.getString("product_img_m"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return b;
		
	}
	
	public int insertBuyer(Connection conn, Buyer br) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertBuyer");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, br.getBuyerNo());
			pstmt.setString(2, br.getRecipientName());
			pstmt.setString(3, br.getRecipientPhone());
			pstmt.setString(4, br.getRecipientZipCode());
			pstmt.setString(5, br.getRecipientAddress());
			pstmt.setString(6, br.getRecipientShippingMsg());
			pstmt.setString(7, br.getPaymentNum());
			pstmt.setString(8, br.getPaymentMethod());
			pstmt.setInt(9, br.getPaymentPrice());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int updateBuyer(Connection conn, int bNo, Buyer br) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateBuyer");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNo);
			pstmt.setInt(2, br.getBuyerNo());
			pstmt.setString(3, br.getRecipientName());
			pstmt.setString(4, br.getRecipientPhone());
			pstmt.setString(5, br.getRecipientZipCode());
			pstmt.setString(6, br.getRecipientAddress());
			pstmt.setString(7, br.getRecipientShippingMsg());
			pstmt.setString(8, br.getPaymentNum());
			pstmt.setString(9, br.getPaymentMethod());
			pstmt.setInt(10, br.getPaymentPrice());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public Bidding selectBuyImediatelySuccess(Connection conn, int bNo) {
		
		Bidding b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBuyImediatelySuccess");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Bidding(rset.getInt("bidding_no"),
								rset.getInt("bidding_price"),
								rset.getInt("delivery_fee"),
								rset.getString("product_img_m"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return b;
		
	}
	
	
}

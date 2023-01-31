package com.scale.bidding.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import static com.scale.common.JDBCTemplate.*;

import com.scale.bidding.model.vo.Bidding;
import com.scale.product.model.dao.ProductDao;

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
	
}

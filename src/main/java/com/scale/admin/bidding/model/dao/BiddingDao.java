package com.scale.admin.bidding.model.dao;

import static com.scale.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.scale.admin.bidding.model.vo.Bidding;
import com.scale.common.model.vo.PageInfo;
import com.scale.customerCenter.model.vo.Faq;
import com.scale.customerCenter.model.vo.Notice;
import com.scale.style.model.dao.StyleDao;

public class BiddingDao {
	
	
	private Properties prop = new Properties();
	
	
	public BiddingDao() {
		try {
			String filePath = StyleDao.class.getResource("/db/sql/admin-bidding-mapper.xml").getPath();
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	public int selectBiddingListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBiddingCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	
	public ArrayList<Bidding> selectBiddingList(Connection conn, PageInfo pi){
		ArrayList<Bidding> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBiddingList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Bidding(rset.getInt("bidding_no"),
									 rset.getString("product_size"),
									 rset.getString("bidding_type"),
									 rset.getInt("bidding_price"),
									 rset.getString("bidding_date"),
									 rset.getString("bidding_status"),
									 rset.getString("product_code"),
									 rset.getString("product_name_ko"),
									 rset.getString("user_id")		
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int selectBiddingTypeCount(Connection conn, String biddingType) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBiddingTypeCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, biddingType);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
		
	}
	
	
	public ArrayList<Bidding> selectBiddingTypeList(Connection conn, String biddingType, PageInfo pi){
		ArrayList<Bidding> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBiddingTypeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, biddingType);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Bidding(rset.getInt("bidding_no"),
									 rset.getString("product_size"),
									 rset.getString("bidding_type"),
									 rset.getInt("bidding_price"),
									 rset.getString("bidding_date"),
									 rset.getString("bidding_status"),
									 rset.getString("product_code"),
									 rset.getString("product_name_ko"),
									 rset.getString("user_id")	
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	
	public int selectDealListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectDealListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	
	public ArrayList<Bidding> selectDealList(Connection conn, PageInfo pi){
		ArrayList<Bidding> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectDealList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Bidding(rset.getInt("bidding_no"),
									 rset.getString("deal_step"),
									 rset.getString("store_date"),
									 rset.getString("inspection_date"),
									 rset.getString("ship_date"),
									 rset.getString("product_code"),
									 rset.getString("product_name_ko"),
									 rset.getString("buyer_id"),
									 rset.getString("seller_id")		
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	
	public int updateDealStep(Connection conn, int bNo, String dStep) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateDealStep");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dStep);
			pstmt.setInt(2, bNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	public int updateStoreDate(Connection conn, int bNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateStoreDate");
		
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
	
	
	public int updateInspectionDate(Connection conn, int bNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateInspectionDate");
		
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


	public int updateShipDate(Connection conn, int bNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateShipDate");
		
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
	
	public Bidding selectChangeBidding(Connection conn, int bNo) {
		
		Bidding b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectChangeBidding");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Bidding(rset.getInt("bidding_no"),
							    rset.getString("deal_step"),
							    rset.getString("store_date"),
							    rset.getString("inspection_date"),
							    rset.getString("ship_date"),
							    rset.getString("product_code"),
							    rset.getString("product_name_ko"),
							    rset.getString("buyer_id"),
							    rset.getString("seller_id"));
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

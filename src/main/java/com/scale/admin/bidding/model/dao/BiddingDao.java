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
	
	
	
}

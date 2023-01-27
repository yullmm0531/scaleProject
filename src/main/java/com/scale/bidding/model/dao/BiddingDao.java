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
										rset.getInt("product_size"),
										rset.getString("bidding_price"),
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
	
	
}

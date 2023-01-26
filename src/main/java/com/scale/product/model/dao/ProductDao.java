package com.scale.product.model.dao;

import static com.scale.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.scale.product.model.vo.Product;

public class ProductDao {

private Properties prop = new Properties();

	public ProductDao() {
		String filePath = ProductDao.class.getResource("/db/sql/product.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Product> selectProductList(Connection conn){
	
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProductList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
		
			while(rset.next()) {
				Product p = new Product();
				p.setProductNameKo(rset.getString("product_name_ko"));
				p.setProductNameEng(rset.getString("product_name_eng"));
				p.setProductImgM(rset.getString("product_img_m"));
				p.setBrandName(rset.getString("brand_name"));
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}
	
	
}

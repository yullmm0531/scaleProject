package com.scale.product.model.dao;

import static com.scale.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.scale.product.model.vo.Brand;
import com.scale.product.model.vo.Product;

public class ProductDao {

	private Properties prop = new Properties();

	public ProductDao() {
		String filePath = ProductDao.class.getResource("/db/sql/product-mapper.xml").getPath();
		
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
				p.setProductCode(rset.getString("product_code"));
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
	

	public ArrayList<Brand> selectBrandList(Connection conn){
		
		ArrayList<Brand> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBrandList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset= pstmt.executeQuery();
			
			while(rset.next()) {
				Brand b = new Brand();
				b.setBrandName(rset.getString("brand_name"));
				b.setBrandImg(rset.getString("brand_img"));
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
	

	/*
	public ArrayList<Product> selectProductSearchList(Connection conn, String pkey){
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
	}
	*/
	
	

	public Product selectProduct(Connection conn, String pCode) {
		
		Product p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p = new Product(rset.getString("product_code"),
								rset.getString("product_name_ko"),
								rset.getString("product_name_eng"),
								rset.getString("model_code"),
								rset.getString("product_img_m"),
								rset.getString("product_size"),
								rset.getString("brand_name"),
								rset.getString("color"),
								rset.getDate("release_date"),
								rset.getString("release_price"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return p;
		
	}


}

package com.scale.admin.product.model.dao;


import static com.scale.common.JDBCTemplate.*;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.scale.common.model.vo.PageInfo;
import com.scale.admin.product.model.vo.*;
import com.scale.admin.product.model.vo.Brand;
import com.scale.admin.product.model.vo.Product;
import com.scale.admin.product.model.vo.ProductImg;

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
	
	
	public ArrayList<Product> selectAdProductList(Connection conn){
	
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAdProductList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
		
			while(rset.next()) {
				Product p = new Product();
				p.setProductCode(rset.getString("product_code"));
				p.setProductNameKo(rset.getString("product_name_ko"));
				p.setProductNameEng(rset.getString("product_name_eng"));
				p.setModelCode(rset.getString("model_code"));
				p.setBlindCheck(rset.getString("blind_check"));
				p.setEnrollDate(rset.getDate("enroll_date"));
				p.setProductCategory(rset.getString("product_category"));
				p.setProductSize(rset.getString("product_size"));
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
	
	public ArrayList<Brand> selectAdBrandList(Connection conn){
		
		ArrayList<Brand> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAdBrandList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset= pstmt.executeQuery();
			
			while(rset.next()) {
				Brand b = new Brand();
				b.setBrandName(rset.getString("brand_name"));
				b.setBrandCode(rset.getInt("brand_code"));
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
	
	
	public int searchProductCount(Connection conn){
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchProductCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");		// 구하고자하는값 getInt // Count(*) => count 별칭
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}  finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
		
	}
	
	
	public ArrayList<Product> selectProductSearchList(Connection conn, PageInfo pi, String keyword){
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProductSearchList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();
			
			
			while(rset.next()) {
				Product p = new Product();
				p.setProductCode(rset.getString("product_code"));
				p.setProductNameKo(rset.getString("product_name_ko"));
				p.setProductNameEng(rset.getString("product_name_eng"));
				p.setModelCode(rset.getString("model_code"));
				p.setBlindCheck(rset.getString("blind_check"));
				p.setEnrollDate(rset.getDate("enroll_date"));
				p.setProductCategory(rset.getString("product_category"));
				p.setProductSize(rset.getString("product_size"));
				p.setBrandName(rset.getString("brand_name"));
				
				
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	public int increaseCount(Connection conn, int productCode) {
		int result =0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, productCode);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	public Product selectProductDetail(Connection conn, int productCode) {
		Product p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProductDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, productCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p = new Product(rset.getint("product_code"),
								rset.getString("product_name_ko"),
								rset.getString("product_name_eng"),
								rset.getString("model_code"),
								rset.getString("product_img_m"),
								rset.getString("blind_check"),
								rset.getDate("enroll_date"),
								rset.getString("product_category"),
								rset.getString("product_size"),
								rset.getString("brand_name")
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
	
	
	public ProductImg selectAdProductImg(Connection conn, int productCode) {
		ProductImg at = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAdProductImg");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productCode);
			
			rset = pstmt.executeQuery();
			/*
			if(rset.next()) {
				at = new ProductImg(rset.getInt("file_no"),
									rset.getString("origin_name"),
									rset.getString("change_name"),
									rset.getString("file_path"));
			
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}  finally {
			close(rset);
			close(pstmt);
		}
		
		return at;
		
	}
	*/
	
	public int insertProduct(Connection conn, Product p) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getProductCode());
			pstmt.setString(2, p.getProductNameKo());
			pstmt.setString(3, p.getProductNameEng());
			pstmt.setString(4, p.getProductCategory());
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result ;
		
	}
	
	
	public int updateProduct(Connection conn, Product p) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getProductCode());
			pstmt.setString(2, p.getProductNameKo());
			pstmt.setString(3, p.getProductNameEng());
			pstmt.setString(4, p.getProductCategory());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	
	
	
	
}

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
import com.scale.product.model.vo.Like;
import com.scale.product.model.vo.Product;
import com.scale.product.model.vo.ProductImg;
import com.scale.style.model.vo.Style;
import com.scale.style.model.vo.StyleImg;

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
				p.setProductCategory(rset.getString("product_category"));
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
	
	
	public ArrayList<Product> selectProductListPage(Connection conn, int currentPage, int boardLimit){
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProductListPage");
		
		try {
			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product p = new Product();
				p.setProductCode(rset.getString("product_code"));
				p.setProductNameKo(rset.getString("product_name_ko"));
				p.setProductNameEng(rset.getString("product_name_eng"));
				p.setProductImgM(rset.getString("product_img_m"));
				p.setBrandName(rset.getString("brand_name"));
				p.setCount(rset.getInt("Count"));
				
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
	
	
	public ArrayList<Product> selectProductSort(Connection conn, int currentPage, int boardLimit){
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProductSort");
		
		try {
			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product p = new Product();
				p.setProductCode(rset.getString("product_code"));
				p.setProductNameKo(rset.getString("product_name_ko"));
				p.setProductNameEng(rset.getString("product_name_eng"));
				p.setProductImgM(rset.getString("product_img_m"));
				p.setBrandName(rset.getString("brand_name"));
				p.setCount(rset.getInt("Count"));
				
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
	

	
	public ArrayList<Product> selectProductSearchList(Connection conn, String keyword){
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProductSearchList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			pstmt.setString(2, keyword);
			rset = pstmt.executeQuery();
			
			
			while(rset.next()) {
				Product p = new Product();
				p.setProductCode(rset.getString("product_code"));
				p.setProductNameKo(rset.getString("product_name_ko"));
				p.setProductNameEng(rset.getString("product_name_eng"));
				p.setProductImgM(rset.getString("product_img_m"));
				
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
	
	
	public ArrayList<Like> clickLike(Connection conn) {
		
		ArrayList<Like> clickLike = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("clickLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Like l = new Like(rset.getString("product_code"),
								  rset.getInt("like"));
				clickLike.add(l);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return clickLike;
		
	}
	
	
	
	public int insertLike(Connection conn, int userNo, String pCode) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setString(2, pCode);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	public int deleteLike(Connection conn, int userNo, String pCode) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setString(2, pCode);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	public ArrayList<Product> selectProductFilter(Connection conn, String filter) {
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProductFilter");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, filter);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product p = new Product();
				p.setProductCode(rset.getString("product_code"));
				p.setProductNameKo(rset.getString("product_name_ko"));
				p.setProductNameEng(rset.getString("product_name_eng"));
				p.setProductImgM(rset.getString("product_img_m"));
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
								rset.getInt("release_price"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return p;
		
	}
	
	
	public ArrayList<ProductImg> selectProductImg(Connection conn, String pCode){
		
		ArrayList<ProductImg> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectProductImg");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pCode);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ProductImg pi = new ProductImg(rset.getInt("product_img_no"),
											   rset.getString("p_file_path"));
				list.add(pi);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	public ArrayList<Product> selectPdSearchList(Connection conn, String keyword){
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPdSearchList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			pstmt.setString(2, keyword);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product pd = new Product();
				pd.setProductCode(rset.getString("product_code"));
				pd.setProductNameKo(rset.getString("product_name_ko"));
				pd.setProductNameEng(rset.getString("product_name_eng"));
				pd.setProductImgM(rset.getString("product_img_m"));
				pd.setBrandName(rset.getString("brand_name"));
				
				list.add(pd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public Product selectPCode(Connection conn, String pCode) {
		Product p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPCode");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pCode);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p = new Product();
				p.setProductCode(rset.getString("product_code"));
				p.setProductNameKo(rset.getString("product_name_ko"));
				p.setProductNameEng(rset.getString("product_name_eng"));
				p.setProductImgM(rset.getString("product_img_m"));
				p.setBrandName(rset.getString("brand_name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return p;
	}
	
	
	public int selectCountLike(Connection conn, String pCode) {
		
		int likeCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCountLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				likeCount = rset.getInt("likecount");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return likeCount;
			
	}
	
	
	public int selectUserLike(Connection conn, int userNo, String pCode) {
		
		int userLike = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectUserLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setString(2, pCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				userLike = rset.getInt("like");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return userLike;
		
	}
	
	
	public ArrayList<Like> selectUserAllLike(Connection conn, int userNo){
		
		ArrayList<Like> userLike = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectUserAllLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Like l = new Like(rset.getString("product_code"),
								  rset.getInt("like"));
				userLike.add(l);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return userLike;
		
	}
	
	
	public ArrayList<Style> selectReviewStyle(Connection conn, String pCode){
		
		ArrayList<Style> stList = new ArrayList<Style> ();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReviewStyle");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pCode);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Style st = new Style(rset.getInt("style_no"),
									 rset.getString("style_content"),
									 rset.getString("hashtag"),
									 rset.getString("user_id"));
				stList.add(st);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return stList;
		
	}
	
	
	public StyleImg selectReviewImg(Connection conn, int styleNo){
		
		StyleImg si = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReviewImg");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, styleNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				si = new StyleImg(rset.getString("file_path"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return si;
	}


}

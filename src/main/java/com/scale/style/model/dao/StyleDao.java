package com.scale.style.model.dao;

import static com.scale.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.scale.product.model.vo.Product;
import com.scale.style.model.vo.Hashtag;
import com.scale.style.model.vo.Style;
import com.scale.style.model.vo.StyleImg;

public class StyleDao {
	
	private Properties prop = new Properties();
	
	public StyleDao() {
		try {
			String filePath = StyleDao.class.getResource("/db/sql/style-mapper.xml").getPath();
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
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
	
	public ArrayList<Style> selectStyleList(Connection conn, int currentPage, int boardLimit){
		ArrayList<Style> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectStyleList");
		
		try {
			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Style st = new Style();
				st.setStyleNo(rset.getInt("style_no"));
				st.setProfileImg(rset.getString("profile_img"));
				st.setCount(rset.getInt("count"));
				st.setStyleWriter(rset.getString("user_nickname"));
				st.setHashtag(rset.getString("hashtag"));
				
				list.add(st);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list; 
	}
	
	public ArrayList<StyleImg> selectStyleImgList(Connection conn){
		ArrayList<StyleImg> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectStyleImgList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				StyleImg img = new StyleImg();
				img.setImgNo(rset.getInt("img_no"));
				img.setChangeName(rset.getString("change_name"));
				img.setFilePath(rset.getString("file_path"));
				img.setStyleNo(rset.getInt("style_no"));
				img.setFileLevel(rset.getInt("file_level"));
				
				list.add(img);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public ArrayList<Hashtag> selectTagList(Connection conn){
		ArrayList<Hashtag> tag = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTagList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				 Hashtag t = new Hashtag();
				 t.setHashtagNo(rset.getInt("hashtag_no"));
				 t.setKeyword(rset.getString("keyword"));
				 
				 tag.add(t);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return tag;
	}
	
	public ArrayList<Style> selectNewStyleList(Connection conn, int currentPage, int boardLimit){
		ArrayList<Style> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNewStyleList");
		
		try {
			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Style st = new Style();
				st.setStyleNo(rset.getInt("style_no"));
				st.setProfileImg(rset.getString("profile_img"));
				st.setCount(rset.getInt("count"));
				st.setStyleWriter(rset.getString("user_nickname"));
				st.setHashtag(rset.getString("hashtag"));
				
				list.add(st);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list; 
	}
	
	public ArrayList<Style> selectSearchList(Connection conn, String keyword){
		ArrayList<Style> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectSearchList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Style st = new Style();
				st.setStyleNo(rset.getInt("style_no"));
				st.setProfileImg(rset.getString("profile_img"));
				st.setCount(rset.getInt("count"));
				st.setStyleWriter(rset.getString("user_nickname"));
				st.setHashtag(rset.getString("hashtag"));
				
				list.add(st);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list; 
	}
	
	public ArrayList<Product> selectPdAllList(Connection conn){
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPdAllList");
		
		try {
			pstmt = conn.prepareStatement(sql);
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
	
	public int insertStyle(Connection conn, Style s) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertStyle");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, s.getContent());
			pstmt.setString(2, s.getHashtag());
			pstmt.setString(3, s.getStyleWriter());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}

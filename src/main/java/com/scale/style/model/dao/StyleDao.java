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
				if(rset.getString("hashtag") != null) {
					st.setHashtag(rset.getString("hashtag").split(" "));
				} else {
					st.setHashtag(new String[0]);
				}
				
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
				if(rset.getString("hashtag") != null) {
					st.setHashtag(rset.getString("hashtag").split(" "));
				} else {
					st.setHashtag(new String[0]);
				}
				
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
	
}

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
	
	public int selectSearchListCount(Connection conn, String keyword) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectSearchListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
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
	
	public int selectStyleCountByUserNo(Connection conn, int userNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectStyleCountByUserNo");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
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
	
	public ArrayList<Style> selectStyleByHashtag(Connection conn, int currentPage, int boardLimit, String keyword){
		ArrayList<Style> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectStyleByHashtag");
		
		try {
			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
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
	
	public ArrayList<StyleImg> selectStyleImgByNo(Connection conn, int styleNo){
		ArrayList<StyleImg> imgs = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectStyleImgByNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, styleNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				StyleImg si = new StyleImg();
				si.setImgNo(rset.getInt("img_no"));
				si.setChangeName(rset.getString("change_name"));
				si.setFilePath(rset.getString("file_path"));
				si.setStyleNo(rset.getInt("style_no"));
				si.setFileLevel(rset.getInt("file_level"));
				
				imgs.add(si);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return imgs;
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
	
	public int insertStyleImg(Connection conn, ArrayList<StyleImg> list) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertStyleImg");
		
		try {
			for(StyleImg img : list) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, img.getOriginName());
				pstmt.setString(2, img.getChangeName());
				pstmt.setString(3, img.getFilePath());
				pstmt.setInt(4, img.getFileLevel());
				
				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertStylePd(Connection conn, String[] codeArr) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertStylePd");
		
		try {
			for(int i=0; i<codeArr.length; i++) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, codeArr[i]);
				
				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public Hashtag selectHashtag(Connection conn, String tag) {
		Hashtag t = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectHashtag");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tag);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				t = new Hashtag();
				t.setHashtagNo(rset.getInt("hashtag_no"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return t;
	}
	
	public int insertHashtag(Connection conn, String tag) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertHashtag");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tag);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateHashtag(Connection conn, String tag) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateHashtag");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tag);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public ArrayList<Style> selectStyleByNickname(Connection conn, int currentPage, int boardLimit, String nickname){
		ArrayList<Style> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectStyleByNickname");
		
		try {
			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickname);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Style st = new Style();
				st.setStyleNo(rset.getInt("style_no"));
				st.setProfileImg(rset.getString("profile_img"));
				st.setCount(rset.getInt("count"));
				st.setUserId(rset.getString("user_id"));
				st.setIntroduce(rset.getString("introduce"));
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
	
	public int checkLike(Connection conn, int userNo, int styleNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("checkLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, styleNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	
	public int deleteLike(Connection conn, int userNo, int styleNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, styleNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertLike(Connection conn, int userNo, int styleNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, styleNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
}

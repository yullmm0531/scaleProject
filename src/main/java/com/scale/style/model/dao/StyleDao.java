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

import com.scale.common.model.vo.PageInfo;
import com.scale.product.model.vo.Product;
import com.scale.style.model.vo.Hashtag;
import com.scale.style.model.vo.Style;
import com.scale.style.model.vo.StyleImg;
import com.scale.style.model.vo.StyleReport;

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
				st.setUserId(rset.getString("user_id"));
				st.setUserNo(rset.getInt("user_no"));
				st.setHashtag(rset.getString("hashtag"));
				st.setEnrollDate(rset.getDate("enroll_date"));
				st.setRowNum(rset.getInt("rnum"));
				st.setContent(rset.getString("style_content"));
				
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
				st.setUserId(rset.getString("user_id"));
				st.setUserNo(rset.getInt("user_no"));
				st.setEnrollDate(rset.getDate("enroll_date"));
				st.setHashtag(rset.getString("hashtag"));
				st.setRowNum(rset.getInt("rnum"));
				st.setContent(rset.getString("style_content"));
				
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
	
	public ArrayList<StyleImg> selectReportStyleImgByNo(Connection conn, int styleNo){
		ArrayList<StyleImg> imgs = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReportStyleImgByNo");
		
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
				st.setUserId(rset.getString("user_id"));
				st.setUserNo(rset.getInt("user_no"));
				st.setEnrollDate(rset.getDate("enroll_date"));
				st.setHashtag(rset.getString("hashtag"));
				st.setRowNum(rset.getInt("rnum"));
				st.setContent(rset.getString("style_content"));
				
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
	
	public ArrayList<Style> selectStyleByUserNo(Connection conn, int currentPage, int boardLimit, int userNo){
		ArrayList<Style> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectStyleByUserNo");
		
		try {
			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
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
				st.setUserNo(rset.getInt("user_no"));
				st.setEnrollDate(rset.getDate("enroll_date"));
				st.setHashtag(rset.getString("hashtag"));
				st.setRowNum(rset.getInt("rnum"));
				st.setContent(rset.getString("style_content"));
				
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
	
	public ArrayList<Style> selectTrendingDetailList(Connection conn, int cpage, int boardLimit){
		ArrayList<Style> list = new ArrayList<Style>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectStyleList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = 1;
			int endRow = ((cpage - 1) * boardLimit + 1) + boardLimit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Style st = new Style();
				st.setRowNum(rset.getInt("rnum"));
				st.setStyleNo(rset.getInt("style_no"));
				st.setProfileImg(rset.getString("profile_img"));
				st.setCount(rset.getInt("count"));
				st.setStyleWriter(rset.getString("user_nickname"));
				st.setUserNo(rset.getInt("user_no"));
				st.setUserId(rset.getString("user_id"));
				st.setHashtag(rset.getString("hashtag"));
				st.setEnrollDate(rset.getDate("enroll_date"));
				st.setContent(rset.getString("style_content"));
				
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
	
	public ArrayList<Style> selectNewestDetailList(Connection conn, int cpage, int boardLimit) {
		ArrayList<Style> list = new ArrayList<Style>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNewStyleList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = 1;
			int endRow = ((cpage - 1) * boardLimit + 1) + boardLimit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Style st = new Style();
				st.setRowNum(rset.getInt("rnum"));
				st.setStyleNo(rset.getInt("style_no"));
				st.setProfileImg(rset.getString("profile_img"));
				st.setCount(rset.getInt("count"));
				st.setStyleWriter(rset.getString("user_nickname"));
				st.setUserNo(rset.getInt("user_no"));
				st.setUserId(rset.getString("user_id"));
				st.setHashtag(rset.getString("hashtag"));
				st.setEnrollDate(rset.getDate("enroll_date"));
				st.setContent(rset.getString("style_content"));
				
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
	
	public ArrayList<Style> selectTagSearchDetailList(Connection conn, int cpage, int boardLimit, String tag) {
		ArrayList<Style> list = new ArrayList<Style>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectStyleByHashtag");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = 1;
			int endRow = ((cpage - 1) * boardLimit + 1) + boardLimit - 1;
			
			pstmt.setString(1, tag);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Style st = new Style();
				st.setRowNum(rset.getInt("rnum"));
				st.setStyleNo(rset.getInt("style_no"));
				st.setProfileImg(rset.getString("profile_img"));
				st.setCount(rset.getInt("count"));
				st.setStyleWriter(rset.getString("user_nickname"));
				st.setUserNo(rset.getInt("user_no"));
				st.setUserId(rset.getString("user_id"));
				st.setHashtag(rset.getString("hashtag"));
				st.setEnrollDate(rset.getDate("enroll_date"));
				st.setContent(rset.getString("style_content"));
				
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
	
	public ArrayList<Style> selectProfileDetailList(Connection conn, int cpage, int boardLimit, String uNum) {
		ArrayList<Style> list = new ArrayList<Style>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectStyleByUserNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = 1;
			int endRow = ((cpage - 1) * boardLimit + 1) + boardLimit - 1;
			
			pstmt.setString(1, uNum);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Style st = new Style();
				st.setRowNum(rset.getInt("rnum"));
				st.setStyleNo(rset.getInt("style_no"));
				st.setProfileImg(rset.getString("profile_img"));
				st.setCount(rset.getInt("count"));
				st.setStyleWriter(rset.getString("user_nickname"));
				st.setUserId(rset.getString("user_id"));
				st.setUserNo(rset.getInt("user_no"));
				st.setHashtag(rset.getString("hashtag"));
				st.setEnrollDate(rset.getDate("enroll_date"));
				st.setContent(rset.getString("style_content"));
				
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
	
	public ArrayList<Product> selectDetailProduct(Connection conn, int styleNo) {
		ArrayList<Product> plist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectDetailProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, styleNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product pd = new Product();
				pd.setStyleNo(rset.getInt("style_no"));
				pd.setProductCode(rset.getString("product_code"));
				pd.setProductNameKo(rset.getString("product_name_ko"));
				pd.setProductNameEng(rset.getString("product_name_eng"));
				pd.setProductImgM(rset.getString("product_img_m"));
				pd.setBrandName(rset.getString("brand_name"));
				
				plist.add(pd);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return plist;
	}
	
	public int insertStyleReport(Connection conn, StyleReport rep) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertStyleReport");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rep.getReportedUser());
			pstmt.setInt(2, rep.getReportingUser());
			pstmt.setString(3, rep.getTitle());
			pstmt.setString(4, rep.getContent());
			pstmt.setInt(5, rep.getStyleNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public Style selectStyle(Connection conn, int styleNo) {
		Style st = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectStyle");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, styleNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				st = new Style();
				st.setStyleNo(rset.getInt("style_no"));
				st.setContent(rset.getString("style_content"));
				st.setEnrollDate(rset.getDate("enroll_date"));
				st.setHashtag(rset.getString("hashtag"));
				st.setStyleWriter(rset.getString("user_nickname"));
				st.setUserNo(rset.getInt("user_no"));
				st.setProfileImg(rset.getString("profile_img"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return st;
	}
	
	public Style selectReportStyle(Connection conn, int styleNo) {
		Style st = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReportStyle");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, styleNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				st = new Style();
				st.setStyleNo(rset.getInt("style_no"));
				st.setContent(rset.getString("style_content"));
				st.setEnrollDate(rset.getDate("enroll_date"));
				st.setHashtag(rset.getString("hashtag"));
				st.setStyleWriter(rset.getString("user_nickname"));
				st.setUserNo(rset.getInt("user_no"));
				st.setProfileImg(rset.getString("profile_img"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return st;
	}
	
	public int deleteStyle(Connection conn, String no) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteStyle");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int deleteStyleImg(Connection conn, String no) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteStyleImg");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int adminSearchListCountByNickname(Connection conn, String keyword, String date1, String date2) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adminSearchListCountByNickname");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			pstmt.setString(2, date1);
			pstmt.setString(3, date2);
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
	
	public int adminSearchListCountByHashtag(Connection conn, String keyword, String date1, String date2) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adminSearchListCountByHashtag");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			pstmt.setString(2, date1);
			pstmt.setString(3, date2);
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
	
	public ArrayList<Style> adminSearchListByNickname(Connection conn, int cpage, int boardLimit, String keyword, String date1, String date2) {
		ArrayList<Style> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adminSearchListByNickname");
		
		try {
			int startRow = (cpage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			pstmt.setString(2, date1);
			pstmt.setString(3, date2);
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Style st = new Style();
				st.setStyleNo(rset.getInt("style_no"));
				st.setProfileImg(rset.getString("profile_img"));
				st.setStyleWriter(rset.getString("user_nickname"));
				st.setUserNo(rset.getInt("user_no"));
				st.setHashtag(rset.getString("hashtag"));
				st.setEnrollDate(rset.getDate("enroll_date"));
				st.setContent(rset.getString("style_content"));
				
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
	
	public ArrayList<Style> adminSearchListByHashtag(Connection conn, int cpage, int boardLimit, String keyword, String date1, String date2) {
		ArrayList<Style> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adminSearchListByHashtag");
		
		try {
			int startRow = (cpage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			pstmt.setString(2, date1);
			pstmt.setString(3, date2);
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Style st = new Style();
				st.setStyleNo(rset.getInt("style_no"));
				st.setProfileImg(rset.getString("profile_img"));
				st.setStyleWriter(rset.getString("user_nickname"));
				st.setUserNo(rset.getInt("user_no"));
				st.setHashtag(rset.getString("hashtag"));
				st.setEnrollDate(rset.getDate("enroll_date"));
				st.setContent(rset.getString("style_content"));
				
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
	
	public int deleteImg(Connection conn, int styleNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteImg");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, styleNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int deleteProduct(Connection conn, int styleNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, styleNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateStyle(Connection conn, Style st) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateStyle");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, st.getContent());
			pstmt.setString(2, st.getHashtag());
			pstmt.setInt(3, st.getStyleNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertChangeStyleImg(Connection conn, int styleNo, ArrayList<StyleImg> list) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertChangeStyleImg");
		
		try {
			for(StyleImg img : list) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, img.getOriginName());
				pstmt.setString(2, img.getChangeName());
				pstmt.setString(3, img.getFilePath());
				pstmt.setInt(4, img.getFileLevel());
				pstmt.setInt(5, styleNo);
				
				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertChangeStylePd(Connection conn, int styleNo, String[] codeArr) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertChangeStylePd");
		
		try {
			for(int i=0; i<codeArr.length; i++) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, styleNo);
				pstmt.setString(2, codeArr[i]);
				
				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int selectReportCount(Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReportCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
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
	
	public ArrayList<StyleReport> selectReportList(Connection conn, PageInfo pi) {
		ArrayList<StyleReport> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReportList");
		
		try {
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new StyleReport(rset.getInt("report_no"),
										 rset.getInt("reported_user"),
										 rset.getInt("reporting_user"),
										 rset.getString("report_title"),
										 rset.getString("report_content"),
										 rset.getDate("report_date"),
										 rset.getInt("style_no"),
										 rset.getString("report_check"),
										 rset.getString("reported_id"),
										 rset.getString("reporting_id")
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
	
	public StyleReport selectReport(Connection conn, int repNo) {
		StyleReport rep = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReport");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, repNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				rep = new StyleReport(rset.getInt("report_no"),
									  rset.getInt("reported_user"),
									  rset.getInt("reporting_user"),
									  rset.getString("report_title"),
									  rset.getString("report_content"),
									  rset.getDate("report_date"),
									  rset.getInt("style_no"),
									  rset.getString("report_check"),
									  rset.getString("reported_id"),
									  rset.getString("reporting_id")
									  );
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return rep;
	}
	
	public int rejectReport(Connection conn, int repNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("rejectReport");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, repNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int processReport(Connection conn, int repNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("processReport");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, repNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int selectReportCountByNo(Connection conn, int userNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReportCountByNo");
		
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
	
	public int updateStyleBlockDate(Connection conn, int userNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateStyleBlockDate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int selectReportCountByNickname(Connection conn, String id) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReportCountByNickname");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
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
	
	public int selectReportCountByStatus(Connection conn, String id, String select) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReportCountByStatus");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, select);
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
	
	public int selectReportCountByOnlyStatus(Connection conn, int select) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReportCountByOnlyStatus");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, select);
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
	
	public ArrayList<StyleReport> selectReportByNickname(Connection conn, PageInfo pi, String id){
		ArrayList<StyleReport> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReportByNickname");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new StyleReport(rset.getInt("report_no"),
									     rset.getInt("reported_user"),
									     rset.getInt("reporting_user"),
									     rset.getString("report_title"),
									     rset.getString("report_content"),
									     rset.getDate("report_date"),
									     rset.getInt("style_no"),
									     rset.getString("report_check"),
									     rset.getString("reported_id"),
									     rset.getString("reporting_id")
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
	
	public ArrayList<StyleReport> selectReportByStatus(Connection conn, PageInfo pi, String id, String select){
		ArrayList<StyleReport> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReportByStatus");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, id);
			pstmt.setString(2, select);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new StyleReport(rset.getInt("report_no"),
									     rset.getInt("reported_user"),
									     rset.getInt("reporting_user"),
									     rset.getString("report_title"),
									     rset.getString("report_content"),
									     rset.getDate("report_date"),
									     rset.getInt("style_no"),
									     rset.getString("report_check"),
									     rset.getString("reported_id"),
									     rset.getString("reporting_id")
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
	
	public ArrayList<StyleReport> selectReportByOnlyStatus(Connection conn, PageInfo pi, int select){
		ArrayList<StyleReport> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReportByOnlyStatus");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, select);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new StyleReport(rset.getInt("report_no"),
									     rset.getInt("reported_user"),
									     rset.getInt("reporting_user"),
									     rset.getString("report_title"),
									     rset.getString("report_content"),
									     rset.getDate("report_date"),
									     rset.getInt("style_no"),
									     rset.getString("report_check"),
									     rset.getString("reported_id"),
									     rset.getString("reporting_id")
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

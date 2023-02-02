package com.scale.style.model.service;

import static com.scale.common.JDBCTemplate.close;
import static com.scale.common.JDBCTemplate.commit;
import static com.scale.common.JDBCTemplate.getConnection;
import static com.scale.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.scale.product.model.vo.Product;
import com.scale.style.model.dao.StyleDao;
import com.scale.style.model.vo.Hashtag;
import com.scale.style.model.vo.Style;
import com.scale.style.model.vo.StyleImg;

public class StyleService {
	
	public int selectListCount() {
		Connection conn = getConnection();
		int result = new StyleDao().selectListCount(conn);
		close(conn);
		return result;
	}
	
	public int selectSearchListCount(String keyword) {
		Connection conn = getConnection();
		int result = new StyleDao().selectSearchListCount(conn, keyword);
		close(conn);
		return result;
	}
	
	public int selectStyleCountByUserNo(int userNo) {
		Connection conn = getConnection();
		int result = new StyleDao().selectStyleCountByUserNo(conn, userNo);
		close(conn);
		return result;
	}
	
	public ArrayList<Style> selectStyleList(int currentPage, int boardLimit){
		Connection conn = getConnection();
		ArrayList<Style> list = new StyleDao().selectStyleList(conn, currentPage, boardLimit);
		close(conn);
		return list;
	}
	
	public ArrayList<Style> selectStyleByHashtag(int currentPage, int boardLimit, String keyword){
		Connection conn = getConnection();
		ArrayList<Style> list = new StyleDao().selectStyleByHashtag(conn, currentPage, boardLimit, keyword);
		close(conn);
		return list;
	}
	
	public ArrayList<StyleImg> selectStyleImgByNo(int styleNo){
		Connection conn = getConnection();
		ArrayList<StyleImg> imgs = new StyleDao().selectStyleImgByNo(conn, styleNo);
		close(conn);
		return imgs;
	}
	
	public ArrayList<Hashtag> selectTagList(){
		Connection conn = getConnection();
		ArrayList<Hashtag> tag = new StyleDao().selectTagList(conn);
		close(conn);
		return tag;
	}
	
	public ArrayList<Style> selectNewStyleList(int currentPage, int boardLimit){
		Connection conn = getConnection();
		ArrayList<Style> list = new StyleDao().selectNewStyleList(conn, currentPage, boardLimit);
		close(conn);
		return list;
	}
	
	public int insertStyle(Style s, ArrayList<StyleImg> list, String pcode) {
		Connection conn = getConnection();
		
		// 1. TB_STYLE INSERT(필수)
		int result1 = new StyleDao().insertStyle(conn, s);
		
		// 2. TB_STYLE_IMG INSERT(필수)
		int result2 = new StyleDao().insertStyleImg(conn, list);
		
		// 3. TB_STYLE-PD INSERT(선택)
		int result3 = 1;
		if(pcode != "") {
			String[] codeArr = pcode.split(" ");
			result3 = new StyleDao().insertStylePd(conn, codeArr);
		}
		
		// 4. TB_HASHTAG INSERT(선택) 
		// 먼저 기존의 해쉬태그 있는지 확인(SELECT) 후 있으면 UPDATE 없으면 INSERT(반복문)
		int result4 = 1;
		if(s.getHashtag() != "") {
			String[] tagArr = s.getHashtag().split(" ");
			for(int i=0; i<tagArr.length; i++) {
				Hashtag t = new StyleDao().selectHashtag(conn, tagArr[i]);
				if(t == null) {
					// INSERT
					result4 = new StyleDao().insertHashtag(conn, tagArr[i]);
				} else {
					// UPDATE
					result4 = new StyleDao().updateHashtag(conn, tagArr[i]);
				}
			}
		}
		
		if(result1 > 0 && result2 > 0 && result3 > 0 && result4 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2 * result3 * result4;
	}
	
	public ArrayList<Style> selectStyleByID(int currentPage, int boardLimit, String id){
		Connection conn = getConnection();
		ArrayList<Style> list = new StyleDao().selectStyleByID(conn, currentPage, boardLimit,id);
		close(conn);
		return list;
	}
	
	public int checkLike(int userNo, int styleNo) {
		Connection conn = getConnection();
		int result = new StyleDao().checkLike(conn, userNo, styleNo);
		close(conn);
		return result;
	}
	
	public int updateLike(int checkLike, int userNo, int styleNo) {		
		Connection conn = getConnection();
		int result = 0;
		if(checkLike > 0) {
			result = new StyleDao().deleteLike(conn, userNo, styleNo);
		} else {
			result = new StyleDao().insertLike(conn, userNo, styleNo);
		}
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public ArrayList<Style> selectDetailList(int cpage, String view, int boardLimit, String tag, String nickname){
		Connection conn = getConnection();
		
		ArrayList<Style> list = new ArrayList<Style>();
		switch(view) {
		case "trending": list = new StyleDao().selectTrendingDetailList(conn, cpage, boardLimit);  break;
		case "newest": list = new StyleDao().selectNewestDetailList(conn, cpage, boardLimit); break;
		case "tagsearch": list = new StyleDao().selectTagSearchDetailList(conn, cpage, boardLimit, tag); break;
		case "profile": list = new StyleDao().selectProfileDetailList(conn, cpage, boardLimit, nickname); break;
		}
		close(conn);
		return list;
	}
	
	public ArrayList<Product> selectDetailProduct(int styleNo) {
		Connection conn = getConnection();
		ArrayList<Product> plist = new StyleDao().selectDetailProduct(conn, styleNo);
		close(conn);
		return plist;
	}

	public HashMap<String, Object> selectDetail(int cpage, String view, int boardLimit, String tag, String id, int userNo){
		Connection conn = getConnection();
		
		ArrayList<Style> list = new ArrayList<Style>();
		switch(view) {
		case "trending": list = new StyleDao().selectTrendingDetailList(conn, cpage, boardLimit);  break;
		case "profile": list = new StyleDao().selectProfileDetailList(conn, cpage, boardLimit, id); break;
		case "newest": list = new StyleDao().selectNewestDetailList(conn, cpage, boardLimit); break;
		case "tagsearch": list = new StyleDao().selectTagSearchDetailList(conn, cpage, boardLimit, tag); break;
		}
		
		ArrayList<StyleImg> ilist = new ArrayList<>();
		ArrayList<Product> plist = new ArrayList<>();
		for(Style st : list) {
			ArrayList<StyleImg> imgs = new StyleDao().selectStyleImgByNo(conn, st.getStyleNo());
			for(StyleImg si : imgs) {
				ilist.add(si);
			}
			ArrayList<Product> pds = new StyleDao().selectDetailProduct(conn, st.getStyleNo());
			for(Product pd : pds) {
				plist.add(pd);
			}
		}
		
		int[] checkLike = new int[list.size()];
		for(int i=0; i<list.size(); i++) {
			int styleNo = list.get(i).getStyleNo();
			checkLike[i] = new StyleDao().checkLike(conn, userNo, styleNo);
		}
		
		HashMap<String, Object> map = new HashMap();
		map.put("list", list);
		map.put("ilist", ilist);
		map.put("plist", plist);
		map.put("checkLike", checkLike);
		
		return map;
	}
	
	public HashMap<String, Object> selectAddDetail(String view, int cpage, int userNo, int boardLimit, String tag, String id) {
		Connection conn = getConnection();
		
		ArrayList<Style> list = new ArrayList<Style>();
		switch(view) {
		case "trending": list = new StyleDao().selectStyleList(conn, cpage, boardLimit);  break;
		case "profile": list = new StyleDao().selectStyleByID(conn, cpage, boardLimit, id); break;
		case "newest": list = new StyleDao().selectNewStyleList(conn, cpage, boardLimit); break;
		case "tagsearch": list = new StyleDao().selectStyleByHashtag(conn, cpage, boardLimit, tag); break;
		}
		
		ArrayList<StyleImg> ilist = new ArrayList<>();
		ArrayList<Product> plist = new ArrayList<>();
		for(Style st : list) {
			ArrayList<StyleImg> imgs = new StyleDao().selectStyleImgByNo(conn, st.getStyleNo());
			for(StyleImg si : imgs) {
				ilist.add(si);
			}
			ArrayList<Product> pds = new StyleDao().selectDetailProduct(conn, st.getStyleNo());
			for(Product pd : pds) {
				plist.add(pd);
			}
		}
		
		int[] checkLike = new int[list.size()];
		for(int i=0; i<list.size(); i++) {
			int styleNo = list.get(i).getStyleNo();
			checkLike[i] = new StyleDao().checkLike(conn, userNo, styleNo);
		}
		
		HashMap<String, Object> map = new HashMap();
		map.put("list", list);
		map.put("ilist", ilist);
		map.put("plist", plist);
		map.put("checkLike", checkLike);
		
		return map;
		
	}
}

package com.scale.style.model.service;

import static com.scale.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

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
	
	public ArrayList<Style> selectStyleList(int currentPage, int boardLimit){
		Connection conn = getConnection();
		ArrayList<Style> list = new StyleDao().selectStyleList(conn, currentPage, boardLimit);
		close(conn);
		return list;
	}
	
	public ArrayList<StyleImg> selectStyleImgList(){
		Connection conn = getConnection();
		ArrayList<StyleImg> ilist = new StyleDao().selectStyleImgList(conn);
		close(conn);
		return ilist;
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
	
	public ArrayList<Style> selectSearchList(String keyword){
		Connection conn = getConnection();
		ArrayList<Style> list = new StyleDao().selectSearchList(conn, keyword);
		close(conn);
		return list;
	}
	
	public ArrayList<Product> selectPdAllList(){
		Connection conn = getConnection();
		ArrayList<Product> list = new StyleDao().selectPdAllList(conn);
		close(conn);
		return list;
	}
	
	public ArrayList<Product> selectPdSearchList(String keyword){
		Connection conn = getConnection();
		ArrayList<Product> list = new StyleDao().selectPdSearchList(conn, keyword);
		close(conn);
		return list;
	}
	
	public Product selectPCode(String pCode) {
		Connection conn = getConnection();
		Product p = new StyleDao().selectPCode(conn, pCode);
		close(conn);
		return p;
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
	
	public ArrayList<Style> selectStyleByNickname(int currentPage, int boardLimit, String nickname){
		Connection conn = getConnection();
		ArrayList<Style> list = new StyleDao().selectStyleByNickname(conn, currentPage, boardLimit,nickname);
		close(conn);
		return list;
	}

}

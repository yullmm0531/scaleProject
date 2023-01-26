package com.scale.style.model.service;

import static com.scale.common.JDBCTemplate.close;
import static com.scale.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

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

}

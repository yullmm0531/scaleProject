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
	
	public ArrayList<Style> selectStyleList(){
		Connection conn = getConnection();
		ArrayList<Style> list = new StyleDao().selectStyleList(conn);
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
	
	public ArrayList<Style> selectNewStyleList(){
		Connection conn = getConnection();
		ArrayList<Style> list = new StyleDao().selectNewStyleList(conn);
		close(conn);
		return list;
	}

}

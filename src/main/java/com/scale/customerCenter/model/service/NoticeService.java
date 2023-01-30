package com.scale.customerCenter.model.service;

import static com.scale.common.JDBCTemplate.close;
import static com.scale.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.scale.common.model.vo.PageInfo;
import com.scale.customerCenter.model.dao.NoticeDao;
import com.scale.customerCenter.model.vo.Notice;

public class NoticeService {

	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new NoticeDao().selectListCount(conn);
		close(conn);
		return listCount;
	}
	
	public ArrayList<Notice> selectNoticeList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectNoticeList(conn, pi);
		close(conn);
		return list;
	}
	
	public int searchNoticeCount(String option, String keyword) {
		Connection conn = getConnection();
		int listCount = 0;
		switch(option) {
			case "all": listCount = new NoticeDao().searchNoticeAllCount(conn, keyword); break;
			case "title": listCount = new NoticeDao().searchNoticeTitleCount(conn, keyword); break;
			case "content": listCount = new NoticeDao().searchNoticeContentCount(conn, keyword); break;
		}
		close(conn);
		return listCount;
	}
	
	public ArrayList<Notice> searchNoticeList(PageInfo pi, String option, String keyword) {
		Connection conn = getConnection();
		ArrayList<Notice> list = new ArrayList<>();
		switch(option) {
			case "all": list = new NoticeDao().searchNoticeListAll(conn, pi, keyword); break;
			case "title": list = new NoticeDao().searchNoticeListTitle(conn, pi, keyword); break;
			case "content": list = new NoticeDao().searchNoticeListContent(conn, pi, keyword); break;
		}
		close(conn);
		return list;
	}
}

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
}

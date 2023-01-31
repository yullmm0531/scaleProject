package com.scale.customerCenter.model.service;

import static com.scale.common.JDBCTemplate.close;
import static com.scale.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.scale.common.model.vo.PageInfo;
import com.scale.customerCenter.model.dao.CustomerCenterDao;
import com.scale.customerCenter.model.vo.Faq;
import com.scale.customerCenter.model.vo.Notice;

public class CustomerCenterService {

	public int selectNoticeListCount() {
		Connection conn = getConnection();
		int listCount = new CustomerCenterDao().selectNoticeListCount(conn);
		close(conn);
		return listCount;
	}
	
	public ArrayList<Notice> selectNoticeList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Notice> list = new CustomerCenterDao().selectNoticeList(conn, pi);
		close(conn);
		return list;
	}
	
	public int searchNoticeCount(String option, String keyword) {
		Connection conn = getConnection();
		int listCount = 0;
		switch(option) {
			case "all": listCount = new CustomerCenterDao().searchNoticeAllCount(conn, keyword); break;
			case "title": listCount = new CustomerCenterDao().searchNoticeTitleCount(conn, keyword); break;
			case "content": listCount = new CustomerCenterDao().searchNoticeContentCount(conn, keyword); break;
		}
		close(conn);
		return listCount;
	}
	
	public ArrayList<Notice> searchNoticeList(PageInfo pi, String option, String keyword) {
		Connection conn = getConnection();
		ArrayList<Notice> list = new ArrayList<>();
		switch(option) {
			case "all": list = new CustomerCenterDao().searchNoticeListAll(conn, pi, keyword); break;
			case "title": list = new CustomerCenterDao().searchNoticeListTitle(conn, pi, keyword); break;
			case "content": list = new CustomerCenterDao().searchNoticeListContent(conn, pi, keyword); break;
		}
		close(conn);
		return list;
	}
	
	public int selectFaqListCountAll() {
		Connection conn = getConnection();
		int listCount = new CustomerCenterDao().selectFaqListCountAll(conn);
		close(conn);
		return listCount;
	}
	
	public int selectFaqListCount(String category) {
		Connection conn = getConnection();
		int listCount = new CustomerCenterDao().selectFaqListCount(conn, category);
		close(conn);
		return listCount;
	}
	
	public ArrayList<Faq> selectFaqListAll(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Faq> list = new CustomerCenterDao().selectFaqListAll(conn, pi);
		close(conn);
		return list;
	}
	
	public ArrayList<Faq> selectFaqList(String category, PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Faq> list = new CustomerCenterDao().selectFaqList(conn, category, pi);
		close(conn);
		return list;
	}
}

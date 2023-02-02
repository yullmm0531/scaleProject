package com.scale.customerCenter.model.service;

import static com.scale.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.scale.common.model.vo.PageInfo;
import com.scale.customerCenter.model.dao.CustomerCenterDao;
import com.scale.customerCenter.model.vo.Faq;
import com.scale.customerCenter.model.vo.Inquire;
import com.scale.customerCenter.model.vo.Notice;

public class CustomerCenterService {

	/**
	 * 공지사항 전체 개수 조회
	 * @return 공지사항 전체 개수
	 */
	public int selectNoticeListCount() {
		Connection conn = getConnection();
		int listCount = new CustomerCenterDao().selectNoticeListCount(conn);
		close(conn);
		return listCount;
	}
	
	/**
	 * 공지사항 전체 리스트 조회
	 * @param pi
	 * @return 공지사항 전체 리스트
	 */
	public ArrayList<Notice> selectNoticeList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Notice> list = new CustomerCenterDao().selectNoticeList(conn, pi);
		close(conn);
		return list;
	}
	
	/**
	 * 공지사항 검색결과 개수 조회
	 * @param option
	 * @param keyword
	 * @return 공지사항 검색 개수
	 */
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
	
	/**
	 * 조건별 공지사항 검색결과 리스트 조회
	 * @param pi
	 * @param option
	 * @param keyword
	 * @return 공지사항 검색결과 리스트
	 */
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
	
	
	// faq
	/**
	 * faq 전체 개수 조회
	 * @return faq 개수
	 */
	public int selectFaqListCountAll() {
		Connection conn = getConnection();
		int listCount = new CustomerCenterDao().selectFaqListCountAll(conn);
		close(conn);
		return listCount;
	}
	
	/**
	 * 카테고리별 faq 개수 조회
	 * @param category
	 * @return 카테고리별 faq 개수
	 */
	public int selectFaqListCount(String category) {
		Connection conn = getConnection();
		int listCount = new CustomerCenterDao().selectFaqListCount(conn, category);
		close(conn);
		return listCount;
	}
	
	/**
	 * faq 전체 리스트 조회
	 * @param pi
	 * @return faq 전체 리스트
	 */
	public ArrayList<Faq> selectFaqListAll(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Faq> list = new CustomerCenterDao().selectFaqListAll(conn, pi);
		close(conn);
		return list;
	}
	
	/**
	 * faq 카테고리별 리스트 조회
	 * @param category
	 * @param pi
	 * @return faq 카테고리별 리스트
	 */
	public ArrayList<Faq> selectFaqList(String category, PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Faq> list = new CustomerCenterDao().selectFaqList(conn, category, pi);
		close(conn);
		return list;
	}
	
	/**
	 * faq 검색결과 개수 조회
	 * @param keyword
	 * @return faq 검색결과 개수
	 */
	public int selectFaqSearchCount(String keyword) {
		Connection conn = getConnection();
		int searchCount = new CustomerCenterDao().selectFaqSearchCount(conn, keyword);
		close(conn);
		return searchCount;
	}
	
	public ArrayList<Faq> selectFaqSearchList(String keyword, PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Faq> searchList = new CustomerCenterDao().selectFaqSearchList(conn, keyword, pi);
		close(conn);
		return searchList;
	}
	
	// 1:1문의
	
	/**
	 * 1:1문의 개수 조회
	 * @param userNo
	 * @return 1:1문의 개수
	 */
	public int selectInquireCount(int userNo) {
		Connection conn = getConnection();
		int listCount = new CustomerCenterDao().selectInquireCount(conn, userNo);
		close(conn);
		return listCount;
	}
	
	/**
	 * 1:1문의 리스트 조회
	 * @param userNo
	 * @param pi
	 * @return 1:1문의 리스트
	 */
	public ArrayList<Inquire> selectInquireList(int userNo, PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Inquire> list = new CustomerCenterDao().selectInquireList(conn, userNo, pi);
		close(conn);
		return list;
	}
	
	/**
	 * 1:1 문의글 삭제
	 * @param inquireNo
	 * @return 성공 개수
	 */
	public int deleteInquire(int inquireNo) {
		Connection conn = getConnection();
		int result = new CustomerCenterDao().deleteInquire(conn, inquireNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	/**
	 * 1:1 문의글 등록
	 * @param iq
	 * @return 성공 개수
	 */
	public int insertInquire(Inquire iq) {
		Connection conn = getConnection();
		int result = new CustomerCenterDao().insertInquire(conn, iq);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
}

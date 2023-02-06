package com.scale.admin.customerCenter.model.service;

import static com.scale.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.scale.admin.customerCenter.model.dao.AdminCustomerCenterDao;
import com.scale.common.model.vo.PageInfo;
import com.scale.customerCenter.model.vo.Faq;
import com.scale.customerCenter.model.vo.Inquire;
import com.scale.customerCenter.model.vo.Notice;

public class AdminCustomerCenterService {

	// ---------------------어드민----------------------------------
	
		// 공지사항
		public int selectAdminNoticeCount() {
			Connection conn = getConnection();
			int listCount = new AdminCustomerCenterDao().selectAdminNoticeCount(conn);
			close(conn);
			return listCount;
		}
		
		public ArrayList<Notice> selectAdminNoticeList(PageInfo pi){
			Connection conn = getConnection();
			ArrayList<Notice> list = new AdminCustomerCenterDao().selectAdminNoticeList(conn, pi);
			close(conn);
			return list;
		}
		
		/**
		 * 공지사항 검색결과 개수 조회
		 * @param option
		 * @param keyword
		 * @return 공지사항 검색 개수
		 */
		public int searchAdminNoticeCount(String option, String keyword) {
			Connection conn = getConnection();
			int listCount = 0;
			switch(option) {
				case "all": listCount = new AdminCustomerCenterDao().searchAdminNoticeAllCount(conn, keyword); break;
				case "title": listCount = new AdminCustomerCenterDao().searchAdminNoticeTitleCount(conn, keyword); break;
				case "content": listCount = new AdminCustomerCenterDao().searchAdminNoticeContentCount(conn, keyword); break;
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
		public ArrayList<Notice> searchAdminNoticeList(PageInfo pi, String option, String keyword) {
			Connection conn = getConnection();
			ArrayList<Notice> list = new ArrayList<>();
			switch(option) {
				case "all": list = new AdminCustomerCenterDao().searchAdminNoticeListAll(conn, pi, keyword); break;
				case "title": list = new AdminCustomerCenterDao().searchAdminNoticeListTitle(conn, pi, keyword); break;
				case "content": list = new AdminCustomerCenterDao().searchAdminNoticeListContent(conn, pi, keyword); break;
			}
			close(conn);
			return list;
		}
		
		/**
		 * 공지사항 상세 조회
		 * @param noticeNo
		 * @return Notice n
		 */
		public Notice selectAdminNoticeDetail(int noticeNo) {
			Connection conn = getConnection();
			Notice n = new AdminCustomerCenterDao().selectAdminNoticeDetail(conn, noticeNo);
			close(conn);
			return n;
		}
		
		/**
		 * 공지사항 등록
		 * @param title
		 * @param content
		 * @param display
		 * @param noticeWriter
		 * @return int 성공개수
		 */
		public int insertNotice(String title, String content, String display, String noticeWriter) {
			Connection conn = getConnection();
			int result = new AdminCustomerCenterDao().insertNotice(conn, title, content, display, noticeWriter);
			
			if(result > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			close(conn);
			return result;
		}
		
		public int updateNotice(Notice n) {
			Connection conn = getConnection();
			int result = new AdminCustomerCenterDao().updateNotice(conn, n);
			
			if(result > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			close(conn);
			return result;
		}
		
		public int deleteNotice(int noticeNo) {
			Connection conn = getConnection();
			int result = new AdminCustomerCenterDao().deleteNotice(conn, noticeNo);
			
			if(result > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			close(conn);
			return result;
		}
		
		// faq
		
		public ArrayList<Faq> selectAdminFaqListAll(PageInfo pi){
			Connection conn = getConnection();
			ArrayList<Faq> list = new AdminCustomerCenterDao().selectAdminFaqListAll(conn, pi);
			close(conn);
			return list;
		}
		
		public int insertFaq(Faq f) {
			Connection conn = getConnection();
			int result = new AdminCustomerCenterDao().insertFaq(conn, f);
			
			if(result > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			close(conn);
			return result;
		}
		
		/**
		 * 카테고리별 faq 개수 조회
		 * @param category
		 * @return 카테고리별 faq 개수
		 */
		public int selectAdminFaqListCount(String category) {
			Connection conn = getConnection();
			int listCount = new AdminCustomerCenterDao().selectAdminFaqListCount(conn, category);
			close(conn);
			return listCount;
		}
		
		
		/**
		 * faq 카테고리별 리스트 조회
		 * @param category
		 * @param pi
		 * @return faq 카테고리별 리스트
		 */
		public ArrayList<Faq> selectAdminFaqList(String category, PageInfo pi){
			Connection conn = getConnection();
			ArrayList<Faq> list = new AdminCustomerCenterDao().selectAdminFaqList(conn, category, pi);
			close(conn);
			return list;
		}
		
		/**
		 * faq 검색결과 개수 조회
		 * @param keyword
		 * @return faq 검색결과 개수
		 */
		public int selectAdminFaqSearchCount(String keyword) {
			Connection conn = getConnection();
			int searchCount = new AdminCustomerCenterDao().selectAdminFaqSearchCount(conn, keyword);
			close(conn);
			return searchCount;
		}
		
		public ArrayList<Faq> selectAdminFaqSearchList(String keyword, PageInfo pi){
			Connection conn = getConnection();
			ArrayList<Faq> searchList = new AdminCustomerCenterDao().selectAdminFaqSearchList(conn, keyword, pi);
			close(conn);
			return searchList;
		}
		
		public int updateFaq(Faq f) {
			Connection conn = getConnection();
			int result = new AdminCustomerCenterDao().updateFaq(conn, f);
			close(conn);
			return result;
		}
		
		public int deleteFaq(int faqNo) {
			Connection conn = getConnection();
			int result = new AdminCustomerCenterDao().deleteFaq(conn, faqNo);
			close(conn);
			return result;
		}
		
		// ------------- 1:1문의 --------------------------
		
		public int selectAdminInquireCount() {
			Connection conn = getConnection();
			int listCount = new AdminCustomerCenterDao().selectAdminInquireCount(conn);
			close(conn);
			return listCount;
		}
		
		public ArrayList<Inquire> selectAdminInquireList(PageInfo pi){
			Connection conn = getConnection();
			ArrayList<Inquire> list = new  AdminCustomerCenterDao().selectAdminInquireList(conn, pi);
			close(conn);
			return list;
		}
		
		public Inquire selectAdminInquireDetail(int inquireNo) {
			Connection conn = getConnection();
			Inquire iq = new AdminCustomerCenterDao().selectAdminInquireDetail(conn, inquireNo);
			close(conn);
			return iq;
		}
		
		public int updateAnswer(Inquire iq) {
			Connection conn = getConnection();
			int result = new AdminCustomerCenterDao().updateAnswer(conn, iq);
			close(conn);
			return result;
		}
		
		public int selectAdminInquireCountCategory(String category) {
			Connection conn = getConnection();
			int result = new AdminCustomerCenterDao().selectAdminInquireCountCategory(conn, category);
			close(conn);
			return result;
		}
		
		public ArrayList<Inquire> selectAdminInquireListCategory(String category, PageInfo pi){
			Connection conn = getConnection();
			ArrayList<Inquire> list = new AdminCustomerCenterDao().selectAdminInquireListCategory(conn, category, pi);
			close(conn);
			return list;
		}
}

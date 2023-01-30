package com.scale.customerCenter.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scale.common.model.vo.PageInfo;
import com.scale.customerCenter.model.service.NoticeService;
import com.scale.customerCenter.model.vo.Notice;

/**
 * Servlet implementation class NoticeSearchController
 */
@WebServlet("/search.no")
public class NoticeSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String option = request.getParameter("option");
		String keyword = request.getParameter("keyword");

		// 페이징바
		int listCount = new NoticeService().searchNoticeCount(option, keyword);
		int currentPage = Integer.parseInt(request.getParameter("cpage"));
		System.out.println(currentPage);
		int pageLimit = 5;
		int boardLimit = 10;
		
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		int endPage  = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		// 페이지 조회
		ArrayList<Notice> list = new NoticeService().searchNoticeList(pi, option, keyword);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("keyword", keyword);
		
		request.getRequestDispatcher("views/customerCenter/noticeSearchListView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package com.scale.admin.style.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scale.common.model.vo.PageInfo;
import com.scale.style.model.service.StyleService;
import com.scale.style.model.vo.StyleReport;

/**
 * Servlet implementation class ReportListViewController
 */
@WebServlet("/stylereport.ad")
public class ReportManageViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportManageViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cpage = Integer.parseInt(request.getParameter("cpage"));
		int boardLimit = 10;
		int listCount = new StyleService().selectReportCount();
		int pageLimit = 10;
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = (cpage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfo pi = new PageInfo(listCount, cpage, pageLimit, boardLimit, maxPage,  startPage, endPage);
		
		ArrayList<StyleReport> list = new StyleService().selectReportList(pi);
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/admin/style/reportListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

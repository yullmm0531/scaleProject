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
 * Servlet implementation class SearchReportController
 */
@WebServlet("/searchreport.ad")
public class SearchReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchReportController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String select = request.getParameter("select");
		String id = request.getParameter("id");
		
		int cpage = Integer.parseInt(request.getParameter("cpage"));
		int boardLimit = 12;
		int listCount = new StyleService().searchReportCount(select, id);
		int pageLimit = 10;
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = (cpage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, cpage, pageLimit, boardLimit, maxPage, startPage, endPage);
		ArrayList<StyleReport> list = new StyleService().selectSearchReport(pi, select, id);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("select", select);
		request.setAttribute("id", id);
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

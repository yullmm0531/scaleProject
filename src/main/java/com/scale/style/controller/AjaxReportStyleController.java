package com.scale.style.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scale.style.model.service.StyleService;
import com.scale.style.model.vo.StyleReport;
import com.scale.user.model.vo.User;

/**
 * Servlet implementation class AjaxReportStyleController
 */
@WebServlet("/reportStyle.ajax")
public class AjaxReportStyleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReportStyleController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reportedNo = Integer.parseInt(request.getParameter("reportedUserNo"));
		int reportingNo = ((User)request.getSession().getAttribute("loginUser")).getUserNo();
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int styleNo = Integer.parseInt(request.getParameter("reportedStyleNo"));
		
		StyleReport rep = new StyleReport(reportedNo, reportingNo, title, content, styleNo);
		int result = new StyleService().insertStyleReport(rep);
		
		response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

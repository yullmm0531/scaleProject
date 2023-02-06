package com.scale.admin.style.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scale.style.model.service.StyleService;

/**
 * Servlet implementation class ProcessReportController
 */
@WebServlet("/processreport.ad")
public class ProcessReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProcessReportController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int repNo = Integer.parseInt(request.getParameter("repNo"));
		int styleNo = Integer.parseInt(request.getParameter("styleNo"));
		int cpage = Integer.parseInt(request.getParameter("cpage"));
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		int result = new StyleService().processReport(repNo, userNo);
		
		if(result == 0) {
			request.getSession().setAttribute("alertMsg", "신고처리 실패");
		}
		response.sendRedirect(request.getContextPath() + "/detailreport.ad?repNo=" + repNo + "&styleNo=" + styleNo + "&cpage=" + cpage);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package com.scale.admin.style.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scale.style.model.service.StyleService;

/**
 * Servlet implementation class ReportRejectController
 */
@WebServlet("/rejectReport.ad")
public class ReportRejectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportRejectController() {
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
		int result = new StyleService().rejectReport(repNo);
		if(result == 0) {
			request.getSession().setAttribute("alertMsg", "반려 처리 실패");
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

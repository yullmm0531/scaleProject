package com.scale.admin.style.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scale.style.model.service.StyleService;
import com.scale.style.model.vo.StyleReport;

/**
 * Servlet implementation class ReportDetailController
 */
@WebServlet("/detailreport.ad")
public class ReportDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int repNo = Integer.parseInt(request.getParameter("repNo"));
		int styleNo = Integer.parseInt(request.getParameter("styleNo"));
		HashMap<String, Object> map = new StyleService().selectStyleDetail(styleNo);
		StyleReport rep = new StyleService().selectReport(repNo);
		
		if(map.get("st") != null && rep != null) {
			request.setAttribute("st", map.get("st"));
			request.setAttribute("ilist", map.get("ilist"));
			request.setAttribute("plist", map.get("plist"));
			request.getRequestDispatcher("views/admin/style/reportDetailView.jsp").forward(request, response);
		} else {
			request.getSession().setAttribute("alertMsg", "신고 상세 조회에 실패했습니다.");
			response.sendRedirect(request.getContextPath() + "/");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

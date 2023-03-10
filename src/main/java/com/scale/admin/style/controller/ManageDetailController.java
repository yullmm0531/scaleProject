package com.scale.admin.style.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scale.style.model.service.StyleService;

/**
 * Servlet implementation class ReportDetailController
 */
@WebServlet("/detailStyle.ad")
public class ManageDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int styleNo = Integer.parseInt(request.getParameter("no"));
		int cpage = Integer.parseInt(request.getParameter("cpage"));
		HashMap<String, Object> map = new StyleService().selectStyleDetail(styleNo);
		
		request.setAttribute("st", map.get("st"));
		request.setAttribute("ilist", map.get("ilist"));
		request.setAttribute("plist", map.get("p"));
		request.setAttribute("cpage", cpage);
		if(map.get("st") != null && map.get("ilist") != null) {
			request.getRequestDispatcher("views/admin/style/manageDetailView.jsp").forward(request, response);
		} else {
			request.getSession().setAttribute("alertMsg", "스타일 상세조회에 실패했습니다.");
			response.sendRedirect(request.getContextPath() + "/stylelist.ad?cpage=" + cpage);
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

package com.scale.admin.customerCenter.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scale.admin.customerCenter.model.service.AdminCustomerCenterService;

/**
 * Servlet implementation class AdminNoticeEnrollController
 */
@WebServlet("/enrollNotice.ad")
public class AdminNoticeEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeEnrollController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String title = request.getParameter("title");
		String content = request.getParameter("noticeDoc");
		String display = request.getParameter("display");
		String noticeWriter = request.getParameter("noticeWriter");
		
		int result = new AdminCustomerCenterService().insertNotice(title, content, display, noticeWriter);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "공지사항이 등록되었습니다.");
			response.sendRedirect(request.getContextPath() + "/noticeList.ad?cpage=1");
		}else {
			request.getSession().setAttribute("alertMsg", "공지사항 등록 실패");
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

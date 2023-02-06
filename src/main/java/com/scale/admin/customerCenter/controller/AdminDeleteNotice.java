package com.scale.admin.customerCenter.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scale.admin.customerCenter.model.service.AdminCustomerCenterService;


/**
 * Servlet implementation class AdminDeleteNotice
 */
@WebServlet("/deleteNotice.ad")
public class AdminDeleteNotice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDeleteNotice() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		
		int result = new AdminCustomerCenterService().deleteNotice(noticeNo);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "공지사항이 삭제되었습니다.");
			response.sendRedirect(request.getContextPath() + "/noticeList.ad?cpage=1");
		}else {
			request.getSession().setAttribute("alertMsg", "공지사항 삭제 실패");
			response.sendRedirect(request.getContextPath() + "/detailNotice.ad?noticeNo=" + noticeNo);
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

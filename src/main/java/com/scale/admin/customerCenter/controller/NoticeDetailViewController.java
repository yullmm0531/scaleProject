package com.scale.admin.customerCenter.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scale.customerCenter.model.service.CustomerCenterService;
import com.scale.customerCenter.model.vo.Notice;

/**
 * Servlet implementation class NoticeDetailViewController
 */
@WebServlet("/detail.no")
public class NoticeDetailViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDetailViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo")); 
		
		int result = new CustomerCenterService().increaseNoticeCount(noticeNo);
		
		if(result > 0) {
			Notice n = new CustomerCenterService().selectNoticeDetail(noticeNo);
			request.setAttribute("n", n);
			request.getRequestDispatcher("views/customerCenter/noticeDetailView.jsp").forward(request, response);
		}else {
			request.getSession().setAttribute("alertMsg", "유효하지 않은 공지사항입니다.");
			response.sendRedirect(request.getContextPath() + "/list.no?cpage=1");
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

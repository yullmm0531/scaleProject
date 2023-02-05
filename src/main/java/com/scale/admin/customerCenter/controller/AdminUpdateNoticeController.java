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
 * Servlet implementation class AdminUpdateNoticeController
 */
@WebServlet("/updateNotice.ad")
public class AdminUpdateNoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUpdateNoticeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		String noticeTitle = request.getParameter("title");
		String noticeContent = request.getParameter("noticeDoc");
		String display = request.getParameter("display");
		
		Notice n = new Notice(noticeNo, noticeTitle, noticeContent, display);
		
		
		int result = new CustomerCenterService().updateNotice(n);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "공지사항이 수정되었습니다.");
			response.sendRedirect(request.getContextPath() + "/noticeList.ad?cpage=1");
		}else {
			request.getSession().setAttribute("alertMsg", "공지사항 수정 실패");
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

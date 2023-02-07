package com.scale.admin.customerCenter.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scale.admin.customerCenter.model.service.AdminCustomerCenterService;
import com.scale.admin.user.model.vo.AdminUser;
import com.scale.customerCenter.model.vo.Inquire;

/**
 * Servlet implementation class AdminInquireAnswerController
 */
@WebServlet("/upadteAnswer.ad")
public class AdminInquireAnswerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminInquireAnswerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int inquireNo = Integer.parseInt(request.getParameter("inquireNo"));
		String answerContent = request.getParameter("answer");
		
		AdminUser adminUser = (AdminUser)request.getSession().getAttribute("adminUser");
		String answerUser = String.valueOf(adminUser.getUserNo());
		
		Inquire iq = new Inquire(inquireNo, answerContent, answerUser);
		
		int result = new AdminCustomerCenterService().updateAnswer(iq);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "답변이 등록되었습니다.");
		}else {
			request.getSession().setAttribute("alertMsg", "답변 등록 실패");
		}

		response.sendRedirect(request.getContextPath() + "/inquireList.ad?cpage=1");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package com.scale.admin.customerCenter.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.scale.admin.user.model.vo.AdminUser;
import com.scale.customerCenter.model.service.CustomerCenterService;
import com.scale.customerCenter.model.vo.Faq;

/**
 * Servlet implementation class AdminFaqUpdateController
 */
@WebServlet("/updateFaq.ad")
public class AdminFaqUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminFaqUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int faqNo = Integer.parseInt(request.getParameter("faqNo"));
		String question = request.getParameter("question");
		String answer = request.getParameter("answer");
		String category = request.getParameter("category");
		
		AdminUser adminUser = (AdminUser)request.getSession().getAttribute("adminUser");
		String faqWriter = String.valueOf(adminUser.getUserNo());
		
		Faq f = new Faq(faqNo, question, answer, category, faqWriter);
		
		int result = new CustomerCenterService().updateFaq(f);
		
		HttpSession session = request.getSession();
		if(result > 0) {
			session.setAttribute("alertMsg", "수정되었습니다.");
		}else {
			session.setAttribute("alertMsg", "자주묻는질문 수정 실패");
		}
		response.sendRedirect(request.getContextPath() + "/faqList.ad?cpage=1");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

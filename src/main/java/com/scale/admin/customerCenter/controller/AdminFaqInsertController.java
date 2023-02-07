package com.scale.admin.customerCenter.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.scale.admin.customerCenter.model.service.AdminCustomerCenterService;
import com.scale.admin.user.model.vo.AdminUser;
import com.scale.customerCenter.model.vo.Faq;

/**
 * Servlet implementation class AdminFaqInsertController
 */
@WebServlet("/insertFaq.ad")
public class AdminFaqInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminFaqInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String category = request.getParameter("category");
		String question = request.getParameter("question");
		String answer = request.getParameter("answer");
		
		AdminUser adminUser = (AdminUser)request.getSession().getAttribute("adminUser");
		String faqWriter = String.valueOf(adminUser.getUserNo());

		Faq f = new Faq(question, answer, category, faqWriter);
		
		int result = new AdminCustomerCenterService().insertFaq(f);
		
		HttpSession session = request.getSession();
		if(result > 0) {
			session.setAttribute("alertMsg", "자주묻는질문이 등록되었습니다.");
		}else {
			session.setAttribute("alertMst", "자주묻는질문 등록 실패");
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

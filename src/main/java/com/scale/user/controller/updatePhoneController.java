package com.scale.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.scale.user.model.service.UserService;

/**
 * Servlet implementation class updatePhoneController
 */
@WebServlet("/updatePhone.us")
public class updatePhoneController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updatePhoneController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		String phone = request.getParameter("phone");
		
		int result = new UserService().updatePhone(userId, phone);
		
		HttpSession session = request.getSession();
		if(result>0) {
			session.setAttribute("alertMsg", "연락처를 변경하였습니다");
			request.getRequestDispatcher("views/user/myPage.jsp").forward(request, response);
		}else {
			session.setAttribute("alertMsg", "연락처 변경에 실패하였습니다");
			response.sendRedirect(request.getContextPath() + "userInfoUpdate.us");
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

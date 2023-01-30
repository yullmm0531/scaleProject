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
 * Servlet implementation class deleteUserController
 */
@WebServlet("/deleteUser.us")
public class deleteUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteUserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		int result = new UserService().deleteUser(userId, userPwd);
		
		HttpSession session = request.getSession();
		if(result>0) {
			session.setAttribute("alertMsg", "성공적으로 탈퇴되었습니다");
			session.removeAttribute("loginUser");
			response.sendRedirect(request.getContextPath());
		}else {
			session.setAttribute("alertMsg", "비밀번호를 확인해주십시오");
			response.sendRedirect(request.getContextPath() + "myPage.us");
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

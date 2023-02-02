package com.scale.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.scale.user.model.service.UserService;
import com.scale.user.model.vo.User;

/**
 * Servlet implementation class updateEmailController
 */
@WebServlet("/updateEmail.us")
public class UpdateEmailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateEmailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		String email = request.getParameter("email");
		
		User updateUser = new UserService().updateEmail(userId, email);
		
		HttpSession session = request.getSession();
		
		if(updateUser == null) {
			session.setAttribute("alertMsg", "이메일 변경에 실패하였습니다");
			request.getRequestDispatcher("views/user/userInfoUpdateForm.jsp").forward(request, response);
		}else {
			session.setAttribute("alertMsg", "이메일을 성공적으로 변경하였습니다.");
			session.setAttribute("loginUser", updateUser);
			request.getRequestDispatcher("views/user/userInfoUpdateForm.jsp").forward(request, response);
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

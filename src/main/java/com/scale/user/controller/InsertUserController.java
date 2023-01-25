package com.scale.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scale.user.model.service.UserService;
import com.scale.user.model.vo.Address;
import com.scale.user.model.vo.User;

/**
 * Servlet implementation class InsertUserController
 */
@WebServlet("/insert.us")
public class InsertUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertUserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String userNickName = request.getParameter("userNickName");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");

		User u = new User(userId, userPwd, userName, userNickName, phone, email);

		String zipCode = request.getParameter("zipCode"); 
		String address1 = request.getParameter("address");
		String address2 = request.getParameter("detailAddress");
		
		Address add = new Address(zipCode, address1, address2);
		
		int result = new UserService().insertUser(u, add);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "회원가입이 완료되었습니다. 로그인 후 이용해주세요.");
			response.sendRedirect(request.getContextPath() + "/loginForm.us");
		}else {
			request.getSession().setAttribute("alertMsg", "회원가입 실패");
			response.sendRedirect(request.getContextPath() + "/insert.us");
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

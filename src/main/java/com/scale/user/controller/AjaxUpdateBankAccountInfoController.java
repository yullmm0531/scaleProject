package com.scale.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.scale.user.model.service.UserService;
import com.scale.user.model.vo.User;

/**
 * Servlet implementation class AjaxUpdateBankAccountInfoController
 */
@WebServlet("/updateAcc.us")
public class AjaxUpdateBankAccountInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxUpdateBankAccountInfoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String accBank = request.getParameter("accBank");
		String accNum = request.getParameter("accNum");
		
		User u = new User();
		u.setUserNo(userNo);
		u.setUserAccBank(accBank);
		u.setUserAccNum(accNum);
		
		int result = new UserService().updateUserAcc(u);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(result, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

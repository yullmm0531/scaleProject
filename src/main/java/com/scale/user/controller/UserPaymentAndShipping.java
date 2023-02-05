package com.scale.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.scale.user.model.service.UserService;
import com.scale.user.model.vo.Address;

/**
 * Servlet implementation class UserPaymentAndShipping
 */
@WebServlet("/userPaymentAndShipping.us")
public class UserPaymentAndShipping extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserPaymentAndShipping() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		String zipCode = request.getParameter("zipCode");
		String defaultAdd = request.getParameter("defaultAdd");
		String address1 = request.getParameter("address");
		String address2 = request.getParameter("detailAddress");
		String recipient = request.getParameter("recipient");
		String Phone = request.getParameter("Phone");
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		Address ad = new Address(zipCode, address1, address2, recipient, Phone, defaultAdd, userNo);
		
		int result = new UserService().updatePaymentAndShipping(ad);
		
		HttpSession session = request.getSession();
		
		if(result > 0) { 
			
			session.setAttribute("alertMsg", "배송지를 추가하였습니다");
			
			request.getRequestDispatcher("views/user/userPaymentAndShipping.jsp").forward(request, response);
			
		}else {
			session.setAttribute("alertMsg", "배송지 추가에 실패하였습니다.");
			request.getRequestDispatcher("views/user/userPaymentAndShipping.jsp").forward(request, response);
			
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

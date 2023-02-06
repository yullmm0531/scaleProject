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
 * Servlet implementation class UpdateBasicAddressController
 */
@WebServlet("/updateBasicAddress.us")
public class UpdateBasicAddressController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBasicAddressController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		int addressNo = Integer.parseInt(request.getParameter("addressNo"));
		
		int result = new UserService().updateBasicAddress(userNo, addressNo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "기본 배송지를 변경하였습니다.");
			
			request.getRequestDispatcher("views/user/userPaymentAndShipping.jsp").forward(request, response);
		
		}else {
			session.setAttribute("alertMsg", "배송지 변경에 실패하였습니다");
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

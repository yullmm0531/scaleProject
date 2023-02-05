package com.scale.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.scale.bidding.model.vo.Bidding;
import com.scale.product.model.vo.Product;
import com.scale.user.model.service.UserService;

/**
 * Servlet implementation class UserDetailBuyListController
 */
@WebServlet("/userDetailBuyList.us")
public class UserDetailBuyListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserDetailBuyListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String paymentNo = request.getParameter("paymentNo");
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		int biddingNo = Integer.parseInt(request.getParameter("biddingNo"));
		
		Product p1 = new UserService().userDetailImg(userNo);
		Bidding b1 = new UserService().selectDetailBuyList(paymentNo,userNo,biddingNo);
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginUser") == null) { 
			session.setAttribute("alertMsg", "로그인 후 이용가능한 서비스입니다.");
			response.sendRedirect(request.getContextPath());
		}else {
			
			request.setAttribute("userDetailImg", p1);
			request.setAttribute("userDetailBuyList", b1);
			
			request.getRequestDispatcher("views/user/userDetailBuyList.jsp").forward(request, response);
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

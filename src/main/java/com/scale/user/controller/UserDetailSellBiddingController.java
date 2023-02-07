package com.scale.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.scale.bidding.model.vo.Bidding;
import com.scale.bidding.model.vo.Seller;
import com.scale.product.model.vo.Product;
import com.scale.user.model.service.UserService;

/**
 * Servlet implementation class UserDetailSellBiddingController
 */
@WebServlet("/userDetailSellBidding.us")
public class UserDetailSellBiddingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserDetailSellBiddingController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		int productCode2 = Integer.parseInt(request.getParameter("productCode2"));
		String productSize = request.getParameter("productSize");
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		Seller s = new UserService().userDetailSellBidding1(productCode2, productSize);
		Product p = new UserService().userDetailSellBidding2(productCode2);
		Bidding b = new UserService().userDetailSellBidding3(productCode2, productSize,userNo);
		
		request.setAttribute("s", s);
		request.setAttribute("p", p);
		request.setAttribute("b", b);
		System.out.println(s);
		System.out.println(b);
		request.getRequestDispatcher("views/user/userDetailSellBidding.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

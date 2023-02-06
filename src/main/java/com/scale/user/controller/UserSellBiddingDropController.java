package com.scale.user.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.scale.product.model.vo.Product;
import com.scale.user.model.service.UserService;

/**
 * Servlet implementation class UserSellBiddingDropController
 */
@WebServlet("/userSellBiddingDrop.us")
public class UserSellBiddingDropController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserSellBiddingDropController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		int biddingNo = Integer.parseInt(request.getParameter("biddingNo"));
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		int result = new UserService().userSellBiddingDrop(biddingNo);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "판매입찰을 취소하였습니다.");			
			
			ArrayList<Product> list = new UserService().userSellList(userNo);
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/user/userSellBidding.jsp").forward(request, response);
		}else {
			session.setAttribute("alertMsg", "판매입찰을 취소에 실패하였습니다.");
			response.sendRedirect(request.getContextPath() + "/userSellBidding.us");
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

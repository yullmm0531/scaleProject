package com.scale.bidding.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.scale.bidding.model.service.BiddingService;
import com.scale.bidding.model.vo.Bidding;
import com.scale.product.model.service.ProductService;
import com.scale.product.model.vo.Product;
import com.scale.user.model.service.UserService;
import com.scale.user.model.vo.Address;
import com.scale.user.model.vo.User;

/**
 * Servlet implementation class BuyBiddingDetailFormController
 */
@WebServlet("/buyDetail.bi")
public class BuyBiddingDetailFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyBiddingDetailFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pCode = request.getParameter("co");	
		String size = request.getParameter("size");
		String bType = request.getParameter("options");
		int price = 0;
		Product p = new ProductService().selectProduct(pCode);
		request.setAttribute("p", p);
		request.setAttribute("size", size);
		request.setAttribute("bType", bType);
		System.out.println(bType);
		if(bType.equals("buyI")) {
			price = Integer.parseInt(request.getParameter("priceI").replaceAll(",", ""));
			Bidding b = new BiddingService().selectSellBidding(pCode, size, price);
			request.setAttribute("b", b);
			
		} else {
			price = Integer.parseInt(request.getParameter("priceB").replaceAll(",", ""));
			request.setAttribute("price", price);
		}
		
		HttpSession session = request.getSession();
		int userNo = ((User)session.getAttribute("loginUser")).getUserNo();
		
		Address ad = new UserService().selectDefaultAddress(userNo);
		request.setAttribute("ad", ad);
		
		request.getRequestDispatcher("views/buy/buyPaymentView.jsp").forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

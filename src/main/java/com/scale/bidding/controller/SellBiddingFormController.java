package com.scale.bidding.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scale.bidding.model.service.BiddingService;
import com.scale.bidding.model.vo.Bidding;
import com.scale.product.model.service.ProductService;
import com.scale.product.model.vo.Product;

/**
 * Servlet implementation class SellBiddingFormController
 */
@WebServlet("/sell.bi")
public class SellBiddingFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellBiddingFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pCode = request.getParameter("co");
		Product p = new ProductService().selectProduct(pCode);
		ArrayList<Bidding> pList = new BiddingService().selectBuyBiddingPriceList(pCode);
		
		request.setAttribute("p", p);
		request.setAttribute("pList", pList);
		
		request.getRequestDispatcher("views/sell/sellBiddingView.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

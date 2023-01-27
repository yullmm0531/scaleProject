package com.scale.bidding.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.scale.bidding.model.service.BiddingService;
import com.scale.bidding.model.vo.Bidding;

/**
 * Servlet implementation class BiddingListController
 */
@WebServlet("/bSizeList.bi")
public class AjaxBiddingSizeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxBiddingSizeListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pCode = request.getParameter("co");
		String size = request.getParameter("size");
		
		ArrayList<Bidding> dSizeList = new BiddingService().selectDealSizeList(pCode, size);
		ArrayList<Bidding> sSizeList = new BiddingService().selectSellBiddingSizeList(pCode, size);
		ArrayList<Bidding> bSizeList = new BiddingService().selectBuyBiddingSizeList(pCode, size);
		
		ArrayList<ArrayList<Bidding>> list = new ArrayList<>();
		list.add(dSizeList);
		list.add(sSizeList);
		list.add(bSizeList);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(list, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

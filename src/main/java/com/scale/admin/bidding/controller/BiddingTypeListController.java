package com.scale.admin.bidding.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.scale.admin.bidding.model.service.BiddingService;
import com.scale.admin.bidding.model.vo.Bidding;
import com.scale.common.model.vo.PageInfo;

/**
 * Servlet implementation class BiddingTypeListController
 */
@WebServlet("/biddingTypeList.ad")
public class BiddingTypeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BiddingTypeListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String biddingType = request.getParameter("biddingType");
		
		// 페이징
		int biddingTypeCount = new BiddingService().selectBiddingTypeCount(biddingType);
		int currentPage = Integer.parseInt(request.getParameter("cpage"));
		int pageLimit = 5;
		int boardLimit = 10;
		
		int maxPage = (int)Math.ceil((double)biddingTypeCount / boardLimit);
		int startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		int endPage  = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(biddingTypeCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);


		// 입찰목록 조회
		ArrayList<Bidding> biddingTypeList = new BiddingService().selectBiddingTypeList(biddingType, pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("biddingTypeList", biddingTypeList);
		request.setAttribute("biddingType", biddingType);
		
		request.getRequestDispatcher("views/admin/deal/manageBiddingTypeListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

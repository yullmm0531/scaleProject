package com.scale.customerCenter.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.scale.common.model.vo.PageInfo;
import com.scale.customerCenter.model.service.CustomerCenterService;
import com.scale.customerCenter.model.vo.Faq;

/**
 * Servlet implementation class AjaxFaqSearchController
 */
@WebServlet("/search.faq")
public class AjaxFaqSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxFaqSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyword = request.getParameter("keyword");
		int currentPage = Integer.parseInt(request.getParameter("cpage"));
		
		// 카테고리별 개수 조회
		int searchCount = new CustomerCenterService().selectFaqSearchCount(keyword);
		

		// 페이징
		int boardLimit = 10;
		
		PageInfo pi = new PageInfo();
		pi.setCurrentPage(currentPage);
		pi.setBoardLimit(boardLimit);
		pi.setListCount(searchCount);

		// 게시글 조회
		ArrayList<Faq> searchList = new CustomerCenterService().selectFaqSearchList(keyword, pi);
		
		
		
		response.setContentType("application/json; charset=UTF-8");
		HashMap<String, Object> map = new HashMap();
		map.put("pi", pi);
		map.put("searchList", searchList);
		
		new Gson().toJson(map, response.getWriter());	
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

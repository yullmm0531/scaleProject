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
 * Servlet implementation class AjaxFaqListController
 */
@WebServlet("/list.faq")
public class AjaxFaqListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxFaqListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("category");
		int currentPage = Integer.parseInt(request.getParameter("cpage"));

		// 카테고리별 개수 조회
		int listCount = 0;
		if(category.equals("all")) {
			listCount = new CustomerCenterService().selectFaqListCountAll();
		}else {
			listCount = new CustomerCenterService().selectFaqListCount(category);
		}

		// 페이징
		int boardLimit = 10;
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		PageInfo pi = new PageInfo();
		pi.setCurrentPage(currentPage);
		pi.setBoardLimit(boardLimit);
		pi.setListCount(listCount);
		pi.setMaxPage(maxPage);

		// 게시글 조회
		ArrayList<Faq> list = new ArrayList<>();
		if(category.equals("all")) {
			list = new CustomerCenterService().selectFaqListAll(pi);
		}else {
			list = new CustomerCenterService().selectFaqList(category, pi);
		}
		
		
		response.setContentType("application/json; charset=UTF-8");
		HashMap<String, Object> map = new HashMap();
		map.put("pi", pi);
		map.put("list", list);
		
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

package com.scale.admin.customerCenter.controller;

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
import com.scale.customerCenter.model.vo.Inquire;

/**
 * Servlet implementation class AjaxAdminInquireFilterController
 */
@WebServlet("/inquireFilter.ad")
public class AjaxAdminInquireFilterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxAdminInquireFilterController() {
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
			response.sendRedirect(request.getContextPath() + "/inquireList.ad?cpage=1");
		}else {
			listCount = new CustomerCenterService().selectAdminInquireCountCategory(category);
			// 페이징
			int pageLimit = 5;
			int boardLimit = 10;
			int maxPage = (int)Math.ceil((double)listCount / boardLimit);
			int startPage = (currentPage-1) / pageLimit * pageLimit + 1;
			int endPage  = startPage + pageLimit - 1;
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			
			PageInfo pi = new PageInfo();
			pi.setCurrentPage(currentPage);
			pi.setListCount(listCount);
			pi.setPageLimit(pageLimit);
			pi.setBoardLimit(boardLimit);
			pi.setMaxPage(maxPage);
			pi.setStartPage(startPage);
			pi.setEndPage(endPage);

			// 게시글 조회
			ArrayList<Inquire> list = new ArrayList<>();
			list = new CustomerCenterService().selectAdminInquireListCategory(category, pi);
			
			response.setContentType("application/json; charset=UTF-8");
			HashMap<String, Object> map = new HashMap();
			map.put("pi", pi);
			map.put("list", list);
			
			new Gson().toJson(map, response.getWriter());
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

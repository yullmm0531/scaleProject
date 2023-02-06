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
import com.scale.admin.customerCenter.model.service.AdminCustomerCenterService;
import com.scale.common.model.vo.PageInfo;
import com.scale.customerCenter.model.vo.Inquire;

/**
 * Servlet implementation class AjaxAdminInquireAnswerFilterController
 */
@WebServlet("/inqAnswerFilter.ad")
public class AjaxAdminInquireAnswerFilterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxAdminInquireAnswerFilterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage = Integer.parseInt(request.getParameter("cpage"));

		int listCount  = new AdminCustomerCenterService().selectAdminNoAnswerCount();
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
			list = new AdminCustomerCenterService().selectAdminNoAnswerList(pi);
			
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

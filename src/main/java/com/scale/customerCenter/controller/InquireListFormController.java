package com.scale.customerCenter.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.scale.common.model.vo.PageInfo;
import com.scale.customerCenter.model.service.CustomerCenterService;
import com.scale.customerCenter.model.vo.Inquire;
import com.scale.user.model.vo.User;

/**
 * Servlet implementation class InquireListFormController
 */
@WebServlet("/listForm.inq")
public class InquireListFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquireListFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		User loginUser = (User)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			session.setAttribute("alertMsg", "로그인 후 이용해주세요.");
			response.sendRedirect(request.getContextPath() + "/loginForm.us");
		}else {
			
			int userNo = loginUser.getUserNo();
			
			// 페이징바
			int listCount = new CustomerCenterService().selectInquireCount(userNo);
			int currentPage = Integer.parseInt(request.getParameter("cpage"));
			int pageLimit = 5;
			int boardLimit = 10;
			
			int maxPage = (int)Math.ceil((double)listCount / boardLimit);
			int startPage = (currentPage-1) / pageLimit * pageLimit + 1;
			int endPage  = startPage + pageLimit - 1;
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			
			PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
			
			// 페이지 조회
			ArrayList<Inquire> list = new CustomerCenterService().selectInquireList(userNo, pi);
			
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			
			request.getRequestDispatcher("views/customerCenter/inquireListView.jsp").forward(request, response);
		
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

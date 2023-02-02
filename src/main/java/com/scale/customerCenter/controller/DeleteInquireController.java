package com.scale.customerCenter.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scale.customerCenter.model.service.CustomerCenterService;

/**
 * Servlet implementation class DeleteInquireController
 */
@WebServlet("/delete.inq")
public class DeleteInquireController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteInquireController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int inquireNo = Integer.parseInt(request.getParameter("inquireNo"));
		int result = new CustomerCenterService().deleteInquire(inquireNo);
		
		request.getSession().setAttribute("alertMsg", "삭제되었습니다.");
		response.sendRedirect("list.inq?cpage=1");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

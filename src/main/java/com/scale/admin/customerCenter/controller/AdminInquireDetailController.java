package com.scale.admin.customerCenter.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scale.customerCenter.model.service.CustomerCenterService;
import com.scale.customerCenter.model.vo.Inquire;

/**
 * Servlet implementation class AdminInquireDetailController
 */
@WebServlet("/detailInquire.ad")
public class AdminInquireDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminInquireDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int inquireNo = Integer.parseInt(request.getParameter("inquireNo"));
		
		Inquire iq = new CustomerCenterService().selectAdminInquireDetail(inquireNo);
		
		request.setAttribute("iq", iq);
		request.getRequestDispatcher("views/admin/customerCenter/adminInquireDetailView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

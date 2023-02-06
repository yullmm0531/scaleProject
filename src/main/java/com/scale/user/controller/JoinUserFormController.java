package com.scale.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scale.policy.model.service.PolicyService;
import com.scale.policy.model.vo.Policy;

/**
 * Servlet implementation class JoinUserFormController
 */
@WebServlet("/join.us")
public class JoinUserFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinUserFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int terms = 2;
		Policy t = new PolicyService().selectPolicy(terms);
		int privacy = 3;
		Policy p = new PolicyService().selectPolicy(privacy);
		
		request.setAttribute("t", t);
		request.setAttribute("p", p);
		
		request.getRequestDispatcher("views/user/joinUserForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

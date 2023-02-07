package com.scale.admin.policy.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scale.policy.model.service.PolicyService;
import com.scale.policy.model.vo.Policy;

/**
 * Servlet implementation class AdminInspectionUpdateController
 */
@WebServlet("/updateTerms.ad")
public class AdminTermsOfPolicyUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminTermsOfPolicyUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String content = request.getParameter("content");
		int policyType = 2;
		int result = new PolicyService().updatePolicy(content, policyType);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "이용약관이 수정되었습니다.");
		}else {
			request.getSession().setAttribute("alertMsg", "이용약관 수정 실패");
		}
		
		response.sendRedirect(request.getContextPath() + "/terms.ad");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

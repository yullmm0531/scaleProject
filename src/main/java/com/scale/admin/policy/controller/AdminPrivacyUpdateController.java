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
@WebServlet("/updatePrivacy.ad")
public class AdminPrivacyUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPrivacyUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String content = request.getParameter("content");
		int policyType = 3;
		int result = new PolicyService().updatePolicy(content, policyType);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "개인정보처리방침이 수정되었습니다.");
		}else {
			request.getSession().setAttribute("alertMsg", "개인정보처리방침 수정 실패");
		}
		
		response.sendRedirect(request.getContextPath() + "/privacy.ad");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

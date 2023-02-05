package com.scale.style.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.scale.style.model.service.StyleService;
import com.scale.user.model.vo.User;

/**
 * Servlet implementation class DeleteStyleController
 */
@WebServlet("/delete.st")
public class DeleteStyleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteStyleController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] noArr = request.getParameterValues("no");
		int result = new StyleService().deleteStyleAdmin(noArr);
		HttpSession session = request.getSession();
		session.setAttribute("alertMsg", "스타일이 삭제되었습니다.");
		response.sendRedirect(request.getContextPath() + "/profileView.st?cpage=1&userNo=" + ((User)session.getAttribute("loginUser")).getUserNo());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

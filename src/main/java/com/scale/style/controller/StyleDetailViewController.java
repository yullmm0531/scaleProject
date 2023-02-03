package com.scale.style.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scale.style.model.service.StyleService;
import com.scale.user.model.vo.User;

/**
 * Servlet implementation class StyleDetailViewController
 */
@WebServlet("/detail.st")
public class StyleDetailViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StyleDetailViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cpage = Integer.parseInt(request.getParameter("cpage"));
		String no = request.getParameter("no");
		String view = request.getParameter("view");
		int boardLimit = 12;
		String tag = request.getParameter("tag") != null ? request.getParameter("tag") : "";
		String id = request.getParameter("userID") != null ? request.getParameter("userID") : "";
		User loginUser = (User)request.getSession().getAttribute("loginUser");
		int userNo = loginUser != null ? loginUser.getUserNo() : 0;
		
		HashMap<String, Object> map = new StyleService().selectDetail(cpage, view, boardLimit, tag, id, userNo);
		
		request.setAttribute("list", map.get("list"));
		request.setAttribute("ilist", map.get("ilist"));
		request.setAttribute("plist", map.get("plist"));
		request.setAttribute("checkLike", map.get("checkLike"));
		request.setAttribute("cpage", cpage);
		request.setAttribute("no", no);
		request.setAttribute("view", view);
		request.getRequestDispatcher("views/style/styleDetailView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

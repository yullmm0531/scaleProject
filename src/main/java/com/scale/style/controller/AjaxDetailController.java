package com.scale.style.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.scale.style.model.service.StyleService;
import com.scale.user.model.vo.User;

/**
 * Servlet implementation class AjaxDetailController
 */
@WebServlet("/detail.ajax")
public class AjaxDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = request.getParameter("view");
		int cpage = Integer.parseInt(request.getParameter("cpage"));
		int userNo = (User)request.getSession().getAttribute("loginUser") != null ? ((User)request.getSession().getAttribute("loginUser")).getUserNo() : 0;
		int boardLimit = 12;
		String tag = request.getParameter("tag") != null ? request.getParameter("tag") : "";
		String id = request.getParameter("id") != null ? request.getParameter("id") : "";
		
		HashMap<String, Object> map = new StyleService().selectAddDetail(view, cpage, userNo, boardLimit, tag, id);
		
		response.setContentType("application/json; charset=UTF-8");
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

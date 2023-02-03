package com.scale.style.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.scale.product.model.vo.Product;
import com.scale.style.model.service.StyleService;
import com.scale.style.model.vo.Style;
import com.scale.style.model.vo.StyleImg;
import com.scale.user.model.vo.User;

/**
 * Servlet implementation class StyleDetailViewController
 */
@WebServlet("/detailStyle.ajax")
public class AjaxStyleDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxStyleDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cpage = Integer.parseInt(request.getParameter("cpage"));
		String view = request.getParameter("view");
		int boardLimit = 12;
		String tag = request.getParameter("tag") != null ? request.getParameter("tag") : "";
		String userID = request.getParameter("userID") != null ? request.getParameter("userID") : "";
		User loginUser = (User)request.getSession().getAttribute("loginUser");
		int userNo = loginUser != null ? loginUser.getUserNo() : 0;
		
		HashMap<String, Object> map = new StyleService().selectAddDetail(cpage, view, boardLimit, tag, userID, userNo);
		
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

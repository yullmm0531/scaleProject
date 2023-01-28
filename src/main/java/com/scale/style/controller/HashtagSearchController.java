package com.scale.style.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scale.style.model.service.StyleService;
import com.scale.style.model.vo.Style;
import com.scale.style.model.vo.StyleImg;

/**
 * Servlet implementation class HashtagSearchController
 */
@WebServlet("/search.st")
public class HashtagSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HashtagSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String keyword = request.getParameter("keyword");
		
		ArrayList<Style> list = new StyleService().selectSearchList(keyword);
		ArrayList<StyleImg> ilist = new StyleService().selectStyleImgList();
		
		request.setAttribute("keyword", keyword);
		request.setAttribute("list", list);
		request.setAttribute("ilist", ilist);
		request.getRequestDispatcher("views/style/hashtagSearchView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package com.scale.style.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scale.style.model.service.StyleService;
import com.scale.style.model.vo.Hashtag;
import com.scale.style.model.vo.Style;
import com.scale.style.model.vo.StyleImg;

/**
 * Servlet implementation class StyleListController
 */
@WebServlet("/trendinglist.st")
public class StyleTrendingListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StyleTrendingListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int listCount;
		int currentPage;
		int boardLimit;
		int maxPage;
		
		listCount = new StyleService().selectListCount();
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		boardLimit = 12;
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		ArrayList<Style> list = new StyleService().selectStyleList(currentPage, boardLimit);
		ArrayList<StyleImg> ilist = new StyleService().selectStyleImgList();
		ArrayList<Hashtag> tag = new StyleService().selectTagList();
		
		request.setAttribute("list", list);
		request.setAttribute("ilist", ilist);
		request.setAttribute("tag", tag);
		request.getRequestDispatcher("views/style/styleTrendingListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

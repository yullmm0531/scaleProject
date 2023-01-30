package com.scale.style.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.scale.style.model.service.StyleService;
import com.scale.style.model.vo.Hashtag;
import com.scale.style.model.vo.Style;
import com.scale.style.model.vo.StyleImg;

/**
 * Servlet implementation class AjaxTrendingListController
 */
@WebServlet("/trendinglist.ajax")
public class AjaxTrendingListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxTrendingListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int listCount = new StyleService().selectListCount();
		int currentPage = Integer.parseInt(request.getParameter("cpage"));
		int boardLimit = 12;
		
		ArrayList<Style> list = new StyleService().selectStyleList(currentPage, boardLimit);
		ArrayList<StyleImg> ilist = new StyleService().selectStyleImgList();
		
		HashMap<String,ArrayList> map=new HashMap();
		map.put("list", list);
		map.put("ilist", ilist);
		
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

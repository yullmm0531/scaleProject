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
import com.scale.style.model.service.StyleService;
import com.scale.style.model.vo.Style;
import com.scale.style.model.vo.StyleImg;

/**
 * Servlet implementation class AjaxHashtagSearchListController
 */
@WebServlet("/searchStyle.ajax")
public class AjaxHashtagSearchListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxHashtagSearchListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyword = request.getParameter("keyword");
		int listCount = new StyleService().selectSearchListCount(keyword);
		int currentPage = Integer.parseInt(request.getParameter("cpage"));
		int boardLimit = 12;
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int userNo = 0;
		if(request.getParameter("userNo") != null) {
			userNo = Integer.parseInt(request.getParameter("userNo"));
		}
		
		ArrayList<Style> list = new StyleService().selectSearchList(currentPage, boardLimit, keyword);
		ArrayList<StyleImg> ilist = new StyleService().selectStyleImgList();
		int[] checkLike = new int[list.size()];
		for(int i=0; i<list.size(); i++) {
			int styleNo = list.get(i).getStyleNo();
			checkLike[i] = new StyleService().checkLike(userNo, styleNo);
		}
		
		HashMap<String,Object> map=new HashMap();
		map.put("list", list);
		map.put("ilist", ilist);
		map.put("maxPage", maxPage);
		map.put("checkLike", checkLike);
		
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

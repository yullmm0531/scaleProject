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
import com.scale.user.model.vo.User;

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
		String keyword = request.getParameter("keyword").charAt(0) == '#' ? request.getParameter("keyword").substring(1) : request.getParameter("keyword");
		int listCount = new StyleService().selectSearchListCount(keyword);
		int currentPage = Integer.parseInt(request.getParameter("cpage"));
		int boardLimit = 12;
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		ArrayList<Style> list = new StyleService().selectStyleByHashtag(currentPage, boardLimit, keyword);
		ArrayList<StyleImg> ilist = new ArrayList<>();
		for(Style st : list) {
			ArrayList<StyleImg> imgs = new StyleService().selectStyleImgByNo(st.getStyleNo());
			for(StyleImg si : imgs) {
				ilist.add(si);
			}
		}
		
		int userNo = 0;
		User loginUser = (User)request.getSession().getAttribute("loginUser");
		if(loginUser != null) {
			userNo = loginUser.getUserNo();
		}
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

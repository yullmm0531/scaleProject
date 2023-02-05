package com.scale.admin.style.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scale.common.model.vo.PageInfo;
import com.scale.style.model.service.StyleService;
import com.scale.style.model.vo.Style;
import com.scale.style.model.vo.StyleImg;

/**
 * Servlet implementation class SearchStyleListController
 */
@WebServlet("/searchStyle.ad")
public class SearchStyleListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchStyleListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String select = request.getParameter("select");
		String keyword = request.getParameter("keyword");
		String date1 = request.getParameter("date1");
		String date2 = request.getParameter("date2");
		if(date1 == "") {
			date1 = "1900-01-01";
		}
		if(date2 == "") {
			date2 = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		}
		
		int cpage = Integer.parseInt(request.getParameter("cpage"));
		int boardLimit = 12;
		int listCount = new StyleService().adminSearchListCount(select, keyword, date1, date2);
		int pageLimit = 10;
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = (cpage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, cpage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Style> list = new StyleService().adminSearchList(cpage, boardLimit, select, keyword, date1, date2);
		ArrayList<StyleImg> ilist = new ArrayList<>();
		for(Style st : list) {
			ArrayList<StyleImg> imgs = new StyleService().selectStyleImgByNo(st.getStyleNo());
			for(StyleImg si : imgs) {
				ilist.add(si);
			}
		}
		
		request.setAttribute("list", list);
		request.setAttribute("ilist", ilist);
		request.setAttribute("pi", pi);
		request.setAttribute("select", select);
		request.setAttribute("keyword", keyword);
		request.setAttribute("date1", date1);
		request.setAttribute("date2", date2);
		request.getRequestDispatcher("views/admin/style/manageListView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

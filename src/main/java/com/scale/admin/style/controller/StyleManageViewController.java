package com.scale.admin.style.controller;

import java.io.IOException;
import java.util.ArrayList;

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
 * Servlet implementation class StyleListManageViewController
 */
@WebServlet("/stylelist.ad")
public class StyleManageViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StyleManageViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cpage = Integer.parseInt(request.getParameter("cpage"));
		int boardLimit = 12;
		int listCount = new StyleService().selectListCount();
		int pageLimit = 10;
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = (cpage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, cpage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Style> list = new StyleService().selectNewStyleList(cpage, boardLimit);
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

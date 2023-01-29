package com.scale.style.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.scale.style.model.service.StyleService;
import com.scale.style.model.vo.Style;

/**
 * Servlet implementation class StyleProfileViewController
 */
@WebServlet("/profile.st")
public class StyleProfileViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StyleProfileViewController() {
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
		
		HttpSession session = request.getSession();
		int no = 0;
		if(session.getAttribute("no") != null) {
			no = (int)session.getAttribute("no");
			session.removeAttribute("no");
		}
		String nickname = request.getParameter("nickname");
		
		ArrayList<Style> list = new ArrayList<Style>();
		if(no == 0 && nickname == null) {
			session.setAttribute("alertMsg", "유저 정보가 없습니다.");
			response.sendRedirect(request.getContextPath() + "/trendinglist.st?cpage=1");
			return;
		} else {
			if(no == 0) {
				list = new StyleService().selectStyleByNickname(currentPage, boardLimit, nickname);
			} else {
				list = new StyleService().selectStyleByNo(currentPage, boardLimit, no);
			}
		}
		
		ArrayList ilist = new StyleService().selectStyleImgList();
		
		request.setAttribute("list", list);
		request.setAttribute("ilist", ilist);
		request.getRequestDispatcher("views/style/styleProfileView.jsp").forward(request, response);	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

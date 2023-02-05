package com.scale.admin.style.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scale.style.model.service.StyleService;

/**
 * Servlet implementation class StyleDeleteManageController
 */
@WebServlet("/deleteStyle.ad")
public class StyleDeleteManageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StyleDeleteManageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cpage = Integer.parseInt(request.getParameter("cpage"));
		String[] noArr = request.getParameterValues("styleNo");
		int result = new StyleService().deleteStyleAdmin(noArr);
		
		if(result == noArr.length) {
			request.getSession().setAttribute("alertMsg", "성공적으로 스타일이 삭제되었습니다.");
		} else {
			request.getSession().setAttribute("alertMsg", "스타일 삭제 실패.");
		}
		
		response.sendRedirect(request.getContextPath() + "/stylelist.ad?cpage=" + cpage);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

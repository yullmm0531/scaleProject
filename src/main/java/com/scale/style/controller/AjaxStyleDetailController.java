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
@WebServlet("/detail.ajax")
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
		String nickname = request.getParameter("nickname") != null ? request.getParameter("nickname") : "";
		
		ArrayList<Style> list = new StyleService().selectDetailList(cpage, view, boardLimit, tag, nickname);
		
		ArrayList<StyleImg> ilist = new ArrayList<>();
		ArrayList<Product> plist = new ArrayList<>();
		for(Style st : list) {
			ArrayList<StyleImg> imgs = new StyleService().selectStyleImgByNo(st.getStyleNo());
			for(StyleImg si : imgs) {
				ilist.add(si);
			}
			ArrayList<Product> pds = new StyleService().selectDetailProduct(st.getStyleNo());
			for(Product pd : pds) {
				plist.add(pd);
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
		
		HashMap<String, Object> map=new HashMap();
		map.put("list", list);
		map.put("ilist", ilist);
		map.put("plist", plist);
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

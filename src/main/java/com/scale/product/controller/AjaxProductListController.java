package com.scale.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.scale.product.model.service.ProductService;
import com.scale.product.model.vo.Like;
import com.scale.product.model.vo.Product;
import com.scale.user.model.vo.User;

/**
 * Servlet implementation class AjaxProductList
 */
@WebServlet("/productList.pd")
public class AjaxProductListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxProductListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int currentPage = Integer.parseInt(request.getParameter("cpage"));
		int boardLimit = 12;
		int userNo = 0;
		
		ArrayList<Product> list = new ProductService().selectProductListPage(currentPage, boardLimit);
		
		
		User loginUser = (User)request.getSession().getAttribute("loginUser");
		if(loginUser != null) {
			userNo = loginUser.getUserNo();
		}
		
		ArrayList<Like> clickLike = new ProductService().clickLike();
		ArrayList<Like> userLike = new ProductService().selectUserAllLike(userNo);
		HashMap<String, Object> pmap = new HashMap();
		pmap.put("list", list);
		pmap.put("clickLike", clickLike);
		pmap.put("userLike", userLike);
		
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(pmap, response.getWriter());
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

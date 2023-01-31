package com.scale.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.scale.product.model.service.ProductService;
import com.scale.product.model.vo.Product;
import com.scale.style.model.service.StyleService;
import com.scale.style.model.vo.Style;

/**
 * Servlet implementation class AjaxProductList
 */
@WebServlet("/productList.pd")
public class AjaxProductList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxProductList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		int listCount = new ProductService().selectListCount();
		int currentPage = Integer.parseInt(request.getParameter("cpage"));
		int boardLimit = 12;
		int userNo = 0;
		
		if(request.getParameter("userNo") != null) {
			userNo = Integer.parseInt(request.getParameter("userNo"));
		}
		
		ArrayList<Product> list = new ProductService().selectProductListPage(currentPage, boardLimit);
		int[] clickLike = new int[list.size()];
		for(int i=0; i<list.size(); i++) {
			int productCode = list.get(i).getproductCode();
		}
		
		PdList<String, Object> pl = new PdList();
		pl.put("list", list);
		
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(pl, response.getWriter());
		
		*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

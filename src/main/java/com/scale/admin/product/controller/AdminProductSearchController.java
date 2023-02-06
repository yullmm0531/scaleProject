package com.scale.admin.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scale.admin.product.model.service.ProductService;
import com.scale.admin.product.model.vo.Product;
import com.scale.common.model.vo.PageInfo;

/**
 * Servlet implementation class AdminProductSearchController
 */
@WebServlet("/Adpsearch.apd")
public class AdminProductSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminProductSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
			
		String keyword = request.getParameter("keyword");
		
		// 페이징
		int listCount = new ProductService().searchProductCount();
		int currentPage = Integer.parseInt(request.getParameter("cpage"));
		int pageLimit = 5;
		int boardLimit = 10;
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = (currentPage-1)/ pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit -1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
			
		ArrayList<Product> list = new ProductService().selectProductSearchList(pi, keyword);
		
		request.setAttribute("pi", pi);
		request.setAttribute("keyword", keyword);
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/admin/product/adminProductList").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

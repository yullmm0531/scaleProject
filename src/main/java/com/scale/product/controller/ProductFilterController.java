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

/**
 * Servlet implementation class ProductFilterController
 */
@WebServlet("/filter.pd")
public class ProductFilterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductFilterController() {
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
		
		String filter = request.getParameter("filter");
		
		ArrayList<Product> list = new ProductService().selectProductFilter(filter);
		ArrayList<Like> likeList = new ProductService().clickLike();
		
		int[] clickLike = new int[list.size()];
		for(int i=0; i<list.size(); i++) {
			String productCode = list.get(i).getProductCode();
			clickLike[i] = likeList.get(i).getCountLike();
		}
		
		
//		request.setAttribute("filter", filter);
//		request.setAttribute("list", list);
//		request.getRequestDispatcher("views/product/productMainView.jsp").forward(request, response);
		
		HashMap<String, Object> pmap = new HashMap();
		pmap.put("list", list);
		pmap.put("filter", filter);
		pmap.put("clickLike", clickLike);
		
		System.out.println(list);
		
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

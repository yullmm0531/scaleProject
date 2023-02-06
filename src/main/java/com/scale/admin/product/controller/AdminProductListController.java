package com.scale.admin.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scale.admin.product.model.service.ProductService;
import com.scale.admin.product.model.vo.Brand;
import com.scale.admin.product.model.vo.Product;

/**
 * Servlet implementation class AdminProductListController
 */
@WebServlet("/adplist.apd")
public class AdminProductListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminProductListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Product> list = new ProductService().selectAdProductList();
		request.setAttribute("list", list);
		
		ArrayList<Brand> blist = new ProductService().selectAdBrandList();
		request.setAttribute("blist", blist);
		
		// 응답페이지
		request.getRequestDispatcher("views/admin/product/productMainView.jsp").forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package com.scale.style.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scale.product.model.service.ProductService;
import com.scale.product.model.vo.Product;
import com.scale.style.model.service.StyleService;

/**
 * Servlet implementation class StyleChangeEnrollFormController
 */
@WebServlet("/changeView.st")
public class StyleChangeEnrollFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StyleChangeEnrollFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int styleNo = Integer.parseInt(request.getParameter("styleNo"));
		ArrayList<Product> listAll = new ProductService().selectProductList();
		HashMap<String, Object> map = new StyleService().selectStyleDetail(styleNo);
		
		request.setAttribute("listAll", listAll);
		request.setAttribute("st", map.get("st"));
		request.setAttribute("ilist", map.get("ilist"));
		request.setAttribute("plist", map.get("plist"));
		request.getRequestDispatcher("views/style/styleChangeForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

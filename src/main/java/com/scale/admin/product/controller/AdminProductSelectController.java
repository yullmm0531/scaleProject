package com.scale.admin.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scale.admin.product.model.service.ProductService;
import com.scale.admin.product.model.vo.Product;
import com.scale.admin.product.model.vo.ProductImg;

/**
 * Servlet implementation class AdminProductSelect
 */
@WebServlet("/AdPSelect.apd")
public class AdminProductSelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminProductSelectController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int productCode = Integer.parseInt(request.getParameter("code")); 
		
		ProductService pService = new ProductService();
		
		int result = pService.increaseCount(productCode);
		
		if(result>0) {
			Product p = pService.selectProductDetail(productCode);
			ProductImg at = pService.selectAdProductImg(productCode);
			
			request.setAttribute("p", p);
			request.setAttribute("at", at);
			
			request.getRequestDispatcher("views/admin/product/AdminProductSelect.jsp").forward(request, response);
		
		}else {
			request.setAttribute("errorMsg", "상세조회 실패");
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

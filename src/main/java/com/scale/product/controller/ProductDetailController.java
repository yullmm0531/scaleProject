package com.scale.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.scale.bidding.model.service.BiddingService;
import com.scale.bidding.model.vo.Bidding;
import com.scale.product.model.service.ProductService;
import com.scale.product.model.vo.Product;
import com.scale.product.model.vo.ProductImg;

/**
 * Servlet implementation class ProductDetailController
 */
@WebServlet("/detail.pd")
public class ProductDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pCode = request.getParameter("co");
		
		Product p = new ProductService().selectProduct(pCode);
		ArrayList<Bidding> dList = new BiddingService().selectDealList(pCode);
		ArrayList<ProductImg> pImgList = new ProductService().selectProductImg(pCode);
		ArrayList<Bidding> bList = new BiddingService().selectBuyBiddingList(pCode);
		ArrayList<Bidding> sList = new BiddingService().selectSellBiddingList(pCode);
		
		HttpSession session = request.getSession();
		if(p == null) {
			session.setAttribute("alertMsg", "상품 상세조회에 실패했습니다.");
		} else {
			request.setAttribute("p", p);
			request.setAttribute("dList", dList);
			request.setAttribute("pImgList", pImgList);
			request.setAttribute("bList", bList);
			request.setAttribute("sList", sList);
			request.getRequestDispatcher("views/product/productDetailView.jsp").forward(request, response);
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

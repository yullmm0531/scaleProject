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
import com.scale.style.model.vo.Style;
import com.scale.style.model.vo.StyleImg;
import com.scale.user.model.vo.User;

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
		
		HttpSession session = request.getSession();
		int userNo = 0;
		User loginUser = (User)session.getAttribute("loginUser");
		if(loginUser != null) {
			userNo = loginUser.getUserNo();
		}
		
		String pCode = request.getParameter("co");
		
		Product p = new ProductService().selectProduct(pCode);
		ArrayList<Bidding> dList = new BiddingService().selectDealList(pCode);
		ArrayList<ProductImg> pImgList = new ProductService().selectProductImg(pCode);
		ArrayList<Bidding> bList = new BiddingService().selectBuyBiddingList(pCode);
		ArrayList<Bidding> sList = new BiddingService().selectSellBiddingList(pCode);
		int likeCount = new ProductService().selectCountLike(pCode);
		int userLike = new ProductService().selectUserLike(userNo, pCode);
		
		// 상품 상세 아래에 띄울 스타일 4개 조회
		ArrayList<Style> st = new ProductService().selectReviewStyle(pCode);
		ArrayList<StyleImg> iList = new ArrayList<StyleImg> ();
		if(st.size() < 4) {
			for(int i=0; i<st.size(); i++) {
				StyleImg si = new ProductService().selectReviewImg(st.get(i).getStyleNo());
				iList.add(si);
			}
		} else {
			for(int i=0; i<4; i++) {
				StyleImg si = new ProductService().selectReviewImg(st.get(i).getStyleNo());
				iList.add(si);
			}
		}
		
		if(p == null) {
			session.setAttribute("alertMsg", "상품 상세조회에 실패했습니다.");
		} else {
			request.setAttribute("p", p);
			request.setAttribute("dList", dList);
			request.setAttribute("pImgList", pImgList);
			request.setAttribute("bList", bList);
			request.setAttribute("sList", sList);
			request.setAttribute("likeCount", likeCount);
			request.setAttribute("userLike", userLike);
			request.setAttribute("st", st);
			request.setAttribute("iList", iList);
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

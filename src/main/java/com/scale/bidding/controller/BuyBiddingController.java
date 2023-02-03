package com.scale.bidding.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.scale.bidding.model.service.BiddingService;
import com.scale.bidding.model.vo.Bidding;
import com.scale.bidding.model.vo.Buyer;
import com.scale.user.model.vo.User;

/**
 * Servlet implementation class BuyBiddingController
 */
@WebServlet("/buybidding.bi")
public class BuyBiddingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyBiddingController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		int userNo = ((User)session.getAttribute("loginUser")).getUserNo();
		String bType = request.getParameter("bType");
		
		String recipient = request.getParameter("recipient");
		String reciPhone = request.getParameter("reciPhone");
		String shippingZipCode = request.getParameter("shippingZipCode");
		shippingZipCode = shippingZipCode.replace("(", "");
		shippingZipCode = shippingZipCode.replace(")", "");
		
		String shippingAddress = request.getParameter("shippingAddress");
		String shippingMsgNum = request.getParameter("shipping-msg");
		String shippingMsg = "";
		if(shippingMsgNum.equals("0")) {
			shippingMsg = "요청사항 없음";
		} else if(shippingMsgNum.equals("1")) {
			shippingMsg = "문 앞에 놓아주세요";
		} else if(shippingMsgNum.equals("2")) {
			shippingMsg = "경비실에 맡겨주세요";
		} else {
			shippingMsg = request.getParameter("shipping-msg-user");
		}
		
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice").replaceAll(",", "").replace("원", ""));
		String pCo = request.getParameter("pCo");
		String size = request.getParameter("size");
		// 결제 고유번호
		String paymentNum = request.getParameter("paymentNumber");
		// 결제 방법
		String paymentMethod = request.getParameter("paymentMethod");
		
		Bidding b = new Bidding();
		b.setpCode(pCo);
		b.setpSize(size);
		
		b.setUserNo(userNo);
		
		Buyer br = new Buyer(userNo, recipient, reciPhone, shippingZipCode, shippingAddress, shippingMsg, paymentNum, paymentMethod, totalPrice);
		
		
		if(("buyB").equals(bType)) {
			int price = Integer.parseInt(request.getParameter("price"));
			b.setbType(1);
			b.setbPrice(price);
			int result = new BiddingService().insertBuyBidding(b, br);
			
			if(result > 0) {
				
				session.setAttribute("alertMsg", "구매 입찰 성공");
				
				Bidding success = new BiddingService().selectBiddingSuccess(userNo);
				System.out.println(success);
				request.setAttribute("success", success);
				request.getRequestDispatcher("views/buy/buyBiddingSuccess.jsp").forward(request, response);
				
			} else {
				request.setAttribute("errorMsg", "구매 입찰 실패");
				response.sendRedirect(request.getContextPath() + "/detail.pd?co=" + pCo);
			}
			
		} else {
			int bNo = Integer.parseInt(request.getParameter("bNo"));
			int result = new BiddingService().updateDealCheckBuyer(bNo, br);
			
			if(result > 0) {
				
				session.setAttribute("alertMsg", "즉시 구매 성공");
				
				Bidding success = new BiddingService().selectBuyImediatelySuccess(bNo);
				request.setAttribute("success", success);
				request.getRequestDispatcher("views/buy/buyImediatelySuccess.jsp").forward(request, response);
			} else {
				request.setAttribute("errorMsg", "즉시 판매 실패");
				response.sendRedirect(request.getContextPath() + "/detail.pd?co=" + pCo);
			}
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

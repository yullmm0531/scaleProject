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
import com.scale.bidding.model.vo.Seller;
import com.scale.user.model.vo.User;

/**
 * Servlet implementation class SellBiddingController
 */
@WebServlet("/sellbidding.bi")
public class SellBiddingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellBiddingController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		int userNo = ((User)session.getAttribute("loginUser")).getUserNo();
		String userName = ((User)session.getAttribute("loginUser")).getUserName();
		String bType = request.getParameter("bType");
		String userAccBank = request.getParameter("userAccBank");
		String userAccNum = request.getParameter("userAccNum");
		String recipient = request.getParameter("recipient");
		String reciPhone = request.getParameter("reciPhone");
		String shippingZipCode = request.getParameter("shippingZipCode");
		shippingZipCode = shippingZipCode.replace("(", "");
		shippingZipCode = shippingZipCode.replace(")", "");
		//System.out.println(shippingZipCode);
		
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
		//System.out.println(shippingMsg);
		
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice").replaceAll(",", "").replace("원", ""));
		String pCo = request.getParameter("pCo");
		String size = request.getParameter("size");
		
		//System.out.println(totalPrice);
		
		Bidding b = new Bidding();
		b.setpCode(pCo);
		b.setpSize(size);
		
		b.setUserNo(userNo);
		
		Seller sr = new Seller(userNo, recipient, reciPhone, shippingZipCode, shippingAddress, shippingMsg, userAccBank, userAccNum, userName, totalPrice);
		
		
		
		if(bType.equals("sellB")) {
			int price = Integer.parseInt(request.getParameter("price"));
			b.setbType(2);
			b.setbPrice(price);
			int result = new BiddingService().insertBidding(b, sr);
			
			if(result > 0) {
				
				session.setAttribute("alertMsg", "판매 입찰 성공");
				
				Bidding success = new BiddingService().selectSellBiddingSuccess(userNo);
				request.setAttribute("success", success);
				request.getRequestDispatcher("views/sell/sellBiddingSuccess.jsp").forward(request, response);
				
			} else {
				request.setAttribute("errorMsg", "판매 입찰 실패");
				response.sendRedirect(request.getContextPath() + "/detail.pd?co=" + pCo);
			}
			
		} else {
			int bNo = Integer.parseInt(request.getParameter("bNo"));
			int result = new BiddingService().updateDealCheck(bNo, sr);
			
			if(result > 0) {
				
				session.setAttribute("alertMsg", "즉시 판매 성공");
				
				Bidding success = new BiddingService().selectSellImediatelySuccess(bNo);
				request.setAttribute("success", success);
				request.getRequestDispatcher("views/sell/sellImediatelySuccess.jsp").forward(request, response);
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

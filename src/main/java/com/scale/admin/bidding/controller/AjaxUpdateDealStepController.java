package com.scale.admin.bidding.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.scale.admin.bidding.model.service.BiddingService;
import com.scale.admin.bidding.model.vo.Bidding;
import com.scale.user.model.service.UserService;
import com.scale.user.model.vo.User;

/**
 * Servlet implementation class AjaxUpdateDealStepController
 */
@WebServlet("/updateDealStep.ad")
public class AjaxUpdateDealStepController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxUpdateDealStepController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bNo = Integer.parseInt(request.getParameter("bNo"));
		//System.out.println(bNo);
		String dStep = request.getParameter("dStep");
		//System.out.println(dStep);
		int sellerNo = Integer.parseInt(request.getParameter("seller"));
		
		int result = new BiddingService().updateDealStep(bNo, dStep, sellerNo);
		Bidding b = new BiddingService().selectChangeBidding(bNo);
		//System.out.println(result);
		//System.out.println(b);
		
		if(result > 0) {
			User reportedUser = new UserService().selectUserByUserNo(sellerNo);
			request.getSession().setAttribute("loginUser", reportedUser);
			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(b, response.getWriter());
		} else {
			
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

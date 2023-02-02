package com.scale.customerCenter.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.scale.common.MyFileRenamePolicy;
import com.scale.customerCenter.model.service.CustomerCenterService;
import com.scale.customerCenter.model.vo.Inquire;
import com.scale.user.model.vo.User;

/**
 * Servlet implementation class InquireInsertController
 */
@WebServlet("/insert.inq")
public class InquireInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquireInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10*1024*1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/images/customerCenter/inquire_upfiles/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			HttpSession session = request.getSession();
			int userNo = ((User)session.getAttribute("loginUser")).getUserNo();

			String category = multiRequest.getParameter("category");
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			
			Inquire iq = new Inquire();
			iq.setCategory(category);
			iq.setInquireTitle(title);
			iq.setInquireContent(content);
			iq.setInquireUser(String.valueOf(userNo));
			
			if(multiRequest.getOriginalFileName("upfile") != null) {
				iq.setInquireImg("resources/images/customerCenter/inquire_upfiles/" + multiRequest.getFilesystemName("upfile"));
			}
			
			int result = new CustomerCenterService().insertInquire(iq);
			
			if(result > 0) {
				session.setAttribute("alertMsg", "1:1 문의가 접수되었습니다. ");
				response.sendRedirect(request.getContextPath() + "/list.inq?cpage=1");
			}else {
				if(iq.getInquireImg() != null) {
					new File(savePath + iq.getInquireImg()).delete();
				}
				
				request.setAttribute("errorMsg", "1:1 문의글 접수가 실패되었습니다. 잠시 후 다시 시도해주세요.");
				response.sendRedirect(request.getContextPath() + "/list.inq?cpage=1");
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

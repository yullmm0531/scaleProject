package com.scale.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.scale.user.model.service.UserService;
import com.scale.user.model.vo.User;

/**
 * Servlet implementation class updatePwdController
 */
@WebServlet("/updatePwd.us")
public class UpdatePwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String OriginalUserPWd = request.getParameter("OriginalUserPWd");
		String updatePwd = request.getParameter("updatePwd");
		String updatePwdCheck = request.getParameter("updatePwdCheck");
		
			HttpSession session = request.getSession();
		
		
		
			User updateUser = new UserService().updatePwd(userId, updatePwd);
			
			if(updateUser == null) {
				session.setAttribute("alertMsg", "비밀번호 변경에 실패하였습니다");
				response.sendRedirect(request.getContextPath() + "userInfoUpdate.us");
			}else {
				session.setAttribute("alertMsg", "비밀번호를 성공적으로 변경하였습니다.");
				session.setAttribute("loginUser", updateUser);
				request.getRequestDispatcher("views/user/userInfoUpdateForm.jsp").forward(request, response);
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

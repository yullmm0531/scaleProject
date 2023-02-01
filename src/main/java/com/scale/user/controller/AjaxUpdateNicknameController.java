package com.scale.user.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.scale.common.MyFileRenamePolicy;
import com.scale.user.model.service.UserService;
import com.scale.user.model.vo.User;

/**
 * Servlet implementation class AjaxUpdateNicknameController
 */
@WebServlet("/updateNickname.ajax")
public class AjaxUpdateNicknameController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxUpdateNicknameController() {
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
			String savePath = request.getSession().getServletContext().getRealPath("/resources/images/profile/profile_upfiles/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String nickname = multiRequest.getParameter("nickname");
			String introduce = multiRequest.getParameter("introduce");
			String deleteFlag = multiRequest.getParameter("deleteFlag");
			
			HttpSession session = request.getSession();
			int userNo = ((User)session.getAttribute("loginUser")).getUserNo();
			String userId = ((User)session.getAttribute("loginUser")).getUserId();
			String userPwd = ((User)session.getAttribute("loginUser")).getUserPwd();
			
			User u = new User();
			u.setUserNo(userNo);
			u.setUserNickName(nickname);
			u.setIntroduce(introduce);
			u.setUserId(userId);
			u.setUserPwd(userPwd);
			
			if(deleteFlag.equals("true")) { // 삭제버튼을 누른 경우
				u.setProfileImg("resources/images/profile/default_img.png");
			} else {
				if(multiRequest.getOriginalFileName("uploadFile") != null) { // 첨부파일이 있는 경우
					u.setProfileImg("resources/images/profile/profile_upfiles/" + multiRequest.getFilesystemName("uploadFile"));
				} else {
					String profileImg = ((User)session.getAttribute("loginUser")).getProfileImg();
					u.setProfileImg(profileImg);
				}
			}
			
			User updateUser = new UserService().updateNickname(u);
			
			response.setContentType("apllication/json; charset=UTF-8");
			if(updateUser == null) {
				if(multiRequest.getFilesystemName("upfile") != null) {
					new File(savePath + multiRequest.getFilesystemName("upfile")).delete();
				}
				new Gson().toJson(updateUser, response.getWriter());
			} else {
				session.setAttribute("loginUser", updateUser);
				session.setAttribute("User", updateUser);
				new Gson().toJson(updateUser, response.getWriter());
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

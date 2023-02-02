package com.scale.style.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.scale.common.MyFileRenamePolicy;
import com.scale.style.model.service.StyleService;
import com.scale.style.model.vo.Style;
import com.scale.style.model.vo.StyleImg;
import com.scale.user.model.vo.User;

/**
 * Servlet implementation class StyleInsertController
 */
@WebServlet("/insert.st")
public class StyleInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StyleInsertController() {
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
			String savePath = request.getSession().getServletContext().getRealPath("/resources/images/style/style_upfiles/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 유저번호, 사진들, 상품코드들, 내용, 해쉬태그들
			HttpSession session = request.getSession();
			int userNo = ((User)session.getAttribute("loginUser")).getUserNo();
			String[] tagArr = multiRequest.getParameterValues("tag");
			String tag = "";
			if(tagArr != null) {
				tag = String.join(" ", tagArr);
			}
			String[] pcodeArr = multiRequest.getParameterValues("pCode");
			String pcode = "";
			if(pcodeArr != null) {
				pcode = String.join(" ", pcodeArr);
			}
			
			Style s = new Style();
			s.setContent(multiRequest.getParameter("content"));
			s.setHashtag(tag); // null 가능
			s.setStyleWriter(String.valueOf(userNo));
			
			ArrayList<StyleImg> list = new ArrayList<>();
			
			for(int i=1; i<=10; i++) {
				String key = "file" + i;
				if(multiRequest.getOriginalFileName(key) != null) {
					StyleImg img = new StyleImg();
					img.setOriginName(multiRequest.getOriginalFileName(key));
					img.setChangeName(multiRequest.getFilesystemName(key));
					img.setFilePath("resources/images/style/style_upfiles/");
					img.setFileLevel(i == 1 ? 1 : 2);
					list.add(img);
				}
			}
			
			StyleService sService = new StyleService();
			
			int result = sService.insertStyle(s, list, pcode);
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "성공적으로 스타일이 등록되었습니다.");
				String nickname = ((User)session.getAttribute("loginUser")).getUserNickName();
				response.sendRedirect(request.getContextPath() + "/profileView.st?nickname=" + nickname);
			} else {
				for(int j=0; j<list.size(); j++) {
					new File(savePath + list.get(j).getChangeName()).delete();
				}
				request.getSession().setAttribute("alertMsg", "스타일 작성에 실패했습니다.");
				response.sendRedirect(request.getContextPath() + "/trendinglist.st?cpage=1");
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

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
 * Servlet implementation class StyleChangeController
 */
@WebServlet("/change.st")
public class StyleChangeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StyleChangeController() {
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
			int styleNo = Integer.parseInt((multiRequest.getParameter("styleNo")));
			String[] tagArr = multiRequest.getParameterValues("tag");
			String tag = "";
			if(tagArr != null) {
				tag = String.join(" ", tagArr);
			}
			String[] pcodeArr = multiRequest.getParameterValues("pCode");
			
			Style st = new Style();
			st.setStyleNo(styleNo);
			st.setContent(multiRequest.getParameter("content"));
			st.setHashtag(tag); // null 가능
			st.setStyleWriter(String.valueOf(userNo));
			
			ArrayList<StyleImg> list = new ArrayList<>();
			
			StyleImg img = new StyleImg();
			for(int i=1; i<=10; i++) {
				String key = "file" + i;
				if(multiRequest.getOriginalFileName(key) == null) { // 첨부 x
					if(multiRequest.getParameter("thumbnail" + i) != "/scale/resources/images/style/plus.png") { // 기존 o
						img.setOriginName("아무거나");
						img.setChangeName(multiRequest.getParameter("cname" + i));
						img.setFilePath("resources/images/style/style_upfiles/");
						img.setFileLevel(i == 1 ? 1 : 2);
						list.add(img);
					}
				} else {
					img.setOriginName(multiRequest.getOriginalFileName(key));
					img.setChangeName(multiRequest.getFilesystemName(key));
					img.setFilePath("resources/images/style/style_upfiles/");
					img.setFileLevel(i == 1 ? 1 : 2);
					list.add(img);
				}
			}
			
			StyleService sService = new StyleService();
			int result1 = sService.deleteImgPd(styleNo);
			int result2 = sService.updateStyle(st, list, pcodeArr);
			if(result1 > 0 && result2 > 0) {
				request.getSession().setAttribute("alertMsg", "성공적으로 스타일이 등록되었습니다.");
			} else {
				for(int j=0; j<list.size(); j++) {
					new File(savePath + list.get(j).getChangeName()).delete();
				}
				request.getSession().setAttribute("alertMsg", "스타일 수정에 실패했습니다.");
			}
			response.sendRedirect(request.getContextPath() + "/profileView.st?userNo=" + userNo);
			
		}
		
		
		
//		ArrayList<RecipeOrder> listOrder = new ArrayList<>();
//		
//		//int num2 = 1;
//		for(int lo=2 ; lo<=11 ; lo++) {
//			String orderExp = multiRequest.getParameter("order" + (lo-1));
//			int recipeNoO = Integer.parseInt(multiRequest.getParameter("no"));
//			int orderNo = Integer.parseInt(multiRequest.getParameter("orderNo"));
//			
//			String orderImg = multiRequest.getParameter("orderFile" + (lo-1));
//			String changeOrderImg = "resources/recipe_upfiles/" + multiRequest.getFilesystemName("file" + lo);
//			
//		
//			if(orderExp != null) {
//				RecipeOrder listO = new RecipeOrder();
//				listO.setRecipeExplain(orderExp);
//				listO.setRecipeNo(recipeNoO);
//				listO.setRecipeOrderNo(orderNo);
//				listO.setRecipeOrder(lo-1);
//				
//				if(multiRequest.getFilesystemName("file" + lo) != null) {
//					listO.setRecipeImg(changeOrderImg);
//				}else {
//					listO.setRecipeImg(orderImg);
//				}
//				
//				
//				// String orderFile = "resources/recipe_upfiles/" + multiRequest.getFilesystemName("file" + lo);
//				// listO.setRecipeImg(orderFile);
//			
//				listOrder.add(listO);
//				
//			}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

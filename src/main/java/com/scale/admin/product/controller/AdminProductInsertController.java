package com.scale.admin.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.scale.admin.product.model.service.ProductService;
import com.scale.admin.product.model.vo.Product;
import com.scale.admin.product.model.vo.ProductImg;
import com.scale.common.MyFileRenamePolicy;

/**
 * Servlet implementation class AdminProductInsertController
 */
@WebServlet("/AdPInsert.pd")
public class AdminProductInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminProductInsertController() {
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
			
		String savePath = request.getSession().getServletContext().getRealPath("/resources/images/product/product_upfiles/");
		
		
		MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		
		String productCode = multiRequest.getParameter("code");
		String productNameKo = multiRequest.getParameter("nameKo");
		String productNameEng= multiRequest.getParameter("nameEng");
		String productCategory = multiRequest.getParameter("category");
		
		
		HttpSession session = request.getSession();
		
		Product p = new Product();
		p.setProductCode(productCode);
		p.setProductNameKo(productNameKo);
		p.setProductNameEng(productNameEng);
		p.setProductCategory(productCategory);
		
		ProductImg at = null;	
		
		if(multiRequest.getOriginalFileName("upfile") != null) {	// 첨부파일이 있을 경우
			at = new ProductImg();
			at.setpOriginName(multiRequest.getOriginalFileName("upfile"));
			at.setpChangeName(multiRequest.getFilesystemName("upfile"));
			at.setFilePath("resources/images/product/upload_files/");
		}
		
		int result = new ProductService().insertProduct(p, at);
		
		if(result > 0) { 
			response.sendRedirect(request.getContextPath() + "/AdPSelect.apd?cpage=1");

		}else {
			request.setAttribute("errorMsg", "일반게시글 작성 실패");
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

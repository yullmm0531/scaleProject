package com.scale.admin.product.model.service;

import static com.scale.common.JDBCTemplate.*;
import static com.scale.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.scale.admin.product.model.vo.*;
import com.scale.common.model.vo.PageInfo;
import com.scale.admin.product.model.dao.ProductDao;

public class ProductService {

	public ArrayList<Product> selectAdProductList(){
		
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectAdProductList(conn);
		close(conn);
		return list;
		
	}
	
	
	public ArrayList<Brand> selectAdBrandList(){
		
		Connection conn = getConnection();
		ArrayList<Brand> blist = new ProductDao().selectAdBrandList(conn);
		close(conn);
		return blist;
		
	}
	
	public int searchProductCount() {
		Connection conn = getConnection();
		int listCount = new ProductDao().searchProductCount(conn);
		close(conn);
		return listCount;
		
	}
	
	
	
	public ArrayList<Product> selectProductSearchList(PageInfo pi, String keyword){
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectProductSearchList(conn, pi, keyword);
		close(conn);
		return list;
	}
	
	
	public int increaseCount(int productCode) {
		Connection conn = getConnection();
		int result = new ProductDao().increaseCount(conn, productCode);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	/*
	public Product selectProductDetail(int productCode) {
		Connection conn = getConnection();
		Product p = new ProductDao().selectProductDetail(conn, productCode);
		close(conn);
		return p;
	}
	
	
	public ProductImg selectAdProductImg(int productCode) {
		Connection conn = getConnection();
		ProductImg at = new ProductDao().selectAdProductImg(conn, productCode);
		close(conn);
		return at;
	}
	
	
	public int insertProduct(Product p, ProductImg at) {
		Connection conn = getConnection();
		
		int result1 = new ProductDao().insertProduct(conn, p);
		
		int result2 = 1;		// 첨부파일 없는 게시물일수도 있기 때문에 대비해서 0이 아닌 1로 초기화
		if(at != null) {
			result2 = new ProductDao().insertProductImg(conn, at);
		}
		
		if(result1 >0 && result2 >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2; 
		
	}
	
	
	public int updateProduct(Product p, ProductImg at) {
		Connection conn = getConnection();
		int result1 = new ProductDao().updateProduct(conn, p);
		
		int result2 = 1;
		if(at != null) {
			if(at.getpImgNo() != 0) {
				result2 = new ProductDao().updateProductImg(conn, at);
			}else {
				result2 = new ProductDao().insertProductImg(conn, at)
			}
		}
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result1 * result2;
	}
	*/
}

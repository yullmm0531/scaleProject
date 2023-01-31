package com.scale.product.model.service;

import static com.scale.common.JDBCTemplate.close;
import static com.scale.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.scale.product.model.dao.ProductDao;
import com.scale.product.model.vo.Brand;
import com.scale.product.model.vo.Product;
import com.scale.product.model.vo.ProductImg;


public class ProductService {

	public ArrayList<Product> selectProductList(){
		
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectProductList(conn);
		close(conn);
		return list;
	}
	
	public ArrayList<Product> selectProductListPage(int currentPage, int boardLimit){
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectProductListPage(conn,currentPage, boardLimit);
		close(conn);
		return list;
	}
	
	

	public ArrayList<Brand> selectBrandList(){
		Connection conn = getConnection();
		ArrayList<Brand> blist = new ProductDao().selectBrandList(conn);
		close(conn);
		return blist;
	}
	
	public ArrayList<Product> selectProductSearchList(String keyword){
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectProductSearchList(conn, keyword);
		close(conn);
		return list;
	}
	/*
	public int clickLike(int userNo, String productCode){
		Connection conn = getConnection();
		int result = 0;
		if(clickLike >0) {
			result = new ProductDao().deleteLike(conn, userNo, productCode);
		}else {
			result = new ProductDao().insertLike(conn, userNo, productCode);
		}
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}
	
	*/
	
	public Product selectProduct(String pCode) {
		
		Connection conn = getConnection();
		Product p = new ProductDao().selectProduct(conn, pCode);
		
		close(conn);
		
		return p;
	}
	
	
	public ArrayList<ProductImg> selectProductImg(String pCode){
		
		Connection conn = getConnection();
		ArrayList<ProductImg> list = new ProductDao().selectProductImg(conn, pCode);
		
		close(conn);
		
		return list;
		
	}
	
}

	


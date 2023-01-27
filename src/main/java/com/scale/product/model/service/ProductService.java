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
	

	public ArrayList<Brand> selectBrandList(){
		Connection conn = getConnection();
		ArrayList<Brand> blist = new ProductDao().selectBrandList(conn);
		close(conn);
		return blist;
	}
	/*
	public ArrayList<Product> selectProductSearchList(String pkey){
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectProductSearchList(conn, pkey);
		close(conn);
		return list;
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

	


package com.scale.product.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static com.scale.common.JDBCTemplate.*;

import com.scale.product.model.dao.ProductDao;
import com.scale.product.model.vo.Product;


public class ProductService {

	public ArrayList<Product> selectProductList(){
		
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectProductList(conn);
		close(conn);
		return list;
	}
	
}

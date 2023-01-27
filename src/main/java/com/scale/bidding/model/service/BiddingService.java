package com.scale.bidding.model.service;

import static com.scale.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.scale.bidding.model.dao.BiddingDao;
import com.scale.bidding.model.vo.Bidding;

public class BiddingService {
	
	public ArrayList<Bidding> selectDealList(String pCode) {
		
		Connection conn = getConnection();
		ArrayList<Bidding> list = new BiddingDao().selectDealList(conn, pCode);
		
		close(conn);
		
		return list;
		
	}
	
	
}

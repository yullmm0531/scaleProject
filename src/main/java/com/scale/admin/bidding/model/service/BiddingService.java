package com.scale.admin.bidding.model.service;

import static com.scale.common.JDBCTemplate.close;
import static com.scale.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.scale.admin.bidding.model.dao.BiddingDao;
import com.scale.admin.bidding.model.vo.Bidding;
import com.scale.common.model.vo.PageInfo;



public class BiddingService {
	
	/**
	 * 입찰 전체 개수 조회
	 * @return 입찰 전체 개수
	 */
	public int selectBiddingListCount() {
		
		Connection conn = getConnection();
		int listCount = new BiddingDao().selectBiddingListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	/**
	 * 입찰 전체 리스트 조회
	 * @param pi
	 * @return 입찰 전체 리스트
	 */
	public ArrayList<Bidding> selectBiddingList(PageInfo pi) {
		
		Connection conn = getConnection();
		ArrayList<Bidding> list = new BiddingDao().selectBiddingList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	
	
}

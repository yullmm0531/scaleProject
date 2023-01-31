package com.scale.bidding.model.service;

import static com.scale.common.JDBCTemplate.close;
import static com.scale.common.JDBCTemplate.getConnection;

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
	
	
	public ArrayList<Bidding> selectBuyBiddingList(String pCode){
		
		Connection conn = getConnection();
		ArrayList<Bidding> list = new BiddingDao().selectBuyBiddingList(conn, pCode);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Bidding> selectSellBiddingList(String pCode){
		
		Connection conn = getConnection();
		ArrayList<Bidding> list = new BiddingDao().selectSellBiddingList(conn, pCode);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Bidding> selectDealSizeList(String pCode, String size){
		
		Connection conn = getConnection();
		ArrayList<Bidding> list = new BiddingDao().selectDealSizeList(conn, pCode, size);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Bidding> selectSellBiddingSizeList(String pCode, String size){
		
		Connection conn = getConnection();
		ArrayList<Bidding> list = new BiddingDao().selectSellBiddingSizeList(conn, pCode, size);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Bidding> selectBuyBiddingSizeList(String pCode, String size){
		
		Connection conn = getConnection();
		ArrayList<Bidding> list = new BiddingDao().selectBuyBiddingSizeList(conn, pCode, size);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Bidding> selectSellBiddingPriceList(String pCode) {
		
		Connection conn = getConnection();
		ArrayList<Bidding> list = new BiddingDao().selectSellBiddingPrice(conn, pCode);
		
		close(conn);
		
		return list;
		
	}
	
	public Bidding selectSellBidding(String pCode, String size, int price) {
		
		Connection conn = getConnection();
		Bidding b = new BiddingDao().selectSellBidding(conn, pCode, size, price);
		
		close(conn);
		
		return b;
		
	}
	
}

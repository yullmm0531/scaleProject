package com.scale.bidding.model.service;

import static com.scale.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.scale.bidding.model.dao.BiddingDao;
import com.scale.bidding.model.vo.Bidding;
import com.scale.bidding.model.vo.Seller;

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
	
	public ArrayList<Bidding> selectBuyBiddingPriceList(String pCode) {
		
		Connection conn = getConnection();
		ArrayList<Bidding> list = new BiddingDao().selectBuyBiddingPrice(conn, pCode);
		
		close(conn);
		
		return list;
		
	}
	
	
	public Bidding selectBuyBidding(String pCode, String size, int price) {
		
		Connection conn = getConnection();
		Bidding b = new BiddingDao().selectBuyBidding(conn, pCode, size, price);
		
		close(conn);
		
		return b;
		
	}
	
	
	public int insertBidding(Bidding b, Seller sr) {
		
		Connection conn = getConnection();
		int result1 = new BiddingDao().insertBidding(conn, b);
		int result2 = new BiddingDao().insertSeller(conn, sr);
		
		if(result1 * result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return (result1 * result2);
	}
	
	
	public Bidding selectSellBiddingSuccess(int userNo) {
		
		Connection conn = getConnection();
		Bidding b = new BiddingDao().selectSellBiddingSuccess(conn, userNo);
		
		close(conn);
		
		return b;
	}
	
	public int updateDealCheck(int bNo, Seller sr) {
		
		Connection conn = getConnection();
		int result1 = new BiddingDao().updateDealCheck(conn, bNo);
		int result2 = new BiddingDao().updateSeller(conn, bNo, sr);
		if(result1 * result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return (result1 * result2);
		
	}
	
	public Bidding selectSellImediatelySuccess(int bNo) {
		
		Connection conn = getConnection();
		Bidding b = new BiddingDao().selectSellImediatelySuccess(conn, bNo);
		
		close(conn);
		
		return b;
	}
	
}

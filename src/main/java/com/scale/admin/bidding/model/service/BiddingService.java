package com.scale.admin.bidding.model.service;

import static com.scale.common.JDBCTemplate.close;
import static com.scale.common.JDBCTemplate.commit;
import static com.scale.common.JDBCTemplate.getConnection;
import static com.scale.common.JDBCTemplate.rollback;

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
	
	/**
	 * 입찰종류별 입찰 개수 조회
	 * @param category
	 * @return 입찰 개수
	 */
	public int selectBiddingTypeCount(String biddingType) {
		
		Connection conn = getConnection();
		int listCount = 0;
		if(biddingType.equals("all")) {
			listCount = new BiddingDao().selectBiddingListCount(conn);
			
		} else {
			listCount = new BiddingDao().selectBiddingTypeCount(conn, biddingType);
		}
		
		close(conn);
		return listCount;
	}
	
	/**
	 * 입찰종류별 입찰 리스트 조회
	 * @param biddingType
	 * @param pi
	 * @return 입찰종류별 입찰 리스트
	 */
	public ArrayList<Bidding> selectBiddingTypeList(String biddingType, PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Bidding> list = null;
		if(biddingType.equals("all")) {
			list = new BiddingDao().selectBiddingList(conn, pi);
		} else {
			list = new BiddingDao().selectBiddingTypeList(conn, biddingType, pi);
		}
		
		close(conn);
		return list;
	}
	
	/**
	 * 거래 전체 개수 조회
	 * @return 거래 전체 개수
	 */
	public int selectDealListCount() {
		
		Connection conn = getConnection();
		int listCount = new BiddingDao().selectDealListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	/**
	 * 거래 전체 리스트 조회
	 * @param pi
	 * @return 거래 전체 리스트
	 */
	public ArrayList<Bidding> selectDealList(PageInfo pi) {
		
		Connection conn = getConnection();
		ArrayList<Bidding> list = new BiddingDao().selectDealList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	
	public int updateDealStep(int bNo, String dStep, int sellerNo) {
		
		Connection conn = getConnection();
		int result = 0;
		if(dStep.equals("1")) { // 입고완료
			int result1 = new BiddingDao().updateDealStep(conn, bNo, dStep);
			int result2 = new BiddingDao().updateStoreDate(conn, bNo);
			result = result1 * result2;
		} else if(dStep.equals("3") || dStep.equals("4")) { // 검수완료 | 검수미통과
			int result1 = new BiddingDao().updateDealStep(conn, bNo, dStep);
			int result2 = new BiddingDao().updateInspectionDate(conn, bNo);
			if(dStep.equals("4")){
				int result3 = new BiddingDao().insertPenalty(conn, bNo, sellerNo);
				result = result1 * result2 * result3;
			} else {
				result = result1 * result2;
			}
			
		} else if(dStep.equals("5")) { // 출고완료
			int result1 = new BiddingDao().updateDealStep(conn, bNo, dStep);
			int result2 = new BiddingDao().updateShipDate(conn, bNo);
			result = result1 * result2;
		} else {
			result = new BiddingDao().updateDealStep(conn, bNo, dStep);
		}
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
		
	}
	
	
	public Bidding selectChangeBidding(int bNo) {
		
		Connection conn = getConnection();
		Bidding b = new BiddingDao().selectChangeBidding(conn, bNo);
		
		close(conn);
		
		return b;
		
	}
	
}

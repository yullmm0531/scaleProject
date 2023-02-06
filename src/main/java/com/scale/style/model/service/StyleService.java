package com.scale.style.model.service;

import static com.scale.common.JDBCTemplate.close;
import static com.scale.common.JDBCTemplate.commit;
import static com.scale.common.JDBCTemplate.getConnection;
import static com.scale.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.scale.common.model.vo.PageInfo;
import com.scale.product.model.vo.Product;
import com.scale.style.model.dao.StyleDao;
import com.scale.style.model.vo.Hashtag;
import com.scale.style.model.vo.Style;
import com.scale.style.model.vo.StyleImg;
import com.scale.style.model.vo.StyleReport;

public class StyleService {
	
	public int selectListCount() {
		Connection conn = getConnection();
		int result = new StyleDao().selectListCount(conn);
		close(conn);
		return result;
	}
	
	public int selectSearchListCount(String keyword) {
		Connection conn = getConnection();
		int result = new StyleDao().selectSearchListCount(conn, keyword);
		close(conn);
		return result;
	}
	
	public int selectStyleCountByUserNo(int userNo) {
		Connection conn = getConnection();
		int result = new StyleDao().selectStyleCountByUserNo(conn, userNo);
		close(conn);
		return result;
	}
	
	public ArrayList<Style> selectStyleList(int currentPage, int boardLimit){
		Connection conn = getConnection();
		ArrayList<Style> list = new StyleDao().selectStyleList(conn, currentPage, boardLimit);
		close(conn);
		return list;
	}
	
	public ArrayList<Style> selectStyleByHashtag(int currentPage, int boardLimit, String keyword){
		Connection conn = getConnection();
		ArrayList<Style> list = new StyleDao().selectStyleByHashtag(conn, currentPage, boardLimit, keyword);
		close(conn);
		return list;
	}
	
	public ArrayList<StyleImg> selectStyleImgByNo(int styleNo){
		Connection conn = getConnection();
		ArrayList<StyleImg> imgs = new StyleDao().selectStyleImgByNo(conn, styleNo);
		close(conn);
		return imgs;
	}
	
	public ArrayList<Hashtag> selectTagList(){
		Connection conn = getConnection();
		ArrayList<Hashtag> tag = new StyleDao().selectTagList(conn);
		close(conn);
		return tag;
	}
	
	public ArrayList<Style> selectNewStyleList(int currentPage, int boardLimit){
		Connection conn = getConnection();
		ArrayList<Style> list = new StyleDao().selectNewStyleList(conn, currentPage, boardLimit);
		close(conn);
		return list;
	}
	
	public int insertStyle(Style s, ArrayList<StyleImg> list, String pcode) {
		Connection conn = getConnection();
		
		// 1. TB_STYLE INSERT(필수)
		int result1 = new StyleDao().insertStyle(conn, s);
		
		// 2. TB_STYLE_IMG INSERT(필수)
		int result2 = new StyleDao().insertStyleImg(conn, list);
		
		// 3. TB_STYLE-PD INSERT(선택)
		int result3 = 1;
		if(pcode != "") {
			String[] codeArr = pcode.split(" ");
			result3 = new StyleDao().insertStylePd(conn, codeArr);
		}
		
		// 4. TB_HASHTAG INSERT(선택) 
		// 먼저 기존의 해쉬태그 있는지 확인(SELECT) 후 있으면 UPDATE 없으면 INSERT(반복문)
		int result4 = 1;
		if(s.getHashtag() != "") {
			String[] tagArr = s.getHashtag().split(" ");
			for(int i=0; i<tagArr.length; i++) {
				Hashtag t = new StyleDao().selectHashtag(conn, tagArr[i]);
				if(t == null) {
					// INSERT
					result4 = new StyleDao().insertHashtag(conn, tagArr[i]);
				} else {
					// UPDATE
					result4 = new StyleDao().updateHashtag(conn, tagArr[i]);
				}
			}
		}
		
		if(result1 > 0 && result2 > 0 && result3 > 0 && result4 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2 * result3 * result4;
	}
	
	public ArrayList<Style> selectStyleByUserNo(int currentPage, int boardLimit, int userNo){
		Connection conn = getConnection();
		ArrayList<Style> list = new StyleDao().selectStyleByUserNo(conn, currentPage, boardLimit, userNo);
		close(conn);
		return list;
	}
	
	public int checkLike(int userNo, int styleNo) {
		Connection conn = getConnection();
		int result = new StyleDao().checkLike(conn, userNo, styleNo);
		close(conn);
		return result;
	}
	
	public int updateLike(int checkLike, int userNo, int styleNo) {		
		Connection conn = getConnection();
		int result = 0;
		if(checkLike > 0) {
			result = new StyleDao().deleteLike(conn, userNo, styleNo);
		} else {
			result = new StyleDao().insertLike(conn, userNo, styleNo);
		}
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public ArrayList<Style> selectDetailList(int cpage, String view, int boardLimit, String tag, String nickname){
		Connection conn = getConnection();
		
		ArrayList<Style> list = new ArrayList<Style>();
		switch(view) {
		case "trending": list = new StyleDao().selectTrendingDetailList(conn, cpage, boardLimit);  break;
		case "newest": list = new StyleDao().selectNewestDetailList(conn, cpage, boardLimit); break;
		case "tagsearch": list = new StyleDao().selectTagSearchDetailList(conn, cpage, boardLimit, tag); break;
		case "profile": list = new StyleDao().selectProfileDetailList(conn, cpage, boardLimit, nickname); break;
		}
		close(conn);
		return list;
	}
	
	public ArrayList<Product> selectDetailProduct(int styleNo) {
		Connection conn = getConnection();
		ArrayList<Product> plist = new StyleDao().selectDetailProduct(conn, styleNo);
		close(conn);
		return plist;
	}

	public HashMap<String, Object> selectDetail(int cpage, String view, int boardLimit, String tag, String uNum, int userNo){
		Connection conn = getConnection();
		
		ArrayList<Style> list = new ArrayList<Style>();
		switch(view) {
		case "trending": list = new StyleDao().selectTrendingDetailList(conn, cpage, boardLimit);  break;
		case "profile": list = new StyleDao().selectProfileDetailList(conn, cpage, boardLimit, uNum); break;
		case "newest": list = new StyleDao().selectNewestDetailList(conn, cpage, boardLimit); break;
		case "tagsearch": list = new StyleDao().selectTagSearchDetailList(conn, cpage, boardLimit, tag); break;
		}
		
		ArrayList<StyleImg> ilist = new ArrayList<>();
		ArrayList<Product> plist = new ArrayList<>();
		for(Style st : list) {
			ArrayList<StyleImg> imgs = new StyleDao().selectStyleImgByNo(conn, st.getStyleNo());
			for(StyleImg si : imgs) {
				ilist.add(si);
			}
			ArrayList<Product> pds = new StyleDao().selectDetailProduct(conn, st.getStyleNo());
			for(Product pd : pds) {
				plist.add(pd);
			}
		}
		
		int[] checkLike = new int[list.size()];
		for(int i=0; i<list.size(); i++) {
			int styleNo = list.get(i).getStyleNo();
			checkLike[i] = new StyleDao().checkLike(conn, userNo, styleNo);
		}
		
		close(conn);
		
		HashMap<String, Object> map = new HashMap();
		map.put("list", list);
		map.put("ilist", ilist);
		map.put("plist", plist);
		map.put("checkLike", checkLike);
		
		return map;
	}
	
	public HashMap<String, Object> selectAddDetail(int cpage, String view, int boardLimit, String tag, int no, int userNo) {
		Connection conn = getConnection();
		
		ArrayList<Style> list = new ArrayList<Style>();
		switch(view) {
		case "trending": list = new StyleDao().selectStyleList(conn, cpage, boardLimit);  break;
		case "profile": list = new StyleDao().selectStyleByUserNo(conn, cpage, boardLimit, no); break;
		case "newest": list = new StyleDao().selectNewStyleList(conn, cpage, boardLimit); break;
		case "tagsearch": list = new StyleDao().selectStyleByHashtag(conn, cpage, boardLimit, tag); break;
		}
		
		ArrayList<StyleImg> ilist = new ArrayList<>();
		ArrayList<Product> plist = new ArrayList<>();
		for(Style st : list) {
			ArrayList<StyleImg> imgs = new StyleDao().selectStyleImgByNo(conn, st.getStyleNo());
			for(StyleImg si : imgs) {
				ilist.add(si);
			}
			ArrayList<Product> pds = new StyleDao().selectDetailProduct(conn, st.getStyleNo());
			for(Product pd : pds) {
				plist.add(pd);
			}
		}
		
		int[] checkLike = new int[list.size()];
		for(int i=0; i<list.size(); i++) {
			int styleNo = list.get(i).getStyleNo();
			checkLike[i] = new StyleDao().checkLike(conn, userNo, styleNo);
		}
		
		close(conn);
		
		HashMap<String, Object> map = new HashMap();
		map.put("list", list);
		map.put("ilist", ilist);
		map.put("plist", plist);
		map.put("checkLike", checkLike);
		
		return map;
	}
	
	public int insertStyleReport(StyleReport rep) {
		Connection conn = getConnection();
		int result = new StyleDao().insertStyleReport(conn, rep);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public HashMap<String, Object> selectStyleDetail(int styleNo){
		Connection conn = getConnection();
		Style st = new StyleDao().selectStyle(conn, styleNo);
		ArrayList<StyleImg> ilist = new StyleDao().selectStyleImgByNo(conn, styleNo);
		ArrayList<Product> plist = new StyleDao().selectDetailProduct(conn, styleNo);
		
		close(conn);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("st", st);
		map.put("ilist", ilist);
		map.put("plist", plist);
		
		return map;
	}
	
	public HashMap<String, Object> selectReortDetail(int styleNo){
		Connection conn = getConnection();
		Style st = new StyleDao().selectReportStyle(conn, styleNo);
		ArrayList<StyleImg> ilist = new StyleDao().selectReportStyleImgByNo(conn, styleNo);
		ArrayList<Product> plist = new StyleDao().selectDetailProduct(conn, styleNo);
		
		close(conn);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("st", st);
		map.put("ilist", ilist);
		map.put("plist", plist);
		
		return map;
	}
	
	public int deleteStyleAdmin(String[] noArr) {
		Connection conn = getConnection();
		int result1 = 0;
		int result2 = 0;
		for(String no : noArr) {
			result1 += new StyleDao().deleteStyle(conn, no);
			if(new StyleDao().deleteStyle(conn, no) != 0) {
				result2 += new StyleDao().deleteStyleImg(conn, no);
			}
		}
		
		if(result1 == noArr.length) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result1;
	}
	
	public int adminSearchListCount(String select, String keyword, String date1, String date2) {
		Connection conn = getConnection();
		int result;
		if(select.equals("nickname")) {
			result = new StyleDao().adminSearchListCountByNickname(conn, keyword, date1, date2);
		} else {
			result = new StyleDao().adminSearchListCountByHashtag(conn, keyword, date1, date2);
		}
		close(conn);
		return result;
	}
	
	public ArrayList<Style> adminSearchList(int cpage, int boardLimit, String select, String keyword, String date1, String date2) {	
		Connection conn = getConnection();
		ArrayList<Style> list = new ArrayList<>();
		if(select.equals("nickname")) {
			list = new StyleDao().adminSearchListByNickname(conn, cpage, boardLimit, keyword, date1, date2);
		} else {
			list = new StyleDao().adminSearchListByHashtag(conn, cpage, boardLimit, keyword, date1, date2);
		}
		close(conn);
		return list;
	}
	
	public int updateStyle(Style st, ArrayList<StyleImg> list, String[] pcodeArr) {
		Connection conn = getConnection();
		int result1 = new StyleDao().updateStyle(conn, st);
		int result2 = 0;
		int result3 = 1;
		if(result1 > 0) {
			result2 = new StyleDao().deleteImg(conn, st.getStyleNo());
			ArrayList<Product> pd = new StyleDao().selectDetailProduct(conn, st.getStyleNo());
			if(!pd.isEmpty()) {
				result3 = new StyleDao().deleteProduct(conn, st.getStyleNo());
			}
			
		}
		
		int result4 = 0;
		int result5 = 1;
		int result6 = 1;
		if(result1>0 && result2>0 && result3>0) {
			result4 = new StyleDao().insertChangeStyleImg(conn, st.getStyleNo(), list);
			if(pcodeArr != null) {
				result5 = new StyleDao().insertChangeStylePd(conn, st.getStyleNo(), pcodeArr);
			}
			
			if(st.getHashtag() != "") {
				String[] tagArr = st.getHashtag().split(" ");
				for(int i=0; i<tagArr.length; i++) {
					Hashtag t = new StyleDao().selectHashtag(conn, tagArr[i]);
					if(t == null) {
						// INSERT
						result6 = new StyleDao().insertHashtag(conn, tagArr[i]);
					} else {
						// UPDATE
						result6 = new StyleDao().updateHashtag(conn, tagArr[i]);
					}
				}
			}
		}
		
		if(result1 > 0 && result2 > 0 && result3 > 0 && result4 > 0 && result5>0 && result6>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result1 * result2 * result3 * result4 * result5 * result6;
	}
	
	public int selectReportCount() {
		Connection conn = getConnection();
		int result = new StyleDao().selectReportCount(conn);
		close(conn);
		return result;
	}
	
	public ArrayList<StyleReport> selectReportList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<StyleReport> list = new StyleDao().selectReportList(conn, pi);
		close(conn);
		return list;
	}
	
	public StyleReport selectReport(int repNo) {
		Connection conn = getConnection();
		StyleReport rep = new StyleDao().selectReport(conn, repNo);
		close(conn);
		return rep;
	}
	
	public int rejectReport(int repNo) {
		Connection conn = getConnection();
		int result = new StyleDao().rejectReport(conn, repNo);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int processReport(int repNo, int userNo) {
		Connection conn = getConnection();
		int result1 = new StyleDao().processReport(conn, repNo);
		int result2 = 0;
		int result3 = 1;
		if(result1 > 0) {
			result2 = new StyleDao().selectReportCountByNo(conn, userNo);
			if(result2 >= 3) {
				result3 = new StyleDao().updateStyleBlockDate(conn, userNo);
			}
		}
		
		if(result1 > 0 && result2 != 0 && result3 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2 * result3;
	}
	
	public int searchReportCount(String select, String id) {
		Connection conn = getConnection();
		switch(select) {
		case "all": select = "all"; break;
		case "ready": select = "0"; break;
		case "report": select = "1"; break;
		case "reject": select = "22"; break;
		}
		int result = 0;
		if(select.equals("all")) {
			result = new StyleDao().selectReportCountByNickname(conn, id);
		} else {
			result = new StyleDao().selectReportCountByStatus(conn, id, select);
		}
		close(conn);
		return result;
	}
	
	public ArrayList<StyleReport> selectSearchReport(PageInfo pi, String select, String id){
		Connection conn = getConnection();
		switch(select) {
		case "all": select = "all"; break;
		case "ready": select = "0"; break;
		case "report": select = "1"; break;
		case "reject": select = "22"; break;
		}
		ArrayList<StyleReport> list = new ArrayList<StyleReport>();
		if(select.equals("all")) {
			list = new StyleDao().selectReportByNickname(conn, pi, id);
		} else {
			list = new StyleDao().selectReportByStatus(conn, pi, id, select);
		}
		close(conn);
		return list;
	}
}

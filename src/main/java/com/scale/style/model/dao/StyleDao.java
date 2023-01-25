package com.scale.style.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Properties;

import com.scale.style.model.vo.Style;
import com.scale.style.model.vo.StyleImg;

public class StyleDao {
	
	private Properties prop = new Properties();
	
	public StyleDao() {
		try {
			String filePath = StyleDao.class.getResource("/db/sql/style-mapper.xml").getPath();
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Style> selectStyleList(Connection conn){
		ArrayList<Style> list = new ArrayList<>();
		
		return list; 
	}
	
	public ArrayList<StyleImg> selectStyleImgList(Connection conn){
		ArrayList<StyleImg> list = new ArrayList<>();
		
		return list;
	}

}

package com.jb.pension.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

public class PensionDao {
	
	private Properties prop = new Properties();
	
	public PensionDao() {
		String path = PensionDao.class.getResource("/sql/member/pension-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	

}

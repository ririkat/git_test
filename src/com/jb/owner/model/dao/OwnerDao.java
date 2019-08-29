package com.jb.owner.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

public class OwnerDao {
	
	private Properties prop = new Properties();
	
	public OwnerDao() {
		String path = OwnerDao.class.getResource("/sql/owner/owner-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		} catch(IOException e) {
			e.printStackTrace();
		}
	}

}

package com.jb.pension.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

public class RoomDao {
	
	private Properties prop = new Properties();
	
	public RoomDao() {
		String path = RoomDao.class.getResource("/sql/member/room-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		} catch(IOException e) {
			e.printStackTrace();
		}
	}

}

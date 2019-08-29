package com.jb.member.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

public class MemberDao {
	
private Properties prop = new Properties();
	
	public MemberDao() {
		String path = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
			
		}
	}

}

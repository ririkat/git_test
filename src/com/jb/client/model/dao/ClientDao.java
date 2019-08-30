package com.jb.client.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.jb.client.model.vo.Client;

public class ClientDao {
	
	private Properties prop=new Properties();
	
	public ClientDao() {
		String path=ClientDao.class.getResource("/sql/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public int updateClient(Connection conn, Client c){
		PreparedStatement pstmt = null;
		int result=0;
		String sql=prop.getProperty("updateClient");
		try {
			pstmt=conn.prepareStatement(sql);
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}return result;
	}
}


	

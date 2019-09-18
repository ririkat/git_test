package com.jb.review.model.dao;

import static common.template.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class ReviewFileDao {
	
	public int addImages(Connection conn, int currval, String oriFile, String reFile) {
		Statement stmt=null;
		int result=0;
		String sql = "insert into review_file values('seq_review_file_no.nextval','"+oriFile+"','"+reFile+"','"+currval+"')";
		try {
			stmt=conn.createStatement();
			result = stmt.executeUpdate(sql);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
		}return result;
	}

}

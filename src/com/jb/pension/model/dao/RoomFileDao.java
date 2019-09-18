package com.jb.pension.model.dao;

import static common.template.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class RoomFileDao {

	public int addImages(Connection conn, int currval, String oriFile, String reFile) {
		Statement stmt = null;
		int result = 0;
		String sql = "insert into room_file values(seq_room_file_no.nextval,'"+oriFile+"','"+reFile+"','r'||"+currval+")";
		try {
			stmt = conn.createStatement();
			result = stmt.executeUpdate(sql);
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
		} return result;
	}
	
}

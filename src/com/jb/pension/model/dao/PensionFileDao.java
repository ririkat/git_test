package com.jb.pension.model.dao;

import static common.template.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.jb.pension.model.vo.PensionFile;

public class PensionFileDao {
	
	public int addImages(Connection conn, int currval, String oriFile, String reFile) {
		Statement stmt = null;
		int result = 0;
		String sql = "insert into pen_file values('p'||"+currval+",'"+oriFile+"','"+reFile+"')";
		try {
			stmt = conn.createStatement();
			result = stmt.executeUpdate(sql);
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
		} return result;
	}
	
	public List<PensionFile> selectImages(Connection conn){
		Statement stmt = null;
		ResultSet rs = null;
		List<PensionFile> list = new ArrayList();
		String sql = "select * from pen_file";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				PensionFile pf = new PensionFile();
				pf.setpCode(rs.getString("p_code"));
				pf.setpOriginalFile(rs.getString("P_ORIGINAL_FILE"));
				pf.setpRenameFile(rs.getString("P_RENAME_FILE"));
				list.add(pf);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		} return list;
	}

}

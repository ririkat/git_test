package com.jb.review.model.dao;

import static common.template.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.jb.review.model.vo.ReviewFile;

public class ReviewFileDao {
	
	public int addImages(Connection conn, int currval, String oriFile, String reFile) {
		Statement stmt=null;
		int result=0;
		String sql = "insert into review_file values(seq_review_file_no.nextval,'"+oriFile+"','"+reFile+"',"+currval+")";
		System.out.println("insert sql문: "+sql);
		try {
			stmt=conn.createStatement();
			result = stmt.executeUpdate(sql);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
		}return result;
	}
	
	
	public List<ReviewFile> selectImages(Connection conn){
		Statement stmt=null;
		ResultSet rs = null;
		List<ReviewFile> list = new ArrayList();
		String sql = "select * from review_file";
		try {
			stmt = conn.createStatement();
			rs= stmt.executeQuery(sql);
			while(rs.next()) {
				ReviewFile rf = new ReviewFile();
				rf.setrNo(rs.getInt("r_no"));
				rf.setpOriginalFile(rs.getString("r_original_file"));
				rf.setpRenameFile(rs.getString("r_rename_file"));
				list.add(rf);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
			System.out.println(list);
		}return list;
	}

}

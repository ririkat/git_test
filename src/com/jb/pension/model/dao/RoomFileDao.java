package com.jb.pension.model.dao;

import static common.template.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.jb.pension.model.vo.RoomFile;

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
	
	public List<RoomFile> selectRoomFile(Connection conn){
		Statement stmt = null;
		ResultSet rs = null;
		List<RoomFile> list = new ArrayList();
		String sql = "select * from room_file";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				RoomFile rf = new RoomFile();
				rf.setrFileNo(rs.getInt("r_file_no"));
				rf.setrOriginalFile(rs.getString("r_original_file"));
				rf.setrRenameFile(rs.getString("r_rename_file"));
				rf.setrNo(rs.getString("r_no"));
				list.add(rf);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		} return list;
	}
	
	//해당 객실의 사진들 불러오기
	public List<RoomFile> curRoomFiles(Connection conn, String rNo){
		Statement stmt = null;
		ResultSet rs = null;
		List<RoomFile> list = new ArrayList();
		String sql = "select * from room_file where r_no='"+rNo+"'";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				RoomFile rf = new RoomFile();
				rf.setrFileNo(rs.getInt("r_file_no"));
				rf.setrOriginalFile(rs.getString("r_original_file"));
				rf.setrRenameFile(rs.getString("r_rename_file"));
				rf.setrNo(rs.getString("r_no"));
				list.add(rf);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		} return list;
	}
	
}

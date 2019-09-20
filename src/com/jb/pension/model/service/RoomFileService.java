package com.jb.pension.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.jb.pension.model.dao.RoomFileDao;
import com.jb.pension.model.vo.RoomFile;

public class RoomFileService {
	
	private RoomFileDao dao = new RoomFileDao();
	
	public int addImages(int currval, String oriFile, String reFile) {
		Connection conn = getConnection();
		int result = dao.addImages(conn,currval,oriFile,reFile);
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public List<RoomFile> selectRoomFile() {
		Connection conn = getConnection();
		List<RoomFile> list = dao.selectRoomFile(conn);
		close(conn);
		return list;
	}
	
	//해당 객실의 사진들 불러오기
	public List<RoomFile> curRoomFiles(String rNo){
		Connection conn = getConnection();
		List<RoomFile> list = dao.curRoomFiles(conn,rNo);
		close(conn);
		return list;
	}

}

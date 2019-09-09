package com.jb.pension.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.jb.pension.model.dao.RoomDao;
import com.jb.pension.model.vo.Room;

public class RoomService {
	
	private RoomDao dao = new RoomDao();
	
	//전체 객실 수
	public int selectCountRoom() {
		Connection conn = getConnection();
		int count = dao.selectCountRoom(conn);
		close(conn);
		return count;
	}
	
	public List<Room> selectListPage(int cPage, int numPerPage){
		Connection conn = getConnection();
		List<Room> list = dao.selectListPage(conn,cPage,numPerPage);
		close(conn);
		return list;
	}
	

}

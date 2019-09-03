package com.jb.master.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.jb.master.model.dao.MasterDao;
import com.jb.owner.model.vo.Owner;;

public class MasterService {
	private MasterDao dao = new MasterDao();
	
	public int selectCountOwner() {
		Connection conn = getConnection();
		int count= dao.selectCountOwner(conn);
		close(conn);
		return count;
	}
	
	public List<Owner> selectListPage(int cPage, int numPerPage){
		Connection conn =getConnection();
		List<Owner> list=dao.selectListPage(conn,cPage,numPerPage);
		close(conn);
		return list;
		
	}
	
	
}

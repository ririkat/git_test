package com.jb.owner.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.jb.owner.model.dao.OwnerDao;
import com.jb.owner.model.vo.Owner;

public class OwnerService {
	private OwnerDao dao = new OwnerDao();
	
	
	
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
	
	public Owner selectOwnerOne(String oId) {
		Connection conn = getConnection();
		Owner o = dao.selectOwnerOne(conn, oId);
		close(conn);
		return o;
	}

}

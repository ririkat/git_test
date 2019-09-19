package com.jb.search.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.jb.pension.model.vo.Pension;
import com.jb.pension.model.vo.Room;
import com.jb.search.model.dao.SearchDao;

public class SearchService {
	
	private SearchDao dao = new SearchDao();
	
	public List<Pension> loadPenList(){
		Connection conn=getConnection();
		List<Pension> list=dao.loadPenList(conn);
		
		close(conn);
		return list;
	}

	public List<Pension> findPension(String keyword,String area,String[] pFac,String[] rFac) {
		Connection conn=getConnection();
		List<Pension> list=dao.findPension(conn,keyword,area,pFac,rFac);
		
		close(conn);
		return list;
	}

	public Pension selectDetail(String pCode) {
		Connection conn=getConnection();
		Pension p=dao.selectDetail(conn,pCode);
		
		close(conn);
		return p;
	}

}

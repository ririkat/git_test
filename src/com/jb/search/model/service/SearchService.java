package com.jb.search.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.rollback;
import static common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.jb.pension.model.vo.Pension;
import com.jb.search.model.dao.SearchDao;

public class SearchService {
	
	private SearchDao dao = new SearchDao();
	
	public List<Pension> loadPenList(){
		Connection conn=getConnection();
		List<Pension> list=dao.loadPenList(conn);
		
		close(conn);
		return list;
	}

	public List<Pension> findPension(String keyword,String area,String[] pFac,String[] rFac, int nop) {
		Connection conn=getConnection();
		List<Pension> list=dao.findPension(conn,keyword,area,pFac,rFac,nop);
		close(conn);
		return list;
	}

	public Pension selectDetail(String pCode) {
		Connection conn=getConnection();
		Pension p=dao.selectDetail(conn,pCode);
		
		close(conn);
		return p;
	}
	
	////test///
	public int insertAdd(String addr, Double y, Double x) {
		Connection conn=getConnection();
		int result = dao.insertAdd(conn,addr,y,x);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

}

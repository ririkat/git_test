package com.jb.pension.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.jb.pension.model.dao.PensionDao;
import com.jb.pension.model.vo.Pension;

public class PensionService {
	
	private PensionDao dao = new PensionDao();

	//전체 펜션 수
	public int selectCountPension() {
		Connection conn = getConnection();
		int count = dao.selectCountPension(conn);
		close(conn);
		return count;
	}
	
	public List<Pension> selectListPage(int cPage, int numPerPage){
		Connection conn = getConnection();
		List<Pension> list = dao.selectListPage(conn,cPage,numPerPage);
		close(conn);
		return list;
	}
}

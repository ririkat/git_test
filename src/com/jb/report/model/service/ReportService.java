package com.jb.report.model.service;

import static common.template.JDBCTemplate.getConnection;

import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.rollback;
import static common.template.JDBCTemplate.close;

import java.sql.Connection;
import java.util.List;

import com.jb.board.model.vo.Board;
import com.jb.report.model.dao.ReportDao;
import com.jb.report.model.vo.Report;

public class ReportService {
	private ReportDao dao=new ReportDao();

	public int insertReport(Report r) {
		Connection conn=getConnection();
		int result=dao.insertReport(conn, r);
		
		if(result>0) commit(conn);
		else rollback(conn);
		
		close(conn);
		return result;
		
		
	}

	public int selectCountReport() {
		Connection conn=getConnection();
		int result=dao.selectCountReport(conn);
		close(conn);
		return result;
	}

	public List<Report> selectReport(int cPage, int numPerPage) {
		Connection conn=getConnection();
		List<Report> list=dao.selectReport(conn, cPage, numPerPage);
		close(conn);
		return list;
	}

	public Report selectReportOne(int repNo) {
		Connection conn=getConnection();
		Report r=dao.selectReportOne(conn, repNo);
		close(conn);
		return r;
	}

	public int deleteReport(int repNo) {
		Connection conn=getConnection();
		int result=dao.deleteReport(conn, repNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

}

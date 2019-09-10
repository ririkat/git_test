package com.jb.faq.model.service;

import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.jb.faq.model.dao.FaqDao;
import com.jb.faq.model.vo.Faq;
import static common.template.JDBCTemplate.close;


public class FaqService {
	private FaqDao dao = new FaqDao();
	
	public int selectFaqCount() {
		Connection conn=getConnection();
		int result = dao.selectFaqCount(conn);
		close(conn);
		return result;
	}
	
	public List<Faq> selectFaqList(int cPage, int numPerPage){
		Connection conn=getConnection();
		List<Faq> list = dao.selectFaqList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}
	
	public int insertFaq(Faq f) {
		Connection conn=getConnection();
		int result=dao.insertFaq(conn,f);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public Faq selectFaqOne(int no) {
		Connection conn=getConnection();
		Faq f = dao.selectFaqOne(conn,no);
		close(conn);
		return f;
	}
	
	public Faq selectFaqOne(int no, boolean hasRead) {
		Connection conn=getConnection();
		if(!hasRead) {
//			int result=dao.updateCount(conn,no);
//			if(result>0) {
//				commit(conn);
//			}else {
//				rollback(conn);
//			}
		}
		Faq f = dao.selectFaqOne(conn,no);
		close(conn);
		return f;		
	}

}

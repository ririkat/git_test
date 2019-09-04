package com.jb.notice.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.rollback;
import static common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.jb.notice.model.dao.NoticeDao;
import com.jb.notice.model.vo.Notice;

public class NoticeService {
	private NoticeDao dao = new NoticeDao();
	
	public int selectNoticeCount() {
		Connection conn = getConnection();
		int result=dao.selectNoticeCount(conn);
		close(conn);
		return result;
	}
	
	public List<Notice> selectNoticeList(int cPage, int numPerPage){
		Connection conn = getConnection();
		List<Notice> list=dao.selectNoticeList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}
	
	public Notice selectNoticeOne(int no) {
		Connection conn=getConnection();
		Notice n = dao.selectNoticeOne(conn,no);
		close(conn);
		return n;
	}
	
	public int insertNotice(Notice n) {
		Connection conn=getConnection();
		int result = dao.insertNotice(conn,n);
		if(result>0) {
			commit(conn);
			result=dao.selectSeqNotice(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

}

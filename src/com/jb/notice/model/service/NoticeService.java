package com.jb.notice.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import com.jb.notice.model.dao.NoticeDao;
import com.jb.notice.model.vo.Notice;
import com.jb.notice.model.vo.NoticeComment;

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
	
	public Notice selectNoticeOne(int no,boolean hasRead) {
		Connection conn=getConnection();
		if(!hasRead) {//읽은 적 없을 때만 조회수 카운트 올려줌
			int result=dao.updateCount(conn,no);
			if(result>0) {
				commit(conn);
			}else {
				rollback(conn);
			}
		}
			
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
	
	public int updateNotice(Notice n) {
		Connection conn=getConnection();
		int result=dao.updateNotice(conn,n);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}
	
	public int deleteNoticeOne(int no) {
		Connection conn=getConnection();
		int result=dao.deleteNoticeOne(conn,no);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}
	
	public List<Notice> selectNoticeFinder(int cPage,int numPerPage,String keyword) {
		Connection conn=getConnection();
		List<Notice> list = dao.selectNoticeFinder(conn,cPage,numPerPage,keyword);
		close(conn);
		return list;
	}
	
	public int insertComment(NoticeComment nc) {
		Connection conn=getConnection();
		int result=dao.insertComment(conn, nc);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}
	
	
	public List<NoticeComment> selectNoticeComment(int no){
		Connection conn=getConnection();
		List<NoticeComment> list=dao.selectNoticeComment(conn,no);
		close(conn);
		return list;
	}
	


}

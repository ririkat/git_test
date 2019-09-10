package com.jb.board.model.service;

import static common.template.JDBCTemplate.getConnection;

import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.rollback;
import static common.template.JDBCTemplate.close;

import java.sql.Connection;
import java.util.List;

import com.jb.board.model.dao.BoardDao;
import com.jb.board.model.vo.Board;
import com.jb.board.model.vo.BoardComment;

public class BoardService {
	private BoardDao dao = new BoardDao();

	public int selectCountBoard() {
		// TODO Auto-generated method stub
		Connection conn=getConnection();
		int result=dao.selectCountBoard(conn);
		close(conn);
		return result;
	}

	public List<Board> selectBoard(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		Connection conn=getConnection();
		List<Board> list=dao.selectBoard(conn, cPage, numPerPage);
		close(conn);
		return list;
	}

	public int insertBoard(Board b) {
		Connection conn=getConnection();
		int result=dao.insertBoard(conn, b);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}
	
	
//	조회수 아직수정중.. 야마터져양
	public Board selectBoard(String bNo, boolean hasRead) {
		Connection conn=getConnection();
//		Board b=dao.selectBoard(conn, bNo);
		
		close(conn);
		return null;
	}

	public Board selectBoardOne(int bNo) {
		Connection conn=getConnection();
		Board b=dao.selectBoardOne(conn, bNo);
		close(conn);
		return b;
	}

	public int deleteBoard(int bNo) {
		Connection conn=getConnection();
		int result=dao.deleteBoard(conn, bNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int updateBoard(Board b) {
		Connection conn=getConnection();
		int result=dao.updateBoard(conn, b);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int insertComment(BoardComment bc) {
		Connection conn=getConnection();
		int result=dao.insertComment(conn, bc);
		
		if(result>0) commit(conn);
		else rollback(conn);
		
		close(conn);
		return result;
	}

	public int deleteComment(int bNo, int coNo) {
		Connection conn=getConnection();
		int result=dao.deleteComment(conn, bNo, coNo);
		
		if(result>0) commit(conn);
		else rollback(conn);
		
		close(conn);
		return result;
	}

	public List<BoardComment> selectBoardComment(int bNo) {
		Connection conn=getConnection();
		List<BoardComment> list=dao.selectBoardComment(conn, bNo);
		close(conn);
		return list;
	}

	

}

package com.jb.board.model.service;

import static common.template.JDBCTemplate.getConnection;

import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.rollback;
import static common.template.JDBCTemplate.close;

import java.sql.Connection;
import java.util.List;

import com.jb.board.model.dao.BoardDao;
import com.jb.board.model.vo.Board;

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

}

package com.jb.board.model.service;

import static common.template.JDBCTemplate.getConnection;
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
		List<Board> list=dao.selectNotice(conn, cPage, numPerPage);
		close(conn);
		return null;
	}

}

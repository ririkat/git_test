package com.jb.client.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.jb.client.model.dao.ClientDao;
import com.jb.client.model.vo.Client;

public class ClientService {

	private ClientDao dao = new ClientDao();

	public Client selectId(String id, String pw) {
		Connection conn = getConnection();
		Client c = dao.selectId(conn, id, pw);
		close(conn);
		return c;
	}
	
	public int updateClient(Client c){
		Connection conn=getConnection();
		int result= dao.updateClient(conn,c);
		close(conn);
		return result;
	}
	
	//전체 일반회원 수
	public int selectCountClient() {
		Connection conn = getConnection();
		int count = dao.selectCountClient(conn);
		close(conn);
		return count;
	}
	
	public List<Client> selectListPage(int cPage, int numPerPage){
		Connection conn = getConnection();
		List<Client> list = dao.selectListPage(conn,cPage,numPerPage);
		close(conn);
		return list;
	}
	
	//오버로딩
	//일반회원 검색
	public int selectCountClient(String type, String keyword) {
		Connection conn = getConnection();
		int result = dao.selectCountClient(conn,type,keyword);
		close(conn);
		return result;
	}
	
	public List<Client> selectClientList(String type, String keyword, int cPage, int numPerPage){
		Connection conn = getConnection();
		List<Client> list = dao.selectClientList(conn,type,keyword,cPage,numPerPage);
		close(conn);
		return list;
	}

	public int deleteClient(String id, String pw) {
		Connection conn = getConnection();
		int result = dao.deleteClient(conn, id,pw);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;

	}
}

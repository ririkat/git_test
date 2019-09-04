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
	
	public int updatePassword(String cId, String cPw, String cPwNew) {
		Connection conn = getConnection();
		
		Client c = dao.selectId(conn, cId, cPw);
		int result = 0;
		if (c != null) {
			
			result = dao.updatePassword(conn, cId, cPwNew);
		} else {
			
			result = -1;
			
			
		}
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
}

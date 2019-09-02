package com.jb.client.model.service;

import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.close;

import java.sql.Connection;
import java.util.List;

import com.jb.client.model.dao.ClientDao;
import com.jb.client.model.vo.Client;

public class ClientService {
	
	private ClientDao dao = new ClientDao();
	
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

}

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

}

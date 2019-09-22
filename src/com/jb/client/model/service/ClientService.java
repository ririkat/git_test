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
		System.out.println("selectId return c :"+c);
		close(conn);
		return c;
	}

	public int updateClient(Client c) {
		Connection conn = getConnection();
		int result = dao.updateClient(conn, c);
		close(conn);
		return result;
	}

	// 전체 일반회원 수
	public int selectCountClient() {
		Connection conn = getConnection();
		int count = dao.selectCountClient(conn);
		close(conn);
		return count;
	}

	public List<Client> selectListPage(int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Client> list = dao.selectListPage(conn, cPage, numPerPage);
		close(conn);
		return list;
	}

	// 오버로딩
	// 일반회원 검색 (수)
	public int selectCountClient(String type, String keyword) {
		Connection conn = getConnection();
		int result = dao.selectCountClient(conn, type, keyword);
		close(conn);
		return result;
	}

	// 블랙리스트 검색 (수)
	public int selectCountForBlack(String type, String keyword) {
		Connection conn = getConnection();
		int result = dao.selectCountForBlack(conn, type, keyword);
		close(conn);
		return result;
	}

	// 일반회원 검색 (리스트)
	public List<Client> selectClientList(String type, String keyword, int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Client> list = dao.selectClientList(conn, type, keyword, cPage, numPerPage);
		close(conn);
		return list;
	}

	// 블랙리스트 검색 (리스트)
	public List<Client> selectBlackList(String type, String keyword, int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Client> list = dao.selectBlackList(conn, type, keyword, cPage, numPerPage);
		close(conn);
		return list;
	}

	public int deleteClient(String id) {
		Connection conn = getConnection();
		int result = dao.deleteClient(conn, id);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	// 회원가입
	public int insertClient(Client c) {
		Connection conn = getConnection();
		int result = dao.insertClient(conn, c);
		if (result > 0) {
			commit(conn);

		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	// 관리자 회원 삭제
	// 보완할 점 : 관리자인지 확인
	public int deleteClientList(String delList) {
		Connection conn = getConnection();
		int result = dao.deleteClientList(conn, delList);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	// 중복체크

	public boolean selectCheckId(String id) {
		Connection conn = getConnection();
		boolean result = dao.selectCheckId(conn, id);
		close(conn);
		return result;
	}

	public int updatePassword(String cId, String cPwNew) {
		Connection conn = getConnection();
	
		int result = dao.updatePassword(conn, cId, cPwNew);

		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	// 아이디찾기
	public Client findId(String name, String email) {
		Connection conn = getConnection();
		Client c = dao.findId(conn, name, email);
		close(conn);
		return c;
	}

	public Client selectClient(String cId) {
		Connection conn = getConnection();
		Client c = dao.selectClient(conn, cId);
		close(conn);
		return c;
	}

	public Client findEmail(String uid) {
		Connection conn=getConnection();
		Client c=dao.findEmail(conn, uid);
		close(conn);
		return c;
	}

	public int clientReport(Client c) {
		Connection conn = getConnection();
		int result = dao.clientReport(conn, c);
		
		if (result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		return result;
	}


}

package com.jb.pension.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.jb.pension.model.dao.PensionFileDao;
import com.jb.pension.model.vo.PensionFile;

public class PensionFileService {
	
	private PensionFileDao dao = new PensionFileDao();
	
	public int addImages(int currval, String oriFile, String reFile) {
		Connection conn = getConnection();
		int result = dao.addImages(conn,currval,oriFile,reFile);
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public List<PensionFile> selectImages(){
		Connection conn = getConnection();
		List<PensionFile> list = dao.selectImages(conn);
		close(conn);
		return list;
	}
	
	public PensionFile selectImages(String pCode){
		Connection conn = getConnection();
		PensionFile pf = dao.selectImages(conn,pCode);
		close(conn);
		return pf;
	}
	
	public int modifyImages(String pCode, String oriFile, String reFile) {
		Connection conn = getConnection();
		int result = dao.modifyImages(conn,pCode,oriFile,reFile);
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

}

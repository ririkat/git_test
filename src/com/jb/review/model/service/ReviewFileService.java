package com.jb.review.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.jb.review.model.dao.ReviewFileDao;
import com.jb.review.model.vo.ReviewFile;

public class ReviewFileService {
	private ReviewFileDao dao = new ReviewFileDao();
	
	public int addImages(int currval, String oriFile, String reFile) {
		Connection conn = getConnection();
		int result= dao.addImages(conn,currval,oriFile,reFile);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public List<ReviewFile> selectImages(){
		Connection conn = getConnection();
		List<ReviewFile> list = dao.selectImages(conn);
		close(conn);
		return list;
	}

}

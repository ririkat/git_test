package com.jb.review.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import com.jb.review.model.dao.ReviewDao;
import com.jb.review.model.vo.Review;

public class ReviewService {
	private ReviewDao dao = new ReviewDao();
	
	//전체리뷰수
	public int selectReviewCount() {
		Connection conn = getConnection();
		int result = dao.selectReviewCount(conn);
		close(conn);
		return result;		
	}
	
	//리뷰 조회
	public List<Review> selectReviewList(int cPage, int numPerPage){
		Connection conn = getConnection();
		List<Review> list = dao.selectReviewList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}
	
	//업주의 펜션에 대한 전체리뷰수
	public int selectMyPensionReviewCount(String pCode) {
		Connection conn = getConnection();
		int result = dao.selectMyPensionReviewCount(conn,pCode);
		close(conn);
		return result;
	}
	
	//업주의 펜션에 대한 리뷰 조회
	public List<Review> selectMyPensionReviewList(String pCode, int cPage, int numPerPage){
		Connection conn = getConnection();
		List<Review> list = dao.selectMyPensionReviewList(conn,pCode,cPage,numPerPage);
		close(conn);
		return list;
	}
	
	public Review selectReviewOne(int rNo, boolean hasRead) {
		Connection conn = getConnection();
		if(!hasRead) {
			int result=dao.updateCount(conn,rNo);
			if(result>0) {
				commit(conn);
			}else {
				rollback(conn);
			}
		}
		Review r = dao.selectReviewOne(conn,rNo);
		close(conn);
		return r;
	}
	
	
	
	//리뷰 작성
	public int writeReview(String title, String writer, String content, String pCode) {
		Connection conn=getConnection();
		int result = dao.writeReview(conn,title,writer,content,pCode);
		if(result>0) {
			commit(conn);
			result= dao.getCurrval(conn);
			if(result>0) {
				commit(conn);
			}
			else {
				rollback(conn);
			}
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	//
	
	
}

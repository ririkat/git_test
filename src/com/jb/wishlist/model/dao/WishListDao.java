package com.jb.wishlist.model.dao;

import static common.template.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.jb.wishlist.model.vo.WishList;

public class WishListDao {
	
	private Properties prop = new Properties();

	public WishListDao() {
		String path=WishListDao.class.getResource("/sql/wishlist/wishlist-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertWishList(Connection conn, WishList w) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertWishList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, w.getpCode());
			pstmt.setString(2, w.getpImage());
			pstmt.setString(3, w.getpName());
			pstmt.setString(4, w.getpAddr());
			pstmt.setString(5, w.getpTel());
			pstmt.setString(6, w.getcId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

}

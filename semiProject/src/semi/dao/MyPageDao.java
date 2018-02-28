package semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import semi.vo.MyPageVo;
import test.dbcp.DbcpBean;

public class MyPageDao {
	private static MyPageDao instance=new MyPageDao();
	private MyPageDao() {}
	public static MyPageDao getInstance() {
		return instance;
	}
	public int scrapAdd(MyPageVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DbcpBean.getConn();
			String sql="insert into scrap values(sno_seq.nextval,?,?,?,sysdate,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getId());
			pstmt.setString(3, vo.getUrl());
			pstmt.setInt(4, vo.getRno());
			return pstmt.executeUpdate();
			
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			DbcpBean.closeConn(conn,pstmt,null);
		}
	}
}

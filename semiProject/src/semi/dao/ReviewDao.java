package semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import semi.jdbc.DBConnection;

public class ReviewDao {
	// ��ü���� ���� ���ϱ�(����¡ ó���ϱ� ���� �ʿ�)
	public int getCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getConn();
			String sql = "select NVL(count(rno),0) cnt from review";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			int cnt = rs.getInt("cnt");
			return cnt;
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		} finally {
			DBConnection.closeConn(conn, pstmt, rs);
		}

	}
}

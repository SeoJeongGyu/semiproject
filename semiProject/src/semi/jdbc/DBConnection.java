package semi.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnection {
	public static Connection getConn() throws SQLException{
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url="jdbc:oracle:thin:@hta-semi.ccj7sezd6lnl.us-east-2.rds.amazonaws.com:1521:orcl";
			conn = DriverManager.getConnection(url,"scott","tiger");
			return conn;
		}catch(ClassNotFoundException ce) {
			System.out.println("드라이버 로딩에 실패하였습니다" + ce.getMessage());
		}
		return conn;
	}
	
	public static void closeConn(Connection conn) {
		try {
			if (conn!=null) {
				conn.close();
			}
		}catch(SQLException se) {
			System.out.println(se.getMessage());
		}
	}
	public static void closeConn(Connection con,Statement stmt,ResultSet rs) {
		try {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(con!=null) con.close();
		}catch(SQLException se) {
			System.out.println(se.getMessage());
		}
	}
}

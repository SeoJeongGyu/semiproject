package semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import semi.vo.SellVo;
import test.dbcp.DbcpBean;

public class SellDao {
	public int updateHit(SellVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=DbcpBean.getConn();
			String sql="update sell set shit=shit+1 where sno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, vo.getSno());
			return pstmt.executeUpdate();
			
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			DbcpBean.closeConn(con, pstmt, null);
		}
	}
	public int delete(int sno) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=DbcpBean.getConn();
			String sql="delete from sell where sno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, sno);
			return pstmt.executeUpdate();
			
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			DbcpBean.closeConn(con, pstmt, null);
		}
	}
	public int insert(SellVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=DbcpBean.getConn();
			String sql="insert into sell values(sell_seq.nextval,?,?,?,?,?,?,?,sysdate,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, vo.getOs());
			pstmt.setInt(2, vo.getTelecom());
			pstmt.setInt(3, vo.getCompany());
			pstmt.setString(4, vo.getLoc());
			pstmt.setInt(5, vo.getPrice());
			pstmt.setString(6, vo.getStitle());
			pstmt.setString(7, vo.getScontent());
			pstmt.setInt(8, vo.getSgrade());
			pstmt.setInt(9, vo.getShit());
			pstmt.setInt(10, vo.getSuccess());
			pstmt.setString(11, vo.getId());
			pstmt.setInt(12, vo.getSreport());
			return pstmt.executeUpdate();
			
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			DbcpBean.closeConn(con, pstmt, null);
		}
	}
	public ArrayList<SellVo> list(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=DbcpBean.getConn();
			//System.out.println("con:"+con);
			String sql="select * from sell";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			ArrayList<SellVo> list=new ArrayList<>();
			while(rs.next()) {
				SellVo vo=new SellVo(rs.getInt("sno"),rs.getInt("os"),rs.getInt("telecom"),
						rs.getInt("company"),rs.getString("loc"),rs.getInt("price"),
						rs.getString("stitle"),rs.getString("scontent"),rs.getDate("sdate"),
						rs.getInt("sgrade"),rs.getInt("shit"),rs.getInt("success"),rs.getString("id"),rs.getInt("sreport"));
				list.add(vo);
			}
			return list;
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return null;
		}finally {
			DbcpBean.closeConn(con, pstmt, rs);
		}
	}
}

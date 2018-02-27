package semi.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import semi.vo.ReviewVo;
import test.dbcp.DbcpBean;

public class ReviewDao {
	private static ReviewDao instance=new ReviewDao();
	private ReviewDao() {}
	public static ReviewDao getInstance() {
		return instance;
	}
	public int getMaxNum() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DbcpBean.getConn();
			String sql = "select NVL(max(rno),0) maxnum from review"; 
																	
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			int maxnum = rs.getInt("maxnum");
			return maxnum;

		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		} finally {
			DbcpBean.closeConn(conn, pstmt, rs);
		}
	}
	
	
	
	public int getCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DbcpBean.getConn();
			String sql="select NVL(count(rno),0) cnt from review";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			int cnt = rs.getInt("cnt");
			return cnt;
		}catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			DbcpBean.closeConn(conn, pstmt, rs);
		}
	}
	public int write(ReviewVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DbcpBean.getConn();
			int reviewNum = getMaxNum() + 1;
			String sql="insert into review values(?,?,?,sysdate,0,?,?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, reviewNum);
			pstmt.setString(2,vo.getRtitle());
			pstmt.setString(3, vo.getRcontent());
			pstmt.setInt(4, vo.getRgrade());
			pstmt.setInt(5, vo.getRreport());
			pstmt.setString(6, vo.getOrgfilename());
			pstmt.setString(7,vo.getSavefilename());
			pstmt.setString(8, vo.getId());
			pstmt.setInt(9, vo.getCompany());
			pstmt.setInt(10, vo.getRecommend());
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			DbcpBean.closeConn(conn, pstmt, null);
		}
		
	}
	public ArrayList<ReviewVo> listAll(int startRow,int endRow){
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		try {
			conn=DbcpBean.getConn();
			String sql="select * from (select aa.*,rownum rnum from(select * from review order by rno desc)aa) where rnum>=? and rnum<=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs=pstmt.executeQuery();
			ArrayList<ReviewVo> list=new ArrayList<>();
			while(rs.next()) {
				ReviewVo vo=new ReviewVo(rs.getInt("rno"),rs.getString("rtitle"),rs.getString("rcontent"),rs.getDate("rdate"),rs.getInt("rhit"),rs.getInt("rgrade"),rs.getInt("rreport"),rs.getString("orgfilename"),rs.getString("savefilename"),rs.getString("id"),rs.getInt("company"),rs.getInt("recommend"));
				list.add(vo);
			}
			return list;
		}catch (SQLException se) {
			System.out.println(se.getMessage());
			return null;
		}finally {
			DbcpBean.closeConn(conn, pstmt, rs);
		}
	}
	public ReviewVo content(int rno) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		try {
			conn=DbcpBean.getConn();
			String sql = "select * from review where rno=?";
			String sql2 = "update review set rhit=rhit+1 where rno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt2= conn.prepareStatement(sql2);
			pstmt.setInt(1, rno);
			pstmt2.setInt(1, rno);
			pstmt2.executeUpdate();
			rs=pstmt.executeQuery();
			if(rs.next()) {
				int rnum=rs.getInt("rno");
				String rtitle=rs.getString("rtitle");
				String rcontent=rs.getString("rcontent");
				Date rdate=rs.getDate("rdate");
				int rhit = rs.getInt("rhit");
				int rgrade=rs.getInt("rgrade");
				int rreport = rs.getInt("rreport");
				String orgfilename = rs.getString("orgfilename");
				String savefilename = rs.getString("savefilename");
				String id=rs.getString("id");
				int company=rs.getInt("company");
				int recommend=rs.getInt("recommend");
				ReviewVo vo=new ReviewVo(rnum, rtitle, rcontent, rdate, rhit, rgrade, rreport, orgfilename, savefilename, id, company,recommend);
				return vo;
			}
		return null;
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return null;
		}finally {
			DbcpBean.closeConn(conn, pstmt, rs);
			DbcpBean.closeConn(null, pstmt2, null);
		}
	}
	
	public int delete(int rno, String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn=DbcpBean.getConn();
			String sql = "delete from review where rno=? and id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			pstmt.setString(2, id);
			return pstmt.executeUpdate();
	}catch(SQLException se) {
		System.out.println(se.getMessage());
		return -1;
	}finally {
		DbcpBean.closeConn(conn, pstmt, rs);
	}
	
		}
	
	public ReviewVo update(int rno) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn=DbcpBean.getConn();
			String sql= "select * from review where rno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				int rnum=rs.getInt("rno");
				String rtitle=rs.getString("rtitle");
				String rcontent=rs.getString("rcontent");
				Date rdate=rs.getDate("rdate");
				int rhit = rs.getInt("rhit");
				int rgrade=rs.getInt("rgrade");
				int rreport = rs.getInt("rreport");
				String orgfilename = rs.getString("orgfilename");
				String savefilename = rs.getString("savefilename");
				String id=rs.getString("id");
				int company=rs.getInt("company");
				int recommend=rs.getInt("recommend");
				ReviewVo vo=new ReviewVo(rnum, rtitle, rcontent, rdate, rhit, rgrade, rreport, orgfilename, savefilename, id, company,recommend);
				return vo;
			}
		return null;
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return null;
		}finally {
			DbcpBean.closeConn(conn, pstmt, rs);
		}
	}
}

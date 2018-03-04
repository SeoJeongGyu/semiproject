package semi.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import semi.vo.ReviewVo;
import semi.vo.SellVo;
import test.dbcp.DbcpBean;

public class ReviewDao {
	private static ReviewDao instance=new ReviewDao();
	private ReviewDao() {}
	public static ReviewDao getInstance() {
		return instance;
	}
	public int getCount(String select ,String text){
        Connection con=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        String sqlplus="";
        if(select.equals("0")) {
            sqlplus="where rtitle like'%"+text+"%'";
        }else if(select.equals("1")) {
            sqlplus="where rcontent like'%"+text+"%'";
        }else if(select.equals("2")) {
            sqlplus="where id like'%"+text+"%'";
        }
        try {
            con=DbcpBean.getConn();
            String sql= "select count(rno) cnt from review "+sqlplus;
            pstmt = con.prepareStatement(sql);
            rs=pstmt.executeQuery();
            rs.next();
            return rs.getInt("cnt");
        } catch (SQLException se) {
            System.out.println(se.getMessage());
            return -1;
        } finally {
            DbcpBean.closeConn(con, pstmt, rs);
        }
    }
	public ArrayList<ReviewVo> reviewList(String select ,String text,int startRow,int endRow){
        Connection con=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        String sqlplus="";
        if(text!=null) {
            if(select.equals("0")) {
                sqlplus=" where rtitle like '%"+text+"%'";
            }else if(select.equals("1")) {
                sqlplus=" where rcontent like '%"+text+"%'";
            }else if(select.equals("2")) {
                sqlplus=" where id like '%"+text+"%'";
            }
        }
        try {
            con=DbcpBean.getConn();
            //System.out.println("con:"+con);
            String sql="select * from (select aa.*,rownum rnum from(select * from review"+sqlplus+" order by rgrade desc , recommend desc , rno desc)aa ) where rnum>=? and rnum<=?";
            System.out.println(sql);
            pstmt=con.prepareStatement(sql);
            pstmt.setInt(1, startRow);
            pstmt.setInt(2, endRow);
            rs=pstmt.executeQuery();
            ArrayList<ReviewVo> list=new ArrayList<>();
            while(rs.next()) {
                ReviewVo vo=new ReviewVo(rs.getInt("rno"),rs.getString("rtitle"),rs.getString("rcontent"),rs.getDate("rdate"),rs.getInt("rhit"),rs.getInt("rgrade"),rs.getString("orgfilename"),rs.getString("savefilename"),rs.getString("id"),rs.getInt("company"),rs.getInt("rreport"),rs.getInt("recommend"));
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
	
	public ArrayList<ReviewVo> reviewList2(String select ,String text,int startRow,int endRow){
        Connection con=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        String sqlplus="";
        if(text!=null) {
            if(select.equals("0")) {
                sqlplus=" where rtitle like '%"+text+"%'";
            }else if(select.equals("1")) {
                sqlplus=" where rcontent like '%"+text+"%'";
            }else if(select.equals("2")) {
                sqlplus=" where id like '%"+text+"%'";
            }
        }
        try {
            con=DbcpBean.getConn();
            //System.out.println("con:"+con);
            String sql="select * from (select aa.*,rownum rnum from(select * from review"+sqlplus+" order by rgrade desc , rno desc)aa ) where rnum>=? and rnum<=?";
            System.out.println(sql);
            pstmt=con.prepareStatement(sql);
            pstmt.setInt(1, startRow);
            pstmt.setInt(2, endRow);
            rs=pstmt.executeQuery();
            ArrayList<ReviewVo> list=new ArrayList<>();
            while(rs.next()) {
                ReviewVo vo=new ReviewVo(rs.getInt("rno"),rs.getString("rtitle"),rs.getString("rcontent"),rs.getDate("rdate"),rs.getInt("rhit"),rs.getInt("rgrade"),rs.getString("orgfilename"),rs.getString("savefilename"),rs.getString("id"),rs.getInt("company"),rs.getInt("rreport"),rs.getInt("recommend"));
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
			pstmt.setString(5, vo.getOrgfilename());
			pstmt.setString(6,vo.getSavefilename());
			pstmt.setString(7, vo.getId());
			pstmt.setInt(8, vo.getCompany());
			pstmt.setInt(9, vo.getRreport());
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
				ReviewVo vo=new ReviewVo(rs.getInt("rno"),rs.getString("rtitle"),rs.getString("rcontent"),rs.getDate("rdate"),rs.getInt("rhit"),rs.getInt("rgrade"),rs.getString("orgfilename"),rs.getString("savefilename"),rs.getString("id"),rs.getInt("company"),rs.getInt("rreport"),rs.getInt("recommend"));
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
	
	public ArrayList<ReviewVo> listmain(){
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		try {
			conn=DbcpBean.getConn();
			String sql="select * from (select aa.*,rownum rnum from(select * from review order by recommend desc)aa) where rnum>=1 and rnum<=3";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			ArrayList<ReviewVo> list=new ArrayList<>();
			while(rs.next()) {
				ReviewVo vo=new ReviewVo(rs.getInt("rno"),rs.getString("rtitle"),rs.getString("rcontent"),rs.getDate("rdate"),rs.getInt("rhit"),rs.getInt("rgrade"),rs.getString("orgfilename"),rs.getString("savefilename"),rs.getString("id"),rs.getInt("company"),rs.getInt("rreport"),rs.getInt("recommend"));
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
				String orgfilename = rs.getString("orgfilename");
				String savefilename = rs.getString("savefilename");
				String id=rs.getString("id");
				int company=rs.getInt("company");
				int rreport = rs.getInt("rreport");
				int recommend = rs.getInt("recommend");
				ReviewVo vo=new ReviewVo(rnum, rtitle, rcontent, rdate, rhit, rgrade, orgfilename, savefilename, id, company,rreport,recommend);
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
				String orgfilename = rs.getString("orgfilename");
				String savefilename = rs.getString("savefilename");
				String id=rs.getString("id");
				int company=rs.getInt("company");
				int rreport = rs.getInt("rreport");
				int recommend = rs.getInt("recommend");
				ReviewVo vo=new ReviewVo(rnum, rtitle, rcontent, rdate, rhit, rgrade, orgfilename, savefilename, id, company,rreport,recommend);
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
	
	public int getRecommend(int rno) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn=DbcpBean.getConn();
			String sql= "select count(*) from recommend where type='review' and bonum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				int count=rs.getInt("count(*)");
				return count;
			}
			return -1;
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			DbcpBean.closeConn(conn, pstmt, rs);
		}
	}
	
	public int recommend(int rno,String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		
		try {
			conn = DbcpBean.getConn();
			String sql="insert into recommend values(recono_seq.nextval,'review',?,?)";
			String sql2="update review set recommend=recommend+1 where rno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt2=conn.prepareStatement(sql2);
			pstmt.setInt(1, rno);
			pstmt.setString(2, id);
			pstmt2.setInt(1, rno);
			pstmt2.executeQuery();
			return pstmt.executeUpdate();
		
		}catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			DbcpBean.closeConn(conn, pstmt, null);
		}
	}
	
	public int oxrecommend(int rno,String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn=DbcpBean.getConn();
			String sql="select count(*) cnt from recommend where id=? and type='review' and bonum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, rno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int count=rs.getInt("cnt");
				return count;
			}
		return -1;
		}catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			DbcpBean.closeConn(conn, pstmt, rs);
		}
	}
	
	public int getPolice(int rno) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn=DbcpBean.getConn();
			String sql= "select count(*) from report where type='review' and bonum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				int count=rs.getInt("count(*)");
				return count;
			}
			return -1;
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			DbcpBean.closeConn(conn, pstmt, rs);
		}
	}
	
	public int police(int rno,String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		try {
			conn = DbcpBean.getConn();
			String sql="insert into report values(report_seq.nextval,'review',?,?)";
			String sql2="update review set rreport=rreport+1 where rno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt2=conn.prepareStatement(sql2);
			pstmt.setInt(1, rno);
			pstmt.setString(2, id);
			pstmt2.setInt(1, rno);
			pstmt2.executeQuery();
			return pstmt.executeUpdate();
		
		}catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			DbcpBean.closeConn(conn, pstmt, null);
		}
	}
	
	public int oxpolice(int rno,String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn=DbcpBean.getConn();
			String sql="select count(*) cnt from report where id=? and type='review' and bonum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, rno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int count=rs.getInt("cnt");
				return count;
			}
		return -1;
		}catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			DbcpBean.closeConn(conn, pstmt, rs);
		}
	}
	public int update(ReviewVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DbcpBean.getConn();
		
			String sql="update review set rtitle=?,rcontent=?,orgfilename=?,savefilename=?,company=? where id=? and rno=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,vo.getRtitle());
			pstmt.setString(2, vo.getRcontent());
			pstmt.setString(3, vo.getOrgfilename());
			pstmt.setString(4,vo.getSavefilename());
			pstmt.setInt(5, vo.getCompany());
			pstmt.setString(6, vo.getId());
			pstmt.setInt(7, vo.getRno());
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			DbcpBean.closeConn(conn, pstmt, null);
		}
		
	}
}

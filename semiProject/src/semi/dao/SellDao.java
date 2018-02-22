package semi.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import semi.vo.SellVo;
import test.dbcp.DbcpBean;

public class SellDao {
	
	private static SellDao instance=new SellDao();
	private SellDao() {}
	public static SellDao getInstance() {
		return instance;
	}
	
	public SellVo detail(int sno) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=DbcpBean.getConn();
			String sql="select * from sell where sno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, sno);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				int os=rs.getInt("os");
				int telecom=rs.getInt("telecom");
				int company=rs.getInt("company");
				String loc=rs.getString("loc");
				int price=rs.getInt("price");
				String stitle=rs.getString("stitle");
				String scontent=rs.getString("scontent");
				Date sdate=rs.getDate("sdate");
				int shit=rs.getInt("shit");
				int success=rs.getInt("success");
				String id=rs.getString("id");
				
				SellVo vo=new SellVo(sno, os, telecom, company, loc, price, stitle, scontent, sdate, 0, shit, success, 0, id);
				return vo;
			}else {
				return null;
			}
			
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return null;
		}finally {
			DbcpBean.closeConn(con, pstmt, rs);
		}	
	}
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
			pstmt.setInt(11, vo.getSreport());
			pstmt.setString(12, vo.getId());
			return pstmt.executeUpdate();
			
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			DbcpBean.closeConn(con, pstmt, null);
		}
	}
	public int getCount() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=DbcpBean.getConn();
			String sql="select NVL(count(sno),0) cnt from sell";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			rs.next();
			int cnt=rs.getInt("cnt");
			return cnt;
			
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			DbcpBean.closeConn(con, pstmt, rs);
		}
	}
	public int getCount(String select ,String text) {
        Connection con=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        String sqlplus="";
        if(select.equals("0")) {
            sqlplus="where stitle like'%"+text+"%'";
        }else if(select.equals("1")) {
            sqlplus="where scontent like'%"+text+"%'";
        }else if(select.equals("2")) {
            sqlplus="where id like'%"+text+"%'";
        }
        try {
            con=DbcpBean.getConn();
            String sql="select NVL(count(sno),0) cnt from sell"+sqlplus;
            pstmt=con.prepareStatement(sql);
            rs=pstmt.executeQuery();
            rs.next();
            int cnt=rs.getInt("cnt");
            return cnt;
            
        }catch(SQLException se) {
            System.out.println(se.getMessage());
            return -1;
        }finally {
            DbcpBean.closeConn(con, pstmt, rs);
        }
    }
	public ArrayList<SellVo> list(int startRow,int endRow){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=DbcpBean.getConn();
			//System.out.println("con:"+con);
			String sql="select * from (select aa.*,rownum rnum from(select * from sell order by sno desc)aa ) where rnum>=? and rnum<=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs=pstmt.executeQuery();
			ArrayList<SellVo> list=new ArrayList<>();
			while(rs.next()) {
				SellVo vo=new SellVo(rs.getInt("sno"),rs.getInt("os"),rs.getInt("telecom"),
						rs.getInt("company"),rs.getString("loc"),rs.getInt("price"),
						rs.getString("stitle"),rs.getString("scontent"),rs.getDate("sdate"),
						rs.getInt("sgrade"),rs.getInt("shit"),rs.getInt("success"),rs.getInt("sreport"),rs.getString("id"));
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
	public ArrayList<SellVo> searchlist(String select ,String text,int startRow,int endRow){
        Connection con=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        String sqlplus="";
        if(select.equals("0")) {
            sqlplus="where stitle like'%"+text+"%'";
        }else if(select.equals("1")) {
            sqlplus="where scontent like'%"+text+"%'";
        }else if(select.equals("2")) {
            sqlplus="where id like'%"+text+"%'";
        }
        try {
            con=DbcpBean.getConn();
            //System.out.println("con:"+con);
            String sql="select * from (select aa.*,rownum rnum from(select * from sell"+sqlplus+" order by sno desc)aa ) where rnum>=? and rnum<=?";
            pstmt=con.prepareStatement(sql);
            pstmt.setInt(1, startRow);
            pstmt.setInt(2, endRow);
            rs=pstmt.executeQuery();
            ArrayList<SellVo> list=new ArrayList<>();
            while(rs.next()) {
                SellVo vo=new SellVo(rs.getInt("sno"),rs.getInt("os"),rs.getInt("telecom"),
                        rs.getInt("company"),rs.getString("loc"),rs.getInt("price"),
                        rs.getString("stitle"),rs.getString("scontent"),rs.getDate("sdate"),
                        rs.getInt("sgrade"),rs.getInt("shit"),rs.getInt("success"),rs.getInt("sreport"),rs.getString("id"));
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

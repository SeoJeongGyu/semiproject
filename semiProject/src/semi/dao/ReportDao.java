package semi.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import semi.vo.MemberVo;
import semi.vo.NoticesVo;
import semi.vo.ReviewVo;
import semi.vo.SellVo;
import test.dbcp.DbcpBean;

public class ReportDao {
    private static ReportDao instance  = new ReportDao();
    private ReportDao() {}
    public static ReportDao getInstance() {
        return instance;
    }
    public SellVo sellDetail(int sno) {
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
    public int sellDelete(String sql) {
        Connection con=null;
        PreparedStatement pstmt=null;
        try {
            con=DbcpBean.getConn();
            System.out.println("1");
            pstmt=con.prepareStatement(sql);
            System.out.println("2");
            int n = pstmt.executeUpdate();
            System.out.println("3");
            return n;
        } catch (SQLException se) {
            System.out.println(se.getMessage());
            return -1;
        }finally {
            DbcpBean.closeConn(con, pstmt, null);
        }
    }
    
    public int sellGetMax() {
        Connection con=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        try {
            con=DbcpBean.getConn();
            String sql="select NVL(count(sno),0) cnt from sell where sreport > 4";
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
    public ArrayList<SellVo> sellReport(int startRow,int endRow){
        Connection con=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        try {
            con=DbcpBean.getConn();
            //System.out.println("con:"+con);
            String sql="select * from (select aa.*,rownum rnum from(select * from sell where sreport>4 order by sno desc)aa ) where rnum>=? and rnum<=?";
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
    public ArrayList<ReviewVo> ReviewReport(int startRow,int endRow){
        Connection conn = null;
        PreparedStatement pstmt=null;
        ResultSet rs= null;
        try {
            conn=DbcpBean.getConn();
            String sql="select * from (select aa.*,rownum rnum from(select * from review where rreport > 4 order by rno desc)aa) where rnum>=? and rnum<=?";
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
    public int reviewGetMax() {
        Connection con=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        try {
            con=DbcpBean.getConn();
            String sql="select NVL(count(rno),0) cnt from review where rreport > 4";
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
    
   
    
    public ArrayList<SellVo>SellReport(int startRow,int endRow){
        Connection con=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        try {
            con=DbcpBean.getConn();
            String sql= "select * from(" + 
                    "  select aa.*,rownum rnum from (" + 
                    "   select * from sell where sreport>4"+
                    "        order by regdate desc" + 
                    "   )aa" + 
                    ") where rnum>=? and rnum<=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, startRow);
            pstmt.setInt(2, endRow);
            rs=pstmt.executeQuery();
            ArrayList<SellVo> list =new  ArrayList<SellVo>();
            while(rs.next()) {
                SellVo vo=new SellVo(rs.getInt("sno"),rs.getInt("os"),rs.getInt("telecom"),
                        rs.getInt("company"),rs.getString("loc"),rs.getInt("price"),
                        rs.getString("stitle"),rs.getString("scontent"),rs.getDate("sdate"),
                        rs.getInt("sgrade"),rs.getInt("shit"),rs.getInt("success"),rs.getInt("sreport"),rs.getString("id"));
                list.add(vo);
            }
            return list;
        } catch (SQLException se) {
            System.out.println(se.getMessage());
            return null;
        } finally {
            DbcpBean.closeConn(con, pstmt, rs);
        }
    }
    public ReviewVo reviewDetail(int rno) {
        Connection con=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        try {
            con=DbcpBean.getConn();
            String sql="select * from review where rno=?";
            pstmt=con.prepareStatement(sql);
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
    public int reportDelete(String sql) {
        Connection con=null;
        PreparedStatement pstmt=null;
        try {
            con=DbcpBean.getConn();
            System.out.println("1");
            pstmt=con.prepareStatement(sql);
            System.out.println("2");
            int n = pstmt.executeUpdate();
            System.out.println("3");
            return n;
        } catch (SQLException se) {
            System.out.println(se.getMessage());
            return -1;
        }finally {
            DbcpBean.closeConn(con, pstmt, null);
        }
    }
}

package semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import semi.vo.memberVo;
import test.dbcp.DbcpBean;

public class MemberDao {
    private static MemberDao instance=new MemberDao();
    private MemberDao() {}
    public static MemberDao getInstance() {
        return instance;
    }
    public int loginOk(String id,String pwd) {
        Connection con=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        int n=0;
        try {
            con=DbcpBean.getConn();
            String sql = "select * from member where id = ? and pwd = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, pwd);
            rs=pstmt.executeQuery();
            if(rs.next()) {
                n=1;
            }
            return n;
        } catch (SQLException se) {
            System.out.println(se.getMessage());
            return -1;
        } finally {
            DbcpBean.closeConn(con, pstmt, rs);
        }
    }
    public int checkId(String id) {
        Connection con=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        int n=1;
        try {
            con=DbcpBean.getConn();
            String sql = "select * from member where id = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            rs=pstmt.executeQuery();
            if(rs.next()) {
                n=-1;
            }
            return n;
        } catch (SQLException se) {
            System.out.println(se.getMessage());
            return -1;
        } finally {
            DbcpBean.closeConn(con, pstmt, rs);
        }
    }
    public int insert(memberVo vo) {
        Connection con=null;
        PreparedStatement pstmt=null;
        try {
            con=DbcpBean.getConn();
            String sql="insert into member values(?,?,?,?,?,?,sysdate)";
            pstmt=con.prepareStatement(sql);
            pstmt.setString(1, vo.getId());
            pstmt.setString(2, vo.getPwd());
            pstmt.setString(3, vo.getNickname());
            pstmt.setString(4, vo.getName());
            pstmt.setString(5, vo.getPhone());
            pstmt.setString(6, vo.getEmail());
            int n = pstmt.executeUpdate();
            return n;
        } catch (SQLException se) {
            System.out.println(se.getMessage());
            return -1;
        }finally {
            DbcpBean.closeConn(con, pstmt, null);
        }
    }
}

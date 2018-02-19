package semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import semi.vo.ScommentVo;
import test.dbcp.DbcpBean;

public class ScommentDao {
	private static ScommentDao instance=new ScommentDao();
	private ScommentDao() {}
	public static ScommentDao getInstance() {
		return instance;
	}
	
	public int insert(ScommentVo vo) {
		Connection con=null;
		PreparedStatement pstmt1=null;
		PreparedStatement pstmt2=null;
		try {
			con=DbcpBean.getConn();
			//등록된 글번호 얻어오기
			int sno=vo.getSno();
			int scno=vo.getScno();
			int ref=vo.getScref();
			int lev=vo.getSclev();
			int step=vo.getScstep();
			if(scno==0) {//새 글인 경우
				ref=sno;
			}else {//답글인 경우
				String sql="update scomment set step=step+1 where ref=? and step>?";
				pstmt2=con.prepareStatement(sql);
				pstmt2.setInt(1, ref);
				pstmt2.setInt(2, step);
				pstmt2.executeUpdate();
				lev=lev+1;
				step=step+1;
			}
			String sql="insert into scomment values(?,?,?,?,?,0,sysdate,?,?)";
			//System.out.println("boardnum" + boardNum);
			pstmt1=con.prepareStatement(sql);
			pstmt1.setInt(1, vo.getScno());
			pstmt1.setString(2, vo.getSccontent());
			pstmt1.setInt(3,ref);
			pstmt1.setInt(4,lev);
			pstmt1.setInt(5,step);
			return pstmt1.executeUpdate();

		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			DbcpBean.closeConn(null, pstmt2, null);
			DbcpBean.closeConn(con, pstmt1, null);
		}
	}
	
}

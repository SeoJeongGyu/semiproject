package semi.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.dao.ScommentDao;
import semi.vo.ScommentVo;

public class ScommentController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String cmd=req.getParameter("cmd");
		System.out.println("cmd:" + cmd);
		if(cmd.equals("insert")) {
			insert(req,resp);
		}
	}
	private void insert(HttpServletRequest req, HttpServletResponse resp) throws ServletException,IOException {
		//1. �Ķ���ͷ� ���޵� ���� db�� ����
		String id=req.getParameter("id");
		String sccontent=req.getParameter("sccontent");
		ScommentVo vo=new ScommentVo(0, sccontent, 0, 0, 0, 0, null, 0, id);
		//dao�� ���� db�� �����ϱ�
		ScommentDao dao= ScommentDao.getInstance();
		int n=dao.insert(vo);
		//2. ����� xml�� �����ϱ�(������ �̵��ϸ� �ȵ�)
		resp.setContentType("text/xml;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		pw.println("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
		pw.println("<result>");
		if(n>0) {
			pw.println("<code>success</code>");
		}else {
			pw.println("<code>fail</code>");
		}
		pw.println("</result>");
		pw.close();
	}
}

package semi.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.dao.MyPageDao;
import semi.dao.ReviewDao;
import semi.vo.MyPageVo;
@WebServlet("/mypage.do")
public class MyPageController extends HttpServlet{
@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	req.setCharacterEncoding("utf-8");
	resp.setContentType("text/html; charset=utf-8");
	String cmd= req.getParameter("cmd");
	System.out.println(cmd);
	if(cmd.equals("scrap")) {
		scrap(req,resp);
		}
	}
public void scrap(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	String url=(String)req.getSession().getAttribute("url");
	System.out.println(url);
	req.getSession().removeAttribute("url");
	int rno=Integer.parseInt(req.getParameter("rno"));
	String id=req.getParameter("id");
	String title=req.getParameter("rtitle");
	
	MyPageVo vo = new MyPageVo(0, title, id, url, null,rno);
	int n=MyPageDao.getInstance().scrapAdd(vo);
	if(n>0) {
		url = url+"&result=ScrapSuccess";
		resp.sendRedirect(url);
	}
	
	
	}

}

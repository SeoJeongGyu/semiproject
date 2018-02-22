package semi.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import semi.dao.ScommentDao;
import semi.dao.SellDao;
import semi.vo.ScommentVo;
import semi.vo.SellVo;

@WebServlet("/sell.do")
public class SellController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String cmd = req.getParameter("cmd");
		//System.out.println("cmd:"+cmd);
		String context=req.getContextPath();
		String id=(String)req.getSession().getAttribute("id");
		if(cmd.equals("sellList")) {
			list(req,resp);
        }else if(cmd.equals("insert") && id!=null) {
        	req.setAttribute("page", "/sell/insert.jsp");
        	req.getRequestDispatcher("/main.jsp").forward(req, resp);
        }else if(cmd.equals("insertOk")) {
        	insertOk(req,resp);
        }else if(cmd.equals("sdetail")) {
        	detail(req,resp);
        }
	}
	
	private void detail(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException{
		int sno=Integer.parseInt(req.getParameter("sno"));
		
		SellDao dao=SellDao.getInstance();
		SellVo vo=dao.detail(sno);
		dao.updateHit(vo);
		req.setAttribute("vo", vo);
		req.setAttribute("page", "sell/sdetail.jsp");
		req.getRequestDispatcher("/main.jsp").forward(req, resp);
		
	}
	private void insertOk(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException{
		String id=(String)req.getSession().getAttribute("id");
		int os = Integer.parseInt(req.getParameter("os"));
		int telecom = Integer.parseInt(req.getParameter("telecom"));
		//System.out.println("¿Ô´Ù"+ telecom);
		int company = Integer.parseInt(req.getParameter("company"));
		String loc = req.getParameter("loc");
		int price = Integer.parseInt(req.getParameter("price"));
		String stitle = req.getParameter("stitle");
		String scontent = req.getParameter("scontent");
		int success=Integer.parseInt(req.getParameter("success"));
		
		SellVo vo=new SellVo(0, os, telecom, company, loc, price, stitle, scontent, null, 0, 0, success,0,id);
		SellDao dao=SellDao.getInstance();
		int n=dao.insert(vo);
		//System.out.println("n:"+ n);
		if(n>0) {
			req.setAttribute("page", "/sell.do?cmd=sellList");
			req.getRequestDispatcher("/main.jsp").forward(req, resp);
		}else {
			
		}
	}
	private void list(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException{
		SellDao dao=SellDao.getInstance();
		
		String spageNum=req.getParameter("pageNum");
		int pageNum=1;
		if(spageNum!=null) {
			pageNum=Integer.parseInt(spageNum);
		}
		
		int startRow=(pageNum-1)*10+1;
		int endRow=startRow+9;
	
		ArrayList<SellVo> slist=dao.list(startRow,endRow);
		
		int pageCount=(int)Math.ceil(dao.getCount()/10.0);
		
		int startPage = ((pageNum-1)/5)*5 + 1 ; 
		int endPage = startPage + 4; 
		if(pageCount<endPage) {
			endPage=pageCount;
		}
			
		req.setAttribute("slist", slist);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("page", "/sell/sellList.jsp");
		req.getRequestDispatcher("/main.jsp").forward(req, resp);
		
	}
	
}

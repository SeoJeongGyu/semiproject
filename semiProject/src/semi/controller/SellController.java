package semi.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.dao.SellDao;
import semi.vo.SellVo;

@WebServlet("/sell.do")
public class SellController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String cmd = req.getParameter("cmd");
		//System.out.println("cmd:"+cmd);
		String context=req.getContextPath();
		if(cmd.equals("sellList")) {
			list(req,resp);
        }else if(cmd.equals("insert")) {
        	req.setAttribute("page", "/sell/insert.jsp");
        	req.getRequestDispatcher("/main.jsp").forward(req, resp);
        }else if(cmd.equals("insertOk")) {
        	insertOk(req,resp);
        }
	}
	private void insertOk(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException{
		int os = Integer.parseInt(req.getParameter("os"));
		int telecom = Integer.parseInt(req.getParameter("telecom"));
		//System.out.println("¿Ô´Ù"+ telecom);
		int company = Integer.parseInt(req.getParameter("company"));
		String loc = req.getParameter("loc");
		int price = Integer.parseInt(req.getParameter("price"));
		String stitle = req.getParameter("stitle");
		String scontent = req.getParameter("scontent");
		
		SellVo vo=new SellVo(0, os, telecom, company, loc, price, stitle, scontent, null, 0, 0, 0, "aaa",0);
		SellDao dao=new SellDao();
		int n=dao.insert(vo);
		//System.out.println("n:"+ n);
		if(n>0) {
			req.setAttribute("page", "/sell/sellList.jsp");
			req.getRequestDispatcher("/main.jsp").forward(req, resp);
		}else {
			
		}
	}
	
	private void list(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException{
		SellDao dao=new SellDao();
		ArrayList<SellVo> slist=dao.list();
		req.setAttribute("slist", slist);	
		req.setAttribute("page", "/sell/sellList.jsp");
		RequestDispatcher rd=req.getRequestDispatcher("/main.jsp");
		rd.forward(req, resp);
	}
	
}

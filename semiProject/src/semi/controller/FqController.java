package semi.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.dao.BuyDao;
import semi.dao.FqboardDao;
import semi.vo.BuyVo;
import semi.vo.FqboardVo;

@WebServlet("/fq.do")
public class FqController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String cmd = req.getParameter("cmd");
		System.out.println("fqcmd:"+cmd);
		//String context=req.getContextPath();
		String id=(String)req.getSession().getAttribute("id");
		if(cmd.equals("fqList")) {
			list(req,resp);
		}else if(cmd.equals("insert") && id!=null) {
			req.setAttribute("page", "/fq/insert.jsp");
			req.getRequestDispatcher("/main.jsp").forward(req, resp);
		}else if(cmd.equals("insertOk")) {
			insertOk(req,resp);
		}else if(cmd.equals("fqdetail")) {
			detail(req,resp);
		}
	}
	
	private void detail(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException{
		int fqno=Integer.parseInt(req.getParameter("fqno"));
		FqboardDao dao=FqboardDao.getInstance();
		FqboardVo vo=dao.detail(fqno);
		int police = dao.getPolice(fqno);
		dao.updateHit(vo);
		req.setAttribute("vo", vo);
		req.setAttribute("police", police);
		req.setAttribute("page", "fq/fqdetail.jsp");
		req.getRequestDispatcher("/main.jsp").forward(req, resp);
		
		
	}
	
	private void insertOk(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException{
		int fqtype=Integer.parseInt(req.getParameter("fqtype"));
		String fqtitle=req.getParameter("fqtitle");
		String fqcontent= req.getParameter("scontent");
		String id=(String)req.getSession().getAttribute("id");
		FqboardVo vo=new FqboardVo(0, fqtype, fqtitle, fqcontent, null, 0, 0, 0, id, 0);
		FqboardDao dao=FqboardDao.getInstance();
		int n=dao.insert(vo);
		if(n>0) {
			resp.sendRedirect(req.getContextPath()+"/fq.do?cmd=fqList");
		}else {
			
		}
	}
	
	private void list(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException{
		
		FqboardDao dao=FqboardDao.getInstance();
	
			String spageNum=req.getParameter("pageNum");
			int pageNum=1;
			if(spageNum!=null) {
				pageNum=Integer.parseInt(spageNum);
			}
			int startRow=(pageNum-1)*10+1;
			int endRow=startRow+9;
			

			ArrayList<FqboardVo> list=dao.list(startRow, endRow);
			int pageCount=(int)Math.ceil(dao.getCount()/10.0);
			
			int startPage = ((pageNum-1)/5)*5 + 1 ; 
			int endPage = startPage + 4 ; 
			if(pageCount<endPage) {
				endPage=pageCount;
			}
				
			req.setAttribute("list", list);
			req.setAttribute("pageCount", pageCount);
			req.setAttribute("startPage", startPage);
			req.setAttribute("endPage", endPage);
			req.setAttribute("pageNum", pageNum);
			req.setAttribute("page", "/fq/fqList.jsp");
			req.getRequestDispatcher("/main.jsp").forward(req, resp);
		
	}
}

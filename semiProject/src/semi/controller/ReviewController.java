package semi.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.dao.ReviewDao;
@WebServlet("/review.do")
public class ReviewController extends HttpServlet{
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	String cmd= req.getParameter("cmd");
    	if(cmd.equals("list")) {
    		list(req,resp);
    	}else if(cmd.equals("write")) {
    		write(req,resp);
    	}
    }
    	public void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	    	
    	String spageNum=req.getParameter("pageNum");
    	int pageNum=1;
    	if(spageNum!=null) {
    		pageNum=Integer.parseInt(spageNum);
    	}
    	int startRow=(pageNum-1)*10+1; //시작행번호
    	int endRow=startRow+9; //끝행번호
    	ReviewDao dao=new ReviewDao();
    	//전체 페이지 갯수 구하기
    	int pageCount=(int)Math.ceil(dao.getCount()/10.0);
    	//시작페이지와 끝페이지 구하기
    	int startPage=((pageNum-1)/10*10)+1;
    	int endPage=startPage+9;
    	if(pageCount<endPage) {
    		endPage=pageCount;
    	}
    	req.setAttribute("page", "/review/jReviewList.jsp");
    	req.setAttribute("pageCount",pageCount);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage",endPage);
		req.setAttribute("pageNum", pageNum);
		req.getRequestDispatcher("main.jsp").forward(req, resp);
    	
    	 }
    	public void write(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    		
    	}
    }


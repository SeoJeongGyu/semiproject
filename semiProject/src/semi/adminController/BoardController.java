package semi.adminController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.dao.AdminDao;
import semi.dao.MemberDao;
import semi.dao.NoticesDao;
import semi.dao.SellDao;
import semi.vo.MemberVo;
import semi.vo.NoticesVo;
import semi.vo.SellVo;
@WebServlet("/boardlist.do")
public class BoardController extends HttpServlet{
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String cmd= req.getParameter("cmd");
        System.out.println("cmd:"+cmd);
        if(cmd.equals("sell")) {
            sell(req,resp);
        }else if(cmd.equals("freeboard")) {
            freeboard(req,resp);
        }else if(cmd.equals("review")) {
            review(req,resp);
        }else if(cmd.equals("buy")) {
            buy(req,resp);
        }else if(cmd.equals("qna")) {
            qna(req,resp);
        }else if(cmd.equals("notices")) {
            notices(req,resp);
        }else if(cmd.equals("noticesInsert")) {
            noticesInsert(req,resp);
        }else if(cmd.equals("noticesOk")) {
            noticesOk(req,resp);
        }else if(cmd.equals("noticesUpdate")) {
            noticesUpdate(req,resp);
        }else if(cmd.equals("selldelete")) {
            selldelete(req,resp);
        }
    }
    public void selldelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String sql=req.getParameter("sql");
        System.out.println(sql);
        int n = SellDao.getInstance().adminDelete(sql);
        System.out.println("n:"+n);
        if(n>0) {
            req.setAttribute("del", "삭제성공");
        }else {
            req.setAttribute("page", "/admin/member.jsp");
        }
        sell(req,resp);
    }
    public void noticesUpdate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int num=Integer.parseInt(req.getParameter("num"));
        NoticesVo vo=NoticesDao.getInstance().detail(num);
        req.setAttribute("vo", vo);
        req.setAttribute("page", "/admin/board.jsp");
        req.setAttribute("page1", "noticesUpdate");
        RequestDispatcher rd = req.getRequestDispatcher("admin.jsp");
        rd.forward(req, resp);
    }
    public void noticesInsert(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("page", "/admin/board.jsp");
        req.setAttribute("page1", "noticesInsert");
        RequestDispatcher rd = req.getRequestDispatcher("admin.jsp");
        rd.forward(req, resp);
    }
    public void notices(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String text = req.getParameter("text");
        String spageNum = req.getParameter("pageNum");
        System.out.println("spageNum:"+spageNum);
        int pageNum=1;
        if(spageNum!=null) {
            if(Integer.parseInt(spageNum)<0) {
                spageNum="1";
            }
            pageNum=Integer.parseInt(spageNum);
        }
        System.out.println("pageNum:"+pageNum);
        int startRow = (pageNum-1)*10+1;
        System.out.println("startRow:"+startRow);
        int endRow = startRow+9;
        System.out.println("endRow:"+endRow);
        int getMax=0;
        System.out.println("text:"+text);
        ArrayList<NoticesVo> list = null;
        if(text==null) {
            getMax = NoticesDao.getInstance().getMax();
            list = NoticesDao.getInstance().noticesList(null, startRow, endRow);
        }else {
            list = NoticesDao.getInstance().noticesList(text,startRow,endRow);
            getMax=NoticesDao.getInstance().getMax(text);
            req.setAttribute("text", text);
        }
        System.out.println("getMax:"+getMax);
        int pageCount = (int)Math.ceil(getMax/10.0);
        System.out.println("pageCount:"+pageCount);
        int startPage = ((pageNum-1)/5*5)+1;
        System.out.println("startPage:"+startPage);
        int endPage = startPage+4;
        if(pageCount<endPage) {
            endPage=pageCount;
        }
        System.out.println("endPage:"+endPage);
        req.setAttribute("list", list);
        req.setAttribute("pageCount", pageCount);
        req.setAttribute("startPage", startPage);
        req.setAttribute("endPage", endPage);
        req.setAttribute("pageNum", pageNum);
        req.setAttribute("page", "/admin/board.jsp");
        req.setAttribute("page1", "notices");
        RequestDispatcher rd = req.getRequestDispatcher("admin.jsp");
        rd.forward(req, resp);
    }
    public void noticesOk(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String title = req.getParameter("title");
       String content = req.getParameter("scontent");
       String chk[] = req.getParameterValues("chk");
       System.out.println("title:"+title);
       System.out.println("content:"+content);
       int n=0;
       for(int i=0; i<chk.length;i++) {
           n+=AdminDao.getInstance().notices(chk[i], title, content);
           System.out.println("n:"+n);
       }
        System.out.println("완성n:"+n);
        notices(req,resp);
    }
    public void buy(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("page", "/admin/board.jsp");
        req.setAttribute("page1", "buy");
        RequestDispatcher rd = req.getRequestDispatcher("admin.jsp");
        rd.forward(req, resp);
    }
    public void qna(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("page", "/admin/board.jsp");
        req.setAttribute("page1", "qna");
        RequestDispatcher rd = req.getRequestDispatcher("admin.jsp");
        rd.forward(req, resp);
    }
    public void review(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("page", "/admin/board.jsp");
        req.setAttribute("page1", "review");
        RequestDispatcher rd = req.getRequestDispatcher("admin.jsp");
        rd.forward(req, resp);
    }
    public void freeboard(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("page", "/admin/board.jsp");
        req.setAttribute("page1", "freeboard");
        RequestDispatcher rd = req.getRequestDispatcher("admin.jsp");
        rd.forward(req, resp);
    }
    public void sell(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String text = req.getParameter("text");
        String spageNum = req.getParameter("pageNum");
        System.out.println("spageNum:"+spageNum);
        int pageNum=1;
        if(spageNum!=null) {
            if(Integer.parseInt(spageNum)<0) {
                spageNum="1";
            }
            pageNum=Integer.parseInt(spageNum);
        }
        System.out.println("pageNum:"+pageNum);
        int startRow = (pageNum-1)*10+1;
        System.out.println("startRow:"+startRow);
        int endRow = startRow+9;
        System.out.println("endRow:"+endRow);
        int getMax=0;
        System.out.println("text:"+text);
        ArrayList<SellVo>list = SellDao.getInstance().list(startRow, endRow);
        if(text==null) {
            getMax = SellDao.getInstance().getCount();
            list = SellDao.getInstance().list(startRow, endRow);
        }else {
            System.out.println("select:"+req.getParameter("select"));
            String select = req.getParameter("select");
            getMax=SellDao.getInstance().getCount(select,text);
            list = SellDao.getInstance().searchlist(select,text,startRow,endRow);
            req.setAttribute("select", select);
            req.setAttribute("text", text);
        }
        System.out.println("getMax:"+getMax);
        int pageCount = (int)Math.ceil(getMax/10.0);
        System.out.println("pageCount:"+pageCount);
        int startPage = ((pageNum-1)/5*5)+1;
        System.out.println("startPage:"+startPage);
        int endPage = startPage+4;
        if(pageCount<endPage) {
            endPage=pageCount;
        }
        System.out.println("endPage:"+endPage);
        req.setAttribute("list", list);
        req.setAttribute("pageCount", pageCount);
        req.setAttribute("startPage", startPage);
        req.setAttribute("endPage", endPage);
        req.setAttribute("pageNum", pageNum);
        req.setAttribute("page", "/admin/board.jsp");
        req.setAttribute("page1", "sell");
        RequestDispatcher rd = req.getRequestDispatcher("admin.jsp");
        rd.forward(req, resp);
    }
    
}

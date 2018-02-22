package semi.adminController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.dao.MemberDao;
import semi.vo.MemberVo;

@WebServlet("/memberAdmin.do")
public class MemberAdminController extends HttpServlet{
        @Override
        protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String cmd = req.getParameter("cmd");
            System.out.println(cmd);
            if(cmd.equals("list")) {
                list(req,resp);
            }
        }
        public void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
            int getMax = MemberDao.getInstance().getMax();
            System.out.println("getMax:"+getMax);
            int pageCount = (int)Math.ceil(getMax/10.0);
            System.out.println("pageCount:"+pageCount);
            int startPage = ((pageNum-1)/2*2)+1;
            System.out.println("startPage:"+startPage);
            int endPage = startPage+1;
            if(pageCount<endPage) {
                endPage=pageCount;
            }
            System.out.println("endPage:"+endPage);
            ArrayList<MemberVo> list = MemberDao.getInstance().selectAll(startRow,endRow);
            req.setAttribute("list", list);
            req.setAttribute("pageCount", pageCount);
            req.setAttribute("startPage", startPage);
            req.setAttribute("endPage", endPage);
            req.setAttribute("pageNum", pageNum);
            req.setAttribute("page", "/admin/member.jsp");
            RequestDispatcher rd = req.getRequestDispatcher("admin.jsp");
            rd.forward(req, resp);
        }
    }


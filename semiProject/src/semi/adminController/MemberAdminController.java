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
            int pageNum=1;
            if(spageNum!=null) {
                pageNum=Integer.parseInt(spageNum);
            }
            int startRow = (pageNum-1)*5+1;
            int endRow = startRow+4;
            
            
            ArrayList<MemberVo> list = MemberDao.getInstance().selectAll();
            int getMax = MemberDao.getInstance().getMax();
            System.out.println(getMax);
            req.setAttribute("list", list);
            req.setAttribute("page", "/admin/member.jsp");
            RequestDispatcher rd = req.getRequestDispatcher("admin.jsp");
            rd.forward(req, resp);
        }
    }


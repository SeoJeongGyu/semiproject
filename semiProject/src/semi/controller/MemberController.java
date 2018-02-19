package semi.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member.do")
public class MemberController  extends HttpServlet{
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cmd = req.getParameter("cmd");
        if(cmd.equals("join")) {
            req.setAttribute("page", "/member/join.jsp");
            RequestDispatcher rd = req.getRequestDispatcher("main.jsp");
            rd.forward(req, resp);
        }else if(cmd.equals("login")) {
            req.setAttribute("page", "/member/login.jsp");
            RequestDispatcher rd = req.getRequestDispatcher("main.jsp");
            rd.forward(req, resp);
        }
    }
    public void join(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id=req.getParameter("id");
    }
    
}

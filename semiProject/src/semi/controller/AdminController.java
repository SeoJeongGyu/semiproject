package semi.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/admin.do")
public class AdminController extends HttpServlet{
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cmd = req.getParameter("cmd");
        System.out.println(cmd);
        if(cmd.equals("member")) {
            member(req,resp);
        }else if(cmd.equals("board")) {
            board(req,resp);
        }else if(cmd.equals("report")) {
            report(req,resp);
        }
    }
    public void member(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("page", "/admin/member.jsp");
        RequestDispatcher rd = req.getRequestDispatcher("admin.jsp");
        rd.forward(req, resp);
    }
    public void board(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("page", "/admin/board.jsp");
        RequestDispatcher rd = req.getRequestDispatcher("admin.jsp");
        rd.forward(req, resp);
    }
    public void report(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("page", "/admin/report.jsp");
        RequestDispatcher rd = req.getRequestDispatcher("admin.jsp");
        rd.forward(req, resp);
    }
}

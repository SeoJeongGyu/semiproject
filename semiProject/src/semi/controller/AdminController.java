package semi.controller;

import java.io.IOException;

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
            
        }else if(cmd.equals("report")) {
            
        }
        
        
    }
    public void member(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    }
    public void board(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    }
    public void report(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    }
}

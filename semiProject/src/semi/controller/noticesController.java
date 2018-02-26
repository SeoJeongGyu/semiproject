package semi.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/notices.do")
public class noticesController extends HttpServlet{

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cmd=req.getParameter("cmd");
        if(cmd.equals("notices")) {
            notices(req,resp);
        }
    }
    public void notices(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    }
}

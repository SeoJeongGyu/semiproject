package semi.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.dao.MemberDao;
import semi.vo.MemberVo;

@WebServlet("/member.do")
public class MemberController  extends HttpServlet{
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String cmd = req.getParameter("cmd");
       // System.out.println(cmd);
        if(cmd.equals("join")) {
            req.setAttribute("page", "/member/join.jsp");
            RequestDispatcher rd = req.getRequestDispatcher("main.jsp");
            rd.forward(req, resp);
        }else if(cmd.equals("login")) {
            req.setAttribute("page", "/member/login.jsp");
            RequestDispatcher rd = req.getRequestDispatcher("main.jsp");
            rd.forward(req, resp);
        }else if(cmd.equals("memberInsert")) {
            memberInsert(req,resp);
        }else if(cmd.equals("checkId")) {
            checkId(req,resp);
        }else if(cmd.equals("loginOk")) {
            loginOk(req,resp);
        }else if(cmd.equals("chat")) {
            chat(req,resp);
        }else if(cmd.equals("update")) {
        	update(req,resp);
        }else if(cmd.equals("mypage")) {
        	req.setAttribute("page", "/mypage/myPageMain.jsp");
            req.getRequestDispatcher("main.jsp").forward(req, resp);
        }
    }
    
    public void chat(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("page", "/chat.jsp");
        RequestDispatcher rd = req.getRequestDispatcher("main.jsp");
        rd.forward(req, resp);
    }
 
    
    public void loginOk(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id=req.getParameter("id");
        String pwd=req.getParameter("pwd");
        int n = MemberDao.getInstance().loginOk(id, pwd);
        if(n>0) {
            req.getSession().setAttribute("id",id);
            String addr = req.getParameter("addr");
            System.out.println("id:"+id);
            if(id.equals("admin")) {
                System.out.println("여기옴");
                resp.sendRedirect(req.getContextPath()+"/admin.jsp");
            }else if(addr.equals("")) {
                resp.sendRedirect(req.getContextPath()+"/main.jsp");
            }else {
                resp.sendRedirect(addr);
            }
        }else {
            req.setAttribute("page", "/member/login.jsp");
            req.setAttribute("result", "로그인에 실패하였습니다.");
            RequestDispatcher rd = req.getRequestDispatcher("main.jsp");
            rd.forward(req, resp);
        }
    }
    public void checkId(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        resp.setContentType("text/xml;charset=utf-8");
        PrintWriter pw = resp.getWriter();
        int n = MemberDao.getInstance().checkId(id);
        pw.println("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
        if(n>0) {
            pw.println("<result>사용할 수 있는 아이디 입니다.</result>");
        }else {
            pw.println("<result>사용할 수 없는 아이디 입니다.</result>");
        }
        pw.close();
    }
    public void memberInsert(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id"); 
        String pwd = req.getParameter("pwd"); 
        String nickname = req.getParameter("nickname"); 
        String name = req.getParameter("name"); 
        String phone = req.getParameter("phone"); 
        String email = req.getParameter("email"); 
        MemberVo vo = new MemberVo(id, pwd, nickname, name, phone, email, null);
        int n = MemberDao.getInstance().insert(vo);
        if(n>0) {
            req.setAttribute("page", "/member/login.jsp");
            req.setAttribute("result", "회원가입에 성공하였습니다 로그인 하세요");
            RequestDispatcher rd = req.getRequestDispatcher("main.jsp");
            rd.forward(req, resp);
        }else {
            req.setAttribute("page", "/member/join.jsp");
            req.setAttribute("result", "가입할 수 없습니다.");
            RequestDispatcher rd = req.getRequestDispatcher("main.jsp");
            rd.forward(req, resp);
        }
    }
    public void join(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id=req.getParameter("id");
    }
    
    public void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
    	String pwd=req.getParameter("pwd");
        String nickname = req.getParameter("nickname"); 
        String name = req.getParameter("name"); 
        String phone = req.getParameter("phone"); 
        String email = req.getParameter("email"); 
        MemberVo vo = new MemberVo(id, pwd, nickname, name, phone, email, null);
        int n = MemberDao.getInstance().update(vo);
        if(n>0) {
            req.setAttribute("result", "회원수정에 성공하였습니다.");
            RequestDispatcher rd = req.getRequestDispatcher("/mypage/myPageUpdate.jsp");
            rd.forward(req, resp);
        }else {
            req.setAttribute("result", "회원수정에 실패하였습니다.");
            RequestDispatcher rd = req.getRequestDispatcher("/mypage/myPageUpdate.jsp");
            rd.forward(req, resp);
        }
    }
    
    
    
}

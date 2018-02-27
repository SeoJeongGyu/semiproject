package semi.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebFilter(urlPatterns = {"/sell.do","/review.do","/buy.do"})
public class LoginFilter implements Filter{
    @Override
    public void destroy() {}
    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
            throws IOException, ServletException {
        //세션에 id가 있는지 검사 - 세션에 id가 있으면 login true가 저장되도록 작성해 보세요.
        String cmd = req.getParameter("cmd");
        System.out.println("filter cmd:"+cmd);
        if(cmd.equals("insert")||cmd.equals("write")) {
            boolean login=false;
            HttpServletRequest request = (HttpServletRequest) req;
            HttpServletResponse response = (HttpServletResponse) resp;
            HttpSession session = ((HttpServletRequest) req).getSession();
            if(session!=null) {
                String id=(String)session.getAttribute("id");
                if(id!=null) {
                    login=true;
                }
            }
            if(login) {//로그인된 상태라면
                chain.doFilter(req, resp);//사용자가 요청한 페이지로 이동
            }else {//로그인 안된 상태라면
                //login.jsp로 이동하기(redirect방식으로)
                response.sendRedirect(request.getContextPath()+"/member.do?cmd=login");
            }
        }else {
            chain.doFilter(req, resp);
        }
    }
    @Override
    public void init(FilterConfig config) throws ServletException {
        
    }
}

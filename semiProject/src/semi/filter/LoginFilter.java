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
        //���ǿ� id�� �ִ��� �˻� - ���ǿ� id�� ������ login true�� ����ǵ��� �ۼ��� ������.
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
            if(login) {//�α��ε� ���¶��
                chain.doFilter(req, resp);//����ڰ� ��û�� �������� �̵�
            }else {//�α��� �ȵ� ���¶��
                //login.jsp�� �̵��ϱ�(redirect�������)
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

package semi.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import semi.dao.ScommentDao;
import semi.vo.ScommentVo;

@WebServlet("/scomment.do")
public class ScommentController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String cmd=req.getParameter("cmd");
		//System.out.println("cmd:" + cmd);
		String id=(String)req.getSession().getAttribute("id");
		if(cmd.equals("insert") && id!=null ) {
			insert(req,resp);
		}else if(cmd.equals("list")) {
			list(req,resp);
		}
	}
	
	private void insert(HttpServletRequest req, HttpServletResponse resp) throws ServletException,IOException {
		//1. 파라미터로 전달된 값을 db에 저장
		String sccontent = req.getParameter("sccontent");
		//System.out.println(sccontent);
		String id=(String)req.getSession().getAttribute("id");
		int sno=Integer.parseInt(req.getParameter("sno"));
		ScommentDao dao=ScommentDao.getInstance();
		ScommentVo vo=new ScommentVo(0, sccontent, 0, 0, 0, 0, null, sno, id);
		int n=dao.insert(vo);
		//System.out.println("n:"+n);
		JSONObject json=new JSONObject();
		if(n>0) {
			json.put("result", "success");
		}else {
			json.put("result", "fail");
		}
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		pw.print(json);
		pw.close();
	}	
	
	private void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException,IOException {
		ScommentDao dao=ScommentDao.getInstance();
		
		int sno=Integer.parseInt(req.getParameter("sno"));
		
		ArrayList<ScommentVo> list=dao.list(sno);
		
		//json배열로 응답하기
		JSONArray arr=new JSONArray();
		for(int i=0;i<list.size();i++){
			ScommentVo vo=list.get(i);
			JSONObject obj=new JSONObject();
			//obj.put("num",vo.getNum());
			obj.put("id",vo.getId());
			obj.put("comments",vo.getSccontent());
			arr.put(obj); //json객체를 배열에 담기
			
		}
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		pw.println(arr);
		pw.close();
		
		
	}
}

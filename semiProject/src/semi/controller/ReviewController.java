package semi.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import semi.dao.ReviewDao;
import semi.vo.ReviewVo;

@WebServlet("/review.do")
public class ReviewController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String cmd = req.getParameter("cmd");
		if (cmd.equals("list")) {
			list(req, resp);
		} else if (cmd.equals("write")) {
			req.setAttribute("page", "/review/jReviewWrite.jsp");
			req.getRequestDispatcher("/main.jsp").forward(req, resp);
		} else if (cmd.equals("writeOk")) {
			writeOk(req, resp);
		} else if (cmd.equals("list")) {
			list(req, resp);
		} else if (cmd.equals("content")) {
			content(req, resp);
		}else if (cmd.equals("delete")) {
			delete(req,resp);
		}else if (cmd.equals("update")) {
			update(req,resp);
		}else if(cmd.equals("recommend")) {
			recommend(req,resp);
		}else if(cmd.equals("police")) {
			police(req,resp);
		}
	}

	public void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String spageNum = req.getParameter("pageNum");
		int pageNum = 1;
		if (spageNum != null) {
			pageNum = Integer.parseInt(spageNum);
		}
		int startRow = (pageNum - 1) * 10 + 1; // 시작행번호
		int endRow = startRow + 9; // 끝행번호
		ReviewDao dao = ReviewDao.getInstance();
		// 전체 페이지 갯수 구하기
		int pageCount = (int) Math.ceil(dao.getCount() / 10.0);
		// 시작페이지와 끝페이지 구하기
		int startPage = ((pageNum - 1) / 10 * 10) + 1;
		int endPage = startPage + 9;
		if (pageCount < endPage) {
			endPage = pageCount;
		}
		ArrayList<ReviewVo> rlist = dao.listAll(startRow, endRow);

		req.setAttribute("rlist", rlist);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("page", "/review/jReviewList.jsp");
		req.getRequestDispatcher("main.jsp").forward(req, resp);

	}

	public void writeOk(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String uploadPath = req.getServletContext().getRealPath("/upload");
		MultipartRequest mr = new MultipartRequest(req, uploadPath, 1024 * 1024 * 5, "utf-8",
				new DefaultFileRenamePolicy());

		String rtitle = mr.getParameter("title");
		String rcontent = mr.getParameter("scontent");
		System.out.println(rcontent);
		String orgfilename = mr.getOriginalFileName("file");
		String savefilename = mr.getFilesystemName("file");
		String id = (String) req.getSession().getAttribute("id");
		int company = Integer.parseInt(mr.getParameter("company"));
		ReviewVo vo = new ReviewVo(0, rtitle, rcontent, null, 0, 0, orgfilename, savefilename, id, company,0,0);
		ReviewDao dao = ReviewDao.getInstance();

		int n = dao.write(vo);
		if (n > 0) {
			resp.sendRedirect("/semiProject/review.do?cmd=list");
		} else {
			System.out.println("fail");
		}
	}

	public void content(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int rno = Integer.parseInt(req.getParameter("rno"));
		ReviewDao dao = ReviewDao.getInstance();
		ReviewVo vo = dao.content(rno);
		int recommend=dao.getRecommend(rno);
		int police = dao.getPolice(rno);
		req.setAttribute("recommend", recommend);
		req.setAttribute("police", police);
		req.setAttribute("vo", vo);
		req.setAttribute("page", "/review/jReviewContent.jsp");
		req.getRequestDispatcher("main.jsp").forward(req, resp);
	}

	public void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int rno = Integer.parseInt(req.getParameter("rno"));
		String id= req.getParameter("id");
		ReviewDao dao = ReviewDao.getInstance();
		int n = dao.delete(rno, id);
		
		if(n>0) {
		req.setAttribute("page", "/review/jReviewList.jsp");
		req.getRequestDispatcher("main.jsp").forward(req, resp);
		}else {
			req.setAttribute("result", "cancel");
			
		}
	}
	public void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int rno = Integer.parseInt(req.getParameter("rno"));
		ReviewDao dao=ReviewDao.getInstance();
		ReviewVo vo=dao.update(rno);
		req.setAttribute("vo", vo);
		req.setAttribute("page", "/review/jReviewUpdate.jsp");
		req.getRequestDispatcher("main.jsp").forward(req, resp);
	
		}
	
	public void recommend(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int rno = Integer.parseInt(req.getParameter("rno"));
		String id = req.getParameter("id");
		ReviewDao dao=ReviewDao.getInstance();
		int n=dao.oxrecommend(rno, id);
		
		if(n>0) {
		
			req.setAttribute("result", "동일 게시물에는 추천할 수 없습니다");
			content(req, resp);
		}else {
		int recommend = dao.recommend(rno, id);
		if(recommend>0) {
			req.setAttribute("result", "추천하였습니다");
			content(req, resp);
		}else {

			content(req, resp);
		}
		}
		
	}
	
	public void police(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int rno = Integer.parseInt(req.getParameter("rno"));
		String id = req.getParameter("id");
		ReviewDao dao=ReviewDao.getInstance();
		int n=dao.oxpolice(rno, id);
		
		if(n>0) {
		
			req.setAttribute("result", "이미 신고한 게시물입니다.");
			content(req, resp);
		}else {
		int police = dao.police(rno, id);
		if(police>0) {
			req.setAttribute("result", "게시물을 신고하였습니다.");
			content(req, resp);
		}else {

			content(req, resp);
		}
		}
		
	}
	
	
	}


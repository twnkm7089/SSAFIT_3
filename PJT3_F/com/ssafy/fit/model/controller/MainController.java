package com.ssafy.fit.model.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssafy.fit.model.Member;
import com.ssafy.fit.model.Review;
import com.ssafy.fit.model.dao.MainDaoImpl;

@WebServlet("/main")
public class MainController extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	//의존성 주입
//	private MainDao mainDao = MainDaoImpl.getInstance();
	private MainDaoImpl mainDao = MainDaoImpl.getInstance();
	
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		if(req.getMethod().equals("POST")) {
			req.setCharacterEncoding("UTF-8");
		}
		
		
		String act = req.getParameter("act");
		
		switch(act) {
		case"main":
			doMain(req, res);
			break;
			
		case "part"://
			doListpart(req, res);
			break;
			
		case "reviewlist":
			doReviewList(req, res);
			break;
			
		case "reviewregist":
			doReviewregist(req, res);
			break;
			
		case "reviewupdate":
			doReviewupdate(req, res);
			break;
			
//		case "reviewdetail":
//			doReviewdetail(req, res);
//			break;
			
		case "reviewdelete":
			doReviewdelete(req, res);
			break;
			
		case "signup":
			doSignup(req, res);
			break;
			
		case "login":
			doLogin(req, res);
			break;
			
		default:
			break;
		}
		
		
		
	}

	//로그인
	private void doLogin(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		mainDao.signIn(req.getParameter("membername"), req.getParameter("memberpw"));
		req.setAttribute("watchvideos", mainDao.selectInterestViewFitVideo());
		req.setAttribute("partvideos", mainDao.selectAllVideo());
		doMain(req,res);
	}

	//회원가입
	private void doSignup(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String name = req.getParameter("name");
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		
		Member member = new Member();
		
		member.setName(name);
		member.setId(id);
		member.setPw(pw);

		mainDao.signUp(member);
		req.setAttribute("watchvideos", mainDao.selectInterestViewFitVideo());
		req.setAttribute("partvideos", mainDao.selectAllVideo());
		doMain(req,res);
//		res.sendRedirect("/PJT3_F/main.jsp");
	}

	//메인페이지화면-동영상 정보 가져오기&조회수에 따른 비디오 오름차순 정렬
	private void doMain(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setAttribute("watchvideos", mainDao.selectInterestViewFitVideo());
		req.setAttribute("partvideos", mainDao.selectAllVideo());
		req.setAttribute("videos", mainDao.selectAllVideo());
		req.getRequestDispatcher("/main.jsp").forward(req, res);
		
	}

	//파트별 비디오 정렬
	private void doListpart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setAttribute("watchvideos", mainDao.selectInterestViewFitVideo());
		req.setAttribute("partvideos", mainDao.selectPartFitVideo(req.getParameter("fitPartName")));
		req.getRequestDispatcher("/main.jsp").forward(req, res);
	}

	//리뷰 삭제
	private void doReviewdelete(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {	
		mainDao.deleteReview(req.getParameter("youtubeId"), Integer.parseInt(req.getParameter("reviewId")));
		doReviewList(req,res);
//		req.getRequestDispatcher("/review.jsp").forward(req, res);
	}

	//리뷰 상세보기
//	private void doReviewdetail(HttpServletRequest req, HttpServletResponse res) {
//		
//		
//	}

	//리뷰수정
	private void doReviewupdate(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		String youtubeId = req.getParameter("youtubeId");
		int reviewId = Integer.parseInt(req.getParameter("reviewId"));
		String title = req.getParameter("title");
		String content = req.getParameter("content");
//		Review temp = mainDao.getReview(req.getParameter("youtubeId"), Integer.parseInt(req.getParameter("reviewId")));
		mainDao.updateReview(youtubeId, reviewId, title, content );
		
		doReviewList(req,res);
//		req.getRequestDispatcher("/review.jsp").forward(req, res);
		
	}

	//리뷰등록
	private void doReviewregist(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		String youtubeId = req.getParameter("youtubeId");
		String title = req.getParameter("title");
		String writer = req.getParameter("writer");
		String content = req.getParameter("content");
		
		Review temp = new Review(youtubeId, title, writer, content);
		
		mainDao.addReview(req.getParameter("youtubeId"), temp);
		
		req.setAttribute("reviews", (List<Review>)mainDao.showAllReview(req.getParameter("youtubeId")));
//		Review temp = mainDao.getReview(req.getParameter("youtubeId"), Integer.parseInt(req.getParameter("reviewId")));
		doReviewList(req,res);
//		req.getRequestDispatcher("/review.jsp").forward(req, res);
	}
	
	//리뷰 리스트 보여주기
	private void doReviewList(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		mainDao.showAllReview(req.getParameter("youtubeId"));
		req.setAttribute("youtubeId", req.getParameter("youtubeId"));
		req.setAttribute("reviews", mainDao.showAllReview(req.getParameter("youtubeId")));
//		res.sendRedirect("/PJT3_F/review.jsp");
		req.getRequestDispatcher("/review.jsp").forward(req, res);
	}
	
	
}

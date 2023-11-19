package com.ssafy.fit.model.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.ssafy.fit.model.Member;
import com.ssafy.fit.model.Review;
import com.ssafy.fit.model.Video;

public class MainDaoImpl implements MainDao{
	//data
	private List<Video> videos = new ArrayList<>();
	private HashMap<String, List<Review>> reviews = new HashMap<>();
	private List<Member> members = new ArrayList<>();
	
	
	//singleton
	private static MainDaoImpl instance = new MainDaoImpl();
	
	private MainDaoImpl() {
		videos.add(new Video("전신 다이어트 최고의 운동 [칼소폭 찐 핵핵매운맛]","전신","gMaB-fG4u4g","ThankyouBUBU",0));
		videos.add(new Video("하루 15분! 전신 칼로리 불태우는 다이어트 운동","전신","swRNeYw1JkY","ThankyouBUBU",0));
		videos.add(new Video("상체 다이어트 최고의 운동 BEST [팔뚝살/겨드랑이살/등살/가슴어깨라인]","상체","54tTYO-vU2E","ThankyouBUBU",0));
		videos.add(new Video("상체비만 다이어트 최고의 운동 [상체 핵매운맛]","상체","QqqZH3j_vH0","ThankyouBUBU",0));
		videos.add(new Video("하체운동이 중요한 이유? 이것만 보고 따라하자 ! [하체운동 교과서]","하체","tzN6ypk6Sps","김강민",0));
		videos.add(new Video("저는 하체 식주의자 입니다","하체","u5OgcZdNbMo","GYM종국",0));
		videos.add(new Video("11자복근 복부 최고의 운동 [복근 핵매운맛]","복부","PjGcOP-TQPE","ThankyouBUBU",0));
		videos.add(new Video("(Sub)누워서하는 5분 복부운동!! 효과보장! (매일 2주만 해보세요!)","복부","7TLk7pscICk","SomiFit",0));
	};
	
	public static MainDaoImpl getInstance() {
		return instance;
	}
	
	//모든 비디오 리스트
	public List<Video> selectAllVideo(){
		return videos;
	}
	
	//조회수에 따른 비디오 정렬
	@Override
	public List<Video> selectInterestViewFitVideo() {
		//비디오를 정렬할 배열 생성
		List<Video> answer = new ArrayList<>();
		for(int i = 0; i < videos.size(); i++) {
			answer.add(videos.get(i));
		}
		//정렬
		Collections.sort(answer);
		
		return answer;
	}

	//비디오 부위별 출력
	@Override
	public List<Video> selectPartFitVideo(String fitPartName) {
		List<Video> answer = new ArrayList<>();
		
		for(int i = 0; i < videos.size(); i++) {//부위가 일치하는 비디오 찾아 추가
			if(fitPartName.equals(videos.get(i).getFitPartName())) {
				answer.add(videos.get(i));
			}
		}
		
		return answer;
	}

	//모든 리뷰 보여주기
	@Override
	public List<Review> showAllReview(String youtubeId) {
		//조회수 추가 구문
		for(int i = 0; i < videos.size(); i++) {
			if(youtubeId.equals(videos.get(i).getYoutubeId())) {//유튜브 아이디 토대로 해당 비디오 정보 찾기
				videos.get(i).setViewCnt(videos.get(i).getViewCnt() + 1);//조회수 추가
				break;
			}
		}
		return reviews.get(youtubeId);//해당 유튜브 리뷰 출력
	}

	//리뷰 추가
	@Override
	public void addReview(String youtubeId, Review review) {
//		System.out.println(youtubeId);
		//해당 리뷰 리스트 불러와 추가
		List<Review> temp = reviews.get(youtubeId);
		if(temp != null) {
			temp.add(review);
		} else {
			List<Review> newRevlist = new ArrayList<>();
			newRevlist.add(review);
			reviews.put(youtubeId, newRevlist);
		}
		
	}

	@Override
	//리뷰 업데이트
	public void updateReview(String youtubeId, int reviewId, String title, String content) {
		List<Review> temp = reviews.get(youtubeId);
		for(int i = 0; i < temp.size(); i++) {//리뷰 찾기
			Review r = temp.get(i);
			if(r.getReviewId() == reviewId) {
				//리뷰 값 수정
				r.setTitle(title);
				r.setContent(content);
				r.setRegDate(new Date().toString());
				break;
			}
		}
		
	}

	@Override
	//리뷰 자세히(처음 리뷰 볼 때만)
	public Review showDetailReview(String youtubeId, int reviewId) {
		List<Review> temp = reviews.get(youtubeId);
		//해당 리뷰 찾아 반환
		for(int i = 0; i < temp.size(); i++) {
			Review r = temp.get(i);
			if(r.getReviewId() == reviewId) {
				r.setViewCnt(r.getViewCnt() + 1);
				return r;
			}
		}
		return null;
	}

	@Override
	//리뷰 삭제
	public void deleteReview(String youtubeId, int reviewId) {
		List<Review> temp = reviews.get(youtubeId);
		//해당 리뷰 찾아 삭제
		for(int i = 0; i < temp.size(); i++) {
			Review r = temp.get(i);
			if(r.getReviewId() == reviewId) {
				temp.remove(i);
				break;
			}
		}
	}
	
	
	//회원 가입
	public void signUp(Member member) {
		//멤버 리스트에 추가
		members.add(member);
		
		//정보 전달 확인 테스트용
//		System.out.println(member);
	}
	
	//로그인
	public boolean signIn(String id, String password) {
		//반환값 valid
		boolean valid = false;
		for(int i = 0; i < members.size(); i++) {//members 리스트에서 id, password 일치 시 valid를 true로 변환
			Member m = members.get(i);
			if(m.getId().equals(id) && m.getPw().equals(password)) {
				valid = true;
				break;
			}
		}
		//반환
		return valid;
	}


	
	
}

package com.ssafy.fit.model.dao;

import java.util.List;

import com.ssafy.fit.model.Member;
import com.ssafy.fit.model.Review;
import com.ssafy.fit.model.Video;

public interface MainDao {
	List<Video> selectAllVideo();
	List<Video> selectInterestViewFitVideo();
	List<Video> selectPartFitVideo(String fitPartName);
	
	List<Review> showAllReview(String youtubeId);
	void addReview(String youtubeId, Review review);
	void updateReview(String youtubeId, int reviewId, String title, String content);
	Review showDetailReview(String youtubeId, int reviewId);
	void deleteReview(String youtubeId, int reviewId);
	
	void signUp(Member member);
	boolean signIn(String id, String password);
}

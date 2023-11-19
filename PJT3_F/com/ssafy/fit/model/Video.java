package com.ssafy.fit.model;

public class Video implements Comparable<Video>{
	private String title;
	private String fitPartName;
	private String youtubeId;
	private String channelName;
	private int viewCnt;
	public Video() {}
	
	public Video(String title, String fitPartName, String youtubeId, String channelName, int viewCnt) {
		super();
		this.title = title;
		this.fitPartName = fitPartName;
		this.youtubeId = youtubeId;
		this.channelName = channelName;
		this.viewCnt = viewCnt;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getFitPartName() {
		return fitPartName;
	}

	public void setFitPartName(String fitPartName) {
		this.fitPartName = fitPartName;
	}

	public String getYoutubeId() {
		return youtubeId;
	}

	public void setYoutubeId(String youtubeId) {
		this.youtubeId = youtubeId;
	}

	public String getChannelName() {
		return channelName;
	}

	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	@Override
	public String toString() {
		return "Video [title=" + title + ", fitPartName=" + fitPartName + ", youtubeId=" + youtubeId + ", channelName="
				+ channelName + ", viewCnt=" + viewCnt + "]";
	}

	@Override
	public int compareTo(Video o) {
		
		return o.viewCnt - this.viewCnt;
	}
	
}

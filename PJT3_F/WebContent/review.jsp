<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.ssafy.fit.model.Review"%>
<%@ page import="com.ssafy.fit.model.Video"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Review</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css" />
<link rel="stylesheet" href="css/style.css" />
</head>
<body>
	<header>
		<nav id="navbar-example2" class="navbar bg-body-tertiary px-3 mb-3">
			<a class="navbar-brand" href="index.html"> <img
				src="img/ssafit.png" width="60px" />
			</a>
			<ul class="nav nav-pills">
				<li class="nav-item"><a class="nav-link" href="index.html">HOME</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="search.html">헬스장찾기</a>
				</li>
				<li class="nav-item">
					<button type="button" class="btn btn-outline-success fa-2x"
						style="margin-right: 10px" data-bs-toggle="modal"
						data-bs-target="#Register" data-bs-whatever="@getbootstrap">
						<i class="bi bi-person-plus"></i>
					</button>
				</li>
				<li class="nav-item">
					<button type="button" class="btn btn-outline-warning fa-2x"
						data-bs-toggle="modal" data-bs-target="#login"
						data-bs-whatever="@getbootstrap">
						<i class="bi bi-box-arrow-in-right"></i>
					</button></
				</li>


				</li>
			</ul>
		</nav>

		<div class="container text-center fs-2">
			<i class="bi bi-award"></i> 운동영상 리뷰 <i class="bi bi-award"></i>
		</div>
		<hr />
	</header>
	<main width="100%"> <!-- 리뷰 목록 보여주는곳 -->
	<div class="contianer text-center">
		<iframe width="728" height="410"
			src="https://www.youtube.com/embed/${requestScope.youtubeId}"
			title="YouTube video player" frameborder="0"
			allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
			allowfullscreen></iframe>
	</div>
	<hr />
	<section class="section">
		<span>
			<button type="button" class="btn btn-primary btn3"
				data-bs-toggle="modal" data-bs-target="#reviewResigterModal"
				data-bs-whatever="@getbootstrap">리뷰 등록</button>
		</span>
		<div class="search">
			<i class="bi bi-search"></i>검색
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
	</section>
	<hr />
	<table width="100%">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성시간</th>
			</tr>
		</thead>
		<tbody>
			<!-- 더미 데이터 여기는 안지워짐 수정도 불가 -->

			<c:forEach var="review" items="${reviews}">
				<tr>
					<td>${review.getReviewId() }</td>
					<td><button type="button" class="btn btn-outline-dark"
							data-bs-toggle="modal"
							data-bs-target="#review-detail-${review.getReviewId()}">
							${review.getTitle() }</button></td>
					<td>${review.getWriter() }</td>
					<td>${review.getViewCnt() }</td>
					<td>${review.getRegDate() }</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
	<!-- 운동 영상 리뷰 (리뷰 디테일)--> <c:forEach var="review" items="${reviews}">
		<div class="modal fade" id="review-detail-${review.getReviewId() }"
			data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<div class="modal-header-title">
							<h1 class="modal-title" id="reviewlist">운동 영상 리뷰</h1>
						</div>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close" style="margin-left: 10px !important"></button>
					</div>
					<div class="modal-body" aria-label="Basic example">
						<div class="btn-list">
							<div class="review-list-btn">
								<button type="button" class="btn btn-outline-primary"
									data-bs-dismiss="modal">목록</button>
							</div>
							<div class="review-rm-btn">
								<button type="button" class="btn btn-outline-primary"
									data-bs-target="#reviewModifyModal-${review.getReviewId()}"
									data-bs-toggle="modal">글수정</button>
								<form method="POST" action="main">
									<input type="hidden" name="act" value="reviewdelete" /> <input
										type="hidden" name="youtubeId"
										value="${requestScope.youtubeId}" /> <input type="hidden"
										name="reviewId" value="${review.getReviewId()}" />
									<button type="submit" class="btn btn-outline-danger"
										data-bs-dismiss="modal">글삭제</button>
								</form>


							</div>
						</div>
						<div class="review-detail-box">
							<div class="review-title">${review.getTitle()}</div>
							<div class="review-info">
								<div>작성자 : ${review.getWriter() }</div>
								<div>작성일 : 2023-08-11 15:01:23</div>
							</div>
							<hr>
							<div class="review-content">${review.getContent()}</div>

						</div>
					</div>
					<div class="modal-footer"></div>

				</div>
			</div>
		</div>
	</c:forEach> <!-- 리뷰 등록 -->
	<div class="modal fade" id="reviewResigterModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<div class="modal-header-title">
						<h1 class="modal-title" id="reviewlist">영상 리뷰 등록</h1>
					</div>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close" style="margin-left: 10px !important"></button>
				</div>
				<div class="modal-body">
					<form action="main" method="POST">
						<input type="hidden" name="act" value="reviewregist" />
						<!-- review regist를 위해 추가적으로 주어야하는지 확인 필요 -->
						<input type="hidden" name="youtubeId"
							value="${requestScope.youtubeId}" />
						<div class="mb-3">
							<label for="recipient-name" class="col-form-label">리뷰 제목</label>
							<input type="text" class="form-control" id="recipient-name"
								name="title" placeholder="제목을 입력해주세요." />
						</div>
						<div class="mb-3">
							<label for="recipient-name" class="col-form-label">작성자</label> <input
								type="text" class="form-control" id="recipient-name"
								name="writer" placeholder="제목을 입력해주세요." />
						</div>
						<div class="mb-3">
							<label for="message-text" class="col-form-label">리뷰 내용</label>
							<textarea class="form-control-content" id="message-text"
								name="content" placeholder="내용을 입력해주세요."></textarea>
						</div>

						<div class="modal-footer">

							<button type="submit" class="btn btn-outline-primary"
								data-bs-dismiss="modal">등록</button>

							<button type="reset" class="btn btn-outline-danger"
								data-bs-dismiss="modal">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 영상 리뷰 수정 --> <c:forEach var="review" items="${reviews}">
		<div class="modal fade" id="reviewModifyModal-${review.getReviewId()}"
			tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<div class="modal-header-title">
							<h1 class="modal-title" id="reviewlist">영상 리뷰 수정</h1>
						</div>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close" style="margin-left: 10px !important"></button>
					</div>
					<div class="modal-body">
						<form>
							<input type="hidden" name="act" value="reviewupdate" />
							<input type="hidden" name="youtubeId"
							value="${requestScope.youtubeId}" />
							<input type="hidden" name="reviewId"
							value="${review.getReviewId()}" />
							<div class="mb-3">
								<label for="recipient-name" class="col-form-label">리뷰 제목</label>
								<input type="text" class="form-control" id="recipient-name"
									name="title" placeholder="제목을 입력해주세요." />
							</div>
							<div class="mb-3">
								<label for="message-text" class="col-form-label">리뷰 내용</label>
								<textarea class="form-control-content" id="message-text"
									name="content" placeholder="내용을 입력해주세요."></textarea>
							</div>

							<div class="modal-footer">
								<button type="submit" class="btn btn-outline-primary"
									data-bs-dismiss="modal">완료</button>
								<button type="reset" class="btn btn-outline-danger"
									data-bs-dismiss="modal">취소</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</c:forEach> <!-- 회원가입 -->
	<div class="modal fade" id="Register" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-s">
			<div class="modal-content">
				<div class="modal-header">
					<div class="modal-header-title">
						<h1 class="modal-title">회원 가입</h1>
					</div>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close" style="margin-left: 10px !important"></button>
				</div>
				<div class="modal-body">
					<form method="POST" action="main">
						<input type="hidden" name="act" value="signup" />
						<div class="mb-3">
							<label for="recipient-name" class="col-form-label">이름</label> <input
								type="text" class="form-control" id="recipient-name" name="name">
						</div>
						<div class="mb-3">
							<label for="recipient-name" class="col-form-label">아이디</label> <input
								type="text" class="form-control" id="recipient-name" name="id">
						</div>
						<div class="mb-3">
							<label for="recipient-name" class="col-form-label">비밀번호</label> <input
								type="password" class="form-control" id="recipient-name"
								name="pw">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-primary"
						data-bs-dismiss="modal">가입하기</button>
					<button type="button" class="btn btn-outline-danger"
						data-bs-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>


	<!-- 로그인 -->
	<div class="modal fade" id="login" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-s">
			<div class="modal-content">
				<div class="modal-header">
					<div class="modal-header-title">
						<h1 class="modal-title">로그인</h1>
					</div>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close" style="margin-left: 10px !important"></button>
				</div>
				<div class="modal-body">
					<form action="main" method="POST">
						<input type="hidden" name="act" value="login" />
						<div class="mb-3">
							<label for="recipient-name" class="col-form-label">아이디</label> <input
								type="text" class="form-control" id="recipient-name"
								name="membername">
						</div>
						<div class="mb-3">
							<label for="recipient-name" class="col-form-label">비밀번호</label> <input
								type="password" class="form-control" id="recipient-name"
								name="memberpw">
						</div>

						<div class="modal-footer">
							<button type="submit" class="btn btn-outline-primary"
								data-bs-dismiss="modal">로그인</button>
							<button type="reset" class="btn btn-outline-danger"
								data-bs-dismiss="modal">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	</main>
	<footer class="container text-center">
		<button type="button" class="btn btn-outline-dark">&lt;</button>
		<button type="button" class="btn btn-primary">1</button>
		<button type="button" class="btn btn-outline-dark">&gt;</button>
	</footer>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
	<!-- script는 바디의 맨 마지막에-->
</body>
</html>

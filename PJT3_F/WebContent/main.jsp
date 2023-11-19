<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.ssafy.fit.model.Review"%>
<%@ page import="com.ssafy.fit.model.Video"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>SSAFIT</title>
<link rel="stylesheet" href="css/app.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css" />
</head>
<body>
	<header>
		<nav id="navbar-example2" class="navbar bg-body-tertiary px-3 mb-3">
			<a class="navbar-brand" href="index.html"> <img
				src="img/ssafit.png" width="60px" />
			</a>
			<ul class="nav nav-pills">
				<li class="nav-item"><a class="nav-link" href="main.jsp">HOME</a>
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

		<img src="img/mainImg.png" alt="" width="100%" />


	</header>

	<main> <br>
	<br>
	<div class="container">
		<div class="search">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
				fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
            <path
					d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
          </svg>
			&nbsp; 동영상 검색
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
	</div>
	<br>
	<br>

	<div class="container">
		<b> 최근 가장 많이 본 영상</b>
		<div id="carouselExample" class="carousel slide">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<div class="container video-View">
						<c:forEach var="video" items="${watchvideos}">
							<div>
								<a href="main?act=reviewlist&youtubeId=${video.getYoutubeId() }"><img
									src="http://img.youtube.com/vi/${video.getYoutubeId()}/0.jpg"
									class="d-block" width="350px" alt="..." /></a> ${video.getTitle() }
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExample" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExample" data-bs-slide="next">
				</svg>
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>

	<br>
	<div class="container">
		<b> 운동 부위 선택</b>
		<div>

			<form method="GET" action="main">
				<input type="hidden" name="act" value="part"> <input
					type="hidden" name="fitPartName" value="전신">
				<button type="submit" class="btn btn-primary">전신</button>
			</form>
			<form method="GET" action="main">
				<input type="hidden" name="act" value="part"> <input
					type="hidden" name="fitPartName" value="상체">
				<button type="submit" class="btn btn-secondary">상체</button>
			</form>
			<form method="GET" action="main">
				<input type="hidden" name="act" value="part"> <input
					type="hidden" name="fitPartName" value="하체">
				<button type="submit" class="btn btn-success">하체</button>
			</form>
			<form method="GET" action="main">
				<input type="hidden" name="act" value="part"> <input
					type="hidden" name="fitPartName" value="복부">
				<button type="submit" class="btn btn-danger">복부</button>
			</form>
		</div>
	</div>
	<div class="container">
		<div id="carouselExample1" class="carousel slide">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<div class="container video-View">
						<c:forEach var="video" items="${partvideos}">
							<div>
								<a href="main?act=reviewlist&youtubeId=${video.getYoutubeId()}">
								<img
		
									src="http://img.youtube.com/vi/${video.getYoutubeId()}/0.jpg"
									class="d-block" width="350px" alt="..." /></a> ${video.getTitle() }
							</div>
						</c:forEach>
					</div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExample1" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExample1" data-bs-slide="next">
					</svg>
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>

		<!-- 회원가입 -->
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
									type="text" class="form-control" id="recipient-name"
									name="name">
							</div>
							<div class="mb-3">
								<label for="recipient-name" class="col-form-label">아이디</label> <input
									type="text" class="form-control" id="recipient-name" name="id">
							</div>
							<div class="mb-3">
								<label for="recipient-name" class="col-form-label">비밀번호</label>
								<input type="password" class="form-control" id="recipient-name"
									name="pw">
							</div>

							<div class="modal-footer">
								<button type="submit" class="btn btn-outline-primary"
									data-bs-dismiss="modal">가입하기</button>
								<button type="reset" class="btn btn-outline-danger"
									data-bs-dismiss="modal">취소</button>
						</form>
					</div>
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

	<footer></footer>

	<!-- 	<script src="/02_front/main.js"></script> -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
	<!-- script는 바디의 맨 마지막에-->
</body>
</html>
</html>
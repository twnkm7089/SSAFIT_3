<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 테스트</title>
</head>
<body>
	<form action="test" method="POST">
		<input type="hidden" name="act" value="signUp">
	
		<label for="name">이름</label>
		<input type="text" id="name" name="name">
		<br>
		<label for="id">아이디</label>
		<input type="text" id="id" name="id">
		<br>
		<label for="password">비밀번호</label>
		<input type="password" id="password" name="password">
		<br>		
		<label for="checkPassword">비밀번호 확인</label>
		<input type="password" id="checkPassword" name="checkPassword">
		<br>
		<input type="submit" value="회원가입">
		<input type="reset" value="취소">
	</form>
	
	----------------------------------------------------------------------
	로그인
	<form action="test" method="POST">
		<input type="hidden" name="act" value="signIn">
		<label for="id">아이디</label>
		<input type="text" id="id" name="id">
		<br>
		<label for="password">비밀번호</label>
		<input type="password" id="password" name="password">
		<br>
		<input type="submit" value="로그인">
		<input type="reset" value="취소">
	</form>
</body>
</html>
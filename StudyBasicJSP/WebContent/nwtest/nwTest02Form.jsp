<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네트워크 테스트 2번 폼</title>
<link href="test02.css" rel="stylesheet" type="text/css">
</head>
<body>
<h2>개인 정보 조회</h2>
<form method="post" action="nwTest02Pro.jsp">
	<fieldset>
		<legend>로그인</legend>
			<label>아이디</label>
			<input type="text" name="id"><br>
			<label>비밀번호</label>
			<input type="password" name="passwd"><br>
	</fieldset>	
	<fieldset>
		<legend>개인정보</legend>
			<label>이름</label>
			<input type="text" name="name"><br>
			<label>성별</label>
			남<input type="radio" name="gender">여<input type="radio" name="gender"><br>
			<label>취미</label>
			독서<input type="checkbox" name="hobby">&nbsp;
			음악감상<input type="checkbox" name="hobby">&nbsp;
			영화감상<input type="checkbox" name="hobby">&nbsp;
			등산<input type="checkbox" name="hobby">&nbsp;
			여행<input type="checkbox" name="hobby">&nbsp;
	</fieldset>
	<input type="submit" value="가입하기">
	<input type="reset" value="다시작성">
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네트워크 테스트 1번 폼</title>
<link href="test01.css" rel="stylesheet" type="text/css">
</head>
<body>
<form method="post" action="nwTest01Pro.jsp">
<h2>회원 가입</h2>
<fieldset>
	<legend>로그인</legend>
		<label>아이디</label>
		<input type="text" name="id"><br>
		<label>비밀번호</label>
		<input type="password" name="passwd"><br>
		<label>비밀번호 확인</label>
		<input type="password" name="passwd2">
</fieldset>	
<fieldset>
	<legend>개인정보</legend>
		<label>이름</label>
		<input type="text" name="name"><br>
		<label>메일</label>
		<input type="email" name="email"><br>
		<label>전화번호</label>
		<input type="tel" name="tel"><br>
		<label>주소</label>
		<input type="text" name="address">
</fieldset>
<input type="submit" value="가입하기">
<input type="reset" value="다시작성">
</form>
</body>
</html>
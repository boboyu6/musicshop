<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네트워크 테스트 3번 폼</title>
<link href="test03.css" rel="stylesheet" type="text/css">
</head>
<body>
<form method="post" action="nwTest03Pro.jsp">
<h2>웹프로그래밍 개발자 지원서</h2>
<p>Java, JSP, Spring, Oracle, HTML5/CSS3, JavaScript에 대한 기술적 이해와 경험이 있는 분을 찾습니다.
<hr>
<h3>개인정보</h3>
<label>이름<input type="text" name="name">
</label><br>
<label>연락처<input type="tel" name="tel"></label>
<hr>
<h3>지원분야</h3>
<input type="radio" name="job" checked="checked"> JSP, Spring 개발자(백엔드 개발자)<br>
<input type="radio" name="job"> HTML5/CSS3,Javascript 개발자(프런트엔드 개발자)<br>
<input type="radio" name="job"> Oracle 서버 개발자 (DB 서버 개발자)
<hr>
<h3>지원 동기</h3>
<textarea name="content" cols="70" rows="10"></textarea>
<hr>
<input type="submit" value="접수하기">
<input type="reset" value="다시 쓰기">
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네트워크 테스트 3번 처리</title>
<link href="test03.css" rel="stylesheet" type="text/css">
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="jobBean" class="nwtest.JobApplicationBean">
<jsp:setProperty name="jobBean" property="*"/>
</jsp:useBean>
<h2>회원 가입 결과</h2>
<p>회원가입을 축하드립니다.</p>
<p>회원님의 정보를 알려드립니다.</p>

<table border="1">
<tr>
	<td width="100">이름</td>
	<td><jsp:getProperty property="name" name="jobBean"/></td>
</tr>
<tr>
	<td>연락처</td>
	<td><jsp:getProperty property="tel" name="jobBean"/></td>
</tr>
<tr>
	<td>지원분야</td>
	<td><jsp:getProperty property="job" name="jobBean"/></td>
</tr>
<tr>
	<td>지원동기</td>
	<td><jsp:getProperty property="content" name="jobBean"/></td>
</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네트워크 테스트 1번 처리</title>
<link href="test01.css" rel="stylesheet" type="text/css">
</head>
<body>
<h2>회원 가입 결과</h2>
<p>회원 가입을 축하드립니다</p>
<p>회원님의 정보를 알려드립니다</p>
<% request.setCharacterEncoding("utf-8"); %>
<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String passwd = request.getParameter("passwd");
String email = request.getParameter("email");
String tel = request.getParameter("tel");
String address = request.getParameter("address");
%>
<table border="1">
	<tr>
		<td>아이디</td>
		<td><%=id %></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><%=passwd %></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><%=name %></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><%=email %></td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td><%=tel %></td>
	</tr>
	<tr>
		<td>주소</td>
		<td><%=address %></td>
	</tr>
</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네트워크 테스트 2번 처리</title>
<link href="test02.css" rel="stylesheet" type="text/css">
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>
<h2>개인 정보 조회 결과</h2>
<p>회원님의 정보를 알려드립니다.
<%
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
String name = request.getParameter("name");
String gender = request.getParameter("gender");
String hobby = request.getParameter("hobby");
%>
<table border="1">
<tr>
	<td width="80">이름</td>
	<td><%=name %></td>
</tr>
<tr>
	<td>성별</td>
	<td><%=gender %></td>
</tr>
<tr>
	<td>취미</td>
	<td><%=hobby %></td>
</tr>
</table>
<%
if(id.equals("admin")) {%>
<%} else { %>
<script>
	alert("아이디를 잘못 입력하셨습니다");
	history.go(-1);
</script>
<%} %>
<%
if(passwd.equals("123456")) {%>
<%} else { %>
<script>
	alert("비밀번호를 잘못 입력하셨습니다");
	history.go(-1);
</script>
<%} %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../etc/color.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제계좌 등록</title>
<link href="../etc/style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="<%=bodyback_c%>">
<%
String buyer = (String)session.getAttribute("id");

if(buyer == null) {
	response.sendRedirect("shopMain.jsp");
} else {
%>
<h3><%=buyer %>님의 계좌등록</h3>
<form method="post" action="insertAccountPro.jsp">
<table align="center">
	<tr>
		<td width="60" align="center">결제계좌</td>
		<td width="200">
			<input type="text" name="account">
		</td>
	</tr>
	<tr>
		<td width="60" align="center">결제은행</td>
		<td width="200">
			<input type="text" name="bank">
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="확인">&nbsp;
			<input type="button" value="취소" onclick="javascript:window.location='buyForm.jsp'">
		</td>
	</tr>
</table>
</form>
<%
}
%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ch13.board.BoardDBBean" %>
<%@ page import="ch13.board.BoardDataBean" %>
<%@ include file="../etc/color.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 - 수정</title>
<link href="../etc/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../etc/script.js"></script>
</head>
<body>
<%
int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");
String strV = "";
try {
	BoardDBBean dbPro = BoardDBBean.getInstance();
	BoardDataBean article = dbPro.updateGetArticle(num);
%>
<p>글수정</p>
<br>
<form method="post" action="updatePro.jsp?pageNum=<%=pageNum %>" name="writeform" onsubmit="return writeSave()">
<table>
<tr>
	<td width="70" align="center">이름</td>
	<td align="left" width="330">
		<input type="text" size="30" maxlength="30" name="writer"
		value="<%=article.getWriter() %>" style="ime-mode:active;">
		<input type="hidden" name="num" value="<%=article.getNum() %>">
	</td>
</tr>
<tr>
	<td width="70" align="center">제목</td>
	<td align="left" width="330">
		<input type="text" size="70" maxlength="70" name="subject"
		value="[수정] <%=article.getSubject() %>" style="ime-mode:active;">
	</td>
</tr>
<tr>
	<td width="70" align="center">Email</td>
	<td align="left" width="330">
		<input type="text" size="70" maxlength="70" name="email"
		value="<%=article.getEmail() %>" style="ime-mode:inactive;">
	</td>
</tr>
<tr>
	<td width="70" align="center">내용</td>
	<td align="left" width="330"><textarea name="content" rows="13" cols="90" style="ime-mode:active;"><%=article.getContent()%></textarea>		
	</td>
</tr>
<tr>
	<td width="70" align="center">비밀번호</td>
	<td align="left" width="330">
		<input type="password" size="8" maxlength="12" name="passwd" style="ime-mode:inactive;">
	</td>
</tr>
<tr>
	<td colspan=2 align="center">
		<div id="button">
			<input type="submit" value="글수정">
			<input type="reset" value="다시작성">
			<input type="button" value="목록보기"
			onclick="document.location.href='list.jsp?pageNum=<%=pageNum %>'">
		</div>	
	</td>
</tr>	
</table>
</form>
<%
} catch(Exception e) { e.printStackTrace(); }
%>
</body>
</html>
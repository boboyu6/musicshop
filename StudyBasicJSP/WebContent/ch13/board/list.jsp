<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ch13.board.BoardDBBean" %>
<%@ page import="ch13.board.BoardDataBean" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="../etc/color.jspf" %>
<!DOCTYPE html>
<html>
<head>
<link href="../etc/style.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>자동차 정보공유게시판</title>
</head>
<body bgcolor="<%=bodyback_c %>" class="list_bottom">
<%!
int pageSize = 10;
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<%
String pageNum = request.getParameter("pageNum");

if(pageNum == null) {
	pageNum = "1";
}

int currentPage = Integer.parseInt(pageNum); //현재 페이지 번호
int startRow = (currentPage -1 ) * pageSize + 1; // 현재 페이지의 시작 번호
int endRow = currentPage * pageSize; // 현재 페이지의 끝 번호
int count = 0; // 전체 글 수
int number = 0; // 
List<BoardDataBean> articleList = null;

BoardDBBean dbPro = BoardDBBean.getInstance();
count = dbPro.getArticleCount();

if(count > 0) {
	articleList = dbPro.getArticles(startRow, pageSize);
}

number = count-(currentPage-1) * pageSize; // 전체페이지에서 현재페이지의 첫번째 글 순서
%>
<p>자동차 정보 공유 게시판<br>(작성된 전체 글:<%=count %>개)</p>

<table>
	<tr>
		<td align="right">
			<a href="writeForm.jsp">글쓰기</a>
		</td>
	</tr>	
</table>

<% if(count ==0 ) { %>

<table>
<tr>
	<td align="center">
	게시판에 저장된 글이 없습니다.
	</td>
</table>

<% } else { %>
<table>
<tr height="30" bgcolor="<%=value_c%>">
	<td align="center" width="50">번호</td>
	<td align="center" width="250">제목</td>
	<td align="center" width="100">작성자</td>
	<td align="center" width="150">작성일</td>
	<td align="center" width="50">조회</td>
	<td align="center" width="100">IP</td>
</tr>
<%
for(int i=0; i<articleList.size(); i++) {
	BoardDataBean article = articleList.get(i);
%>
<tr height="30">
	<td width="50"> <%=number-- %></td>
	<td width="500" align="left">
<%
	int wid=0;
if(article.getRe_level()>0) {
	wid=5*(article.getRe_level());
%>
<img src="../images/level.png" width="<%=wid %>" height="16">
<img src="../images/re.png">
<% } else { %>
<%-- <img src="../images/level.png" width="<%=wid %>" height="16"> --%>	
<% } %>

<a href="content.jsp?num=<%=article.getNum() %>&pageNum=<%=currentPage %>">
<%=article.getSubject() %></a>
<% if(article.getReadcount() >= 10) { %>
	<img src="../images/hot.gif" border="0" height="16"> <% } %> </td>
	<td width="120" align="left">
	<a href="mailto:<%=article.getEmail() %>"><%=article.getWriter() %></a></td>
	<td width="150"><%=sdf.format(article.getReg_date()) %></td>
	<td width="50"><%=article.getReadcount() %></td>
	<td width="100"><%=article.getIp() %></td>
	</tr>
<% } %>
</table>
<% } %>
<table>
	<tr>
	<td>
<%
if(count > 0) {
	int pageCount = count /pageSize + (count % pageSize == 0? 0 : 1);
	int startPage = 1;
	// 시작페이지 번호설정, pageBlock이 10이면 1, 11, 21
	if(currentPage % 10 != 0) {
		startPage = (int)(currentPage/10)*10+1;
	} else {
		startPage = (int)(currentPage/10-1)*10+1;
	}
	
	int pageBlock = 10; // 한 페이지에 나타낼 페이지의 수
	int endPage = startPage + pageBlock - 1; 
	if(endPage > pageCount) endPage = pageCount;
	
	if(startPage > 10) { %>
	
	<a href="list.jsp?pageNum=<%=startPage-10 %>">[이전]</a>
<% }
	
	for(int i=startPage; i<= endPage; i++) { %>
		<a href="list.jsp?pageNum=<%=i %>">[<%=i %>]</a>
<% }
	
	if(endPage < pageCount) { %>
		<a href="list.jsp?pageNum=<%=startPage + 10 %>">[다음]</a>
		
<%
	}
}
%>
</td>
</tr>
</table>
</body>
</html>
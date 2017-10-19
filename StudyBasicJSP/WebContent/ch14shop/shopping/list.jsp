<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ch14.bookshop.master.ShopBookDBBean" %>
<%@ page import="ch14.bookshop.master.ShopBookDataBean" %>
<%@ page import="java.util.List" %>    
<%@ page import="java.text.NumberFormat" %>
<%@ include file="../etc/color.jspf" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Shopping Mall</title>
<link href="../etc/style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="<%=bodyback_c%>">
<%
String book_kind = request.getParameter("book_kind");
%>
<table>
<tr>
	<td width="150" valign="top">
		<jsp:include page="../module/left.jsp" flush="false"/>
	</td>
	<td width="700">
<%
List<ShopBookDataBean> bookLists = null;
ShopBookDataBean bookList = null;
String book_kindName = "";

ShopBookDBBean bookProcess = ShopBookDBBean.getInstance();

bookLists = bookProcess.getBooks(book_kind);
if(book_kind.equals("100")) {
	book_kindName="문학";
} else if(book_kind.equals("200")) {
	book_kindName="자기계발";
} else if(book_kind.equals("300")) {
	book_kindName="IT 모바일";
} else if(book_kind.equals("400")) {
	book_kindName="여행";
} else if(book_kind.equals("500")) {
	book_kindName="자연과학";	
} else if(book_kind.equals("all")) {
	book_kindName="전체";
}
%>
<h3><b><%=book_kindName%> 분류의 목록</b></h3>
	<a href="shopMain.jsp">메인으로</a>
<%
for(int i=0; i<bookLists.size(); i++) {
	bookList = (ShopBookDataBean)bookLists.get(i);
%>
<table>
<tr height="30" bgcolor="<%=value_c %>">
	<td rowspan="4" width="100">
		<a href="bookContent.jsp?book_id=<%=bookList.getBook_id()%>&book_kind=<%=book_kind%>">
		<img src="../../imageFile/<%=bookList.getBook_image()%>" border="0" width="60" height="90">
		</a>
	</td>
	<td width="350"><font size="+1"><b>
		<a href="bookContent.jsp?book_id=<%=bookList.getBook_id()%>&book_kind=<%=book_kind%>">
		<%=bookList.getBook_title()%></a></b></font>
	</td>
	<td rowspan="4" width="100" align="center" valign="middle">
		<%if(bookList.getBook_count()==0){%>
			<font color="red"><b>일시품절</b></font>
		<%} else { %>
			<img src="../../imageFile/sale.gif">
			<!-- <font color="blue"><b>강력추천</b></font> -->
		<%} %>
	</td>
</tr>
<tr height="30" bgcolor="<%=value_c %>">
	<td width="350">출판사 : <%=bookList.getPublishing_com()%></td>
</tr>
<tr height="30" bgcolor="<%=value_c %>">
	<td width="350">저자 : <%=bookList.getAuthor()%></td>
</tr>
<tr height="30" bgcolor="<%=value_c %>">
	<td width="350">정가 :
	<%=NumberFormat.getInstance().format(bookList.getBook_price())%>원<br>
	판매가 : <b><font color="red" size="5">
	<%=NumberFormat.getInstance().format((int)(bookList.getBook_price()*((double)(100-bookList.getDiscount_rate())/100)))%>
	</font>원</b></td>
</tr>
</table>
<br>	
<% } %>
</td>
</tr>
</table>
</body>
</html>
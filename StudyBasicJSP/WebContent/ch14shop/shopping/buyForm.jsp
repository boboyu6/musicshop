<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ch14.bookshop.shopping.CartDataBean" %>
<%@ page import="ch14.bookshop.shopping.CartDBBean" %>
<%@ page import="ch14.bookshop.shopping.CustomerDataBean" %>
<%@ page import="ch14.bookshop.shopping.CustomerDBBean" %>
<%@ page import="ch14.bookshop.shopping.BankDBBean" %>
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
String buyer = (String)session.getAttribute("id");

List<CartDataBean> cartLists = null;
List<String> accountLists = null;
CartDataBean cartList = null;
CustomerDataBean member = null;
int number = 0;
int total = 0;

if(session.getAttribute("id")==null) {
	response.sendRedirect("shopMain.jsp");
} else {
	CartDBBean bookProcess = CartDBBean.getInstance();
	cartLists = bookProcess.getCart(buyer);
	
	CustomerDBBean memberProcess = CustomerDBBean.getInstance();
	
	member = memberProcess.getMember(buyer);
	
	BankDBBean bankProcess = BankDBBean.getInstance();
	accountLists = bankProcess.getAccount(buyer);
%>
<h3><b>구매목록</b></h3>

<form name="inform" method="post" action="updateCart.jsp">
<table>
	<tr>
		<td width="50"><b>번호</b></td>
		<td width="300"><b>책이름</b></td>
		<td width="100"><b>판매가격</b></td>
		<td width="150"><b>수량</b></td>
		<td width="150"><b>금액</b></td>
	</tr>
<%
for(int i=0; i<cartLists.size(); i++) {
	cartList = cartLists.get(i);
%>
	<tr>
		<td width="50"><%=++number %></td>
		<td width="350" align="left">
			<img src="../../imageFile/<%=cartList.getBook_image() %>" border="0" width="30" height="50" align="middle">&nbsp;
			<%=cartList.getBook_title() %>
		</td>
		<td width="100"><%=NumberFormat.getInstance().format(cartList.getBuy_price()) %></td>
		<td width="150"><%=cartList.getBuy_count() %></td>
		<td width="150"><%total += cartList.getBuy_count()*cartList.getBuy_price(); %>
		<%=NumberFormat.getInstance().format(cartList.getBuy_count()*cartList.getBuy_price()) %>
		</td>
	</tr>
<% }%>
	<tr>
		<td colspan="5" align="right" style="padding-right:35px"><font color="blue" size="3"><b>총구매금액: <%=NumberFormat.getInstance().format(total)%>원</b></font></td>
	</tr>		
</table>
</form>
<% } %>
<br>
<script type="text/javascript">
	function selectAccount(name) {
		var account = document.getElementById("accountList").value;
		javascript:window.location= name + 'AccountForm.jsp?accountList=' + account;
	}
</script>
<form method="post" action="buyPro.jsp" name="buyinput">
<table>
	<tr>
		<td colspan="2"><font size="+1"><b>주문자 정보</b></font></td>
	</tr>
	<tr>
		<td width="200" align="left">성명</td>
		<td width="400" align="left"><%=member.getName() %></td>
	</tr>
	<tr>
		<td width="200" align="left">전화번호</td>
		<td width="400" align="left"><%=member.getTel() %></td>
	</tr>
	<tr>
		<td width="200" align="left">주소</td>
		<td width="400" align="left"><%=member.getAddress() %></td>
	</tr>
	<tr>
		<td width="200" align="left">결제계좌</td>
		<td width="400" align="left">
			<select name="account" id="accountList">
			<%
			String accountList = "";
			for(int i=0; i<accountLists.size(); i++) {
				accountList = accountLists.get(i);
			%>
				<option value="<%=accountList %>"><%=accountList %></option>
			<% } %>
			</select>
		</td>	
	</tr>
	<tr>
		<td colspan="2" align="center" bgcolor="<%=value_c %>">
			<input type="button" value="계좌등록" onclick="javascript:window.location='insertAccountForm.jsp'">&nbsp;
			<input type="button" value="계좌수정" onclick="selectAccount('update')">&nbsp;
			<input type="button" value="계좌삭제" onclick="selectAccount('delete')">
		</td>
</table>
<br>
<table>
	<tr>
		<td colspan="2" align="center"><font size="+1"><b>배송지 정보</b></font></td>
	</tr>
	<tr>
		<td width="200" align="left">성명</td>
		<td width="400" align="left">
			<input type="text" name="deliveryName" value="<%=member.getName() %>">
		</td>
	</tr>
	<tr>
		<td width="200" align="left">전화번호</td>
		<td width="400" align="left">
			<input type="text" name="deliveryTel" value="<%=member.getTel() %>">
		</td>
	</tr>
	<tr>
		<td width="200" align="left">주소</td>
		<td width="400" align="left">
			<input type="text" name="deliveryAddress" value="<%=member.getAddress() %>">
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center" bgcolor="<%=value_c %>">
			<input type="submit" value="확인">
			<input type="button" value="취소" onclick="javascript:window.location='shopMain.jsp'">
		</td>	
	</tr>
</table>
</form>
</body>
</html>
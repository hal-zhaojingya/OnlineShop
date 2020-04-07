<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>パスワード変更</title>
</head>
<body>
<%@include file="../header.jsp" %>
	<h1 class="body_h1">パスワード変更</h1>
	<form action="passchange" method="post" class="h-adr" id="myForm">
		<input type="hidden" name="customerid" value="<%= session.getAttribute("CustomerId") %>">
		<div class="address_div">
			<ul class="input_address">
				<li class="address_text">パスワード</li>
				<li><label><input type="text" name="admin_pass" class="form_control address_li"></label></li>
				<li><input type="submit" value="パスワード変更" class="form_control btn address_btn"></li>
			</ul>
		</div>
	</form>
	<br>
	<br>
	<%@include file="../footer.jsp" %>
</body>
</html>
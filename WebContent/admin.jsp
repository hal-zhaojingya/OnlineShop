<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IDLE</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/ress.css" rel="stylesheet" type="text/css">
<style>
.img {
width: 100px;
}
.adminwrap {
	width: 250px;
	height: 80px;
	border: 1px solid #ddd;
	border-radius: 5px;
	margin-left: 120px;
	margin-top: 30px;
	margin-bottom: 30px;
	float: left;
}
.adminwrap img {
	margin-left: 40px;
	margin-top: 15px;
	float: left;
}
.adminwrap p {
	margin-right: 60px;
	margin-top: 30px;
	float: right;
	font-size: 18px;
}
.adminmember {
	width: 980px;
}
.adminmember h2 {
	text-align: center;
	margin-bottom: 50px;
}
.adminmember img {
	float: left;
	margin-left: 250px;
	margin-right: 120px;
}
.membertable tr td {
	width: 250px;
	height: 40px;
	text-align: center;
}
</style>
</head>
<body id="top">
	<%@include file="../header.jsp" %>
	<h1 class="body_h1">アカウントサービス</h1>
		<div class="adminmember">
		<h2>アカウントの情報</h2>
			<img src='images/<%= request.getAttribute("CusPortrait") %>' class="img">
			<table class="membertable">
				<tr>
					<td>ユーザ名：</td>
					<td><%= request.getAttribute("CustomerName") %></td>
					<td>
						<a href="adminchange.jsp">変更</a>
					</td>
				</tr>
				<tr>
					<td>パスワード：</td>
					<td><%= request.getAttribute("pass") %></td>
					<td>
						<a href="passchange.jsp">変更</a>
					</td>
				</tr>
				<tr>
					<td>eメール：</td>
					<td><%= request.getAttribute("email") %></td>
					<td>
						<a href="mailchange.jsp">変更</a>
					</td>
				</tr>
			</table>
		</div>
		<div class="adminwrap">
			<form action="admin" method="post">
				<img src="images/cyumon.png" style="width:50px;">
				<p><input type="submit" value="注文履歴"></p>
			</form>
		</div>
		<div class="adminwrap">
			<form action="#" method="post">
				<img src="images/kasu.png" style="width:50px;">
				<p><input type="submit" value="貸す履歴"></p>
			</form>
		</div>
		<div class="adminwrap">
			<form action="ownmsg" method="post">
				<img src="images/kari.png" style="width:50px;">
				<input type="hidden" name="customerid" value="<%= session.getAttribute("CustomerId") %>">
				<p><input type="submit" value="借りたい"></p>
			</form>
		</div>
		<div class="adminwrap">
			<form action="review" method="post">
				<img src="images/hyouka.png" style="width:50px;">
				<input type="hidden" name="customerid" value="<%= session.getAttribute("CustomerId") %>">
				<p><input type="submit" value="評価管理"></p>
			</form>
		</div>
		<div class="adminwrap">
			<form action="addresslist" method="post">
				<img src="images/todoku.png" style="width:50px;">
				<input type="hidden" name="customerid" value="<%= session.getAttribute("CustomerId") %>">
				<p><input type="submit" value="お届け先"></p>
			</form>
		</div>
		<div class="adminwrap">
			<form action="favorite" method="post">
				<img src="images/hoshii.png" style="width:50px;">
				<input type="hidden" name="customerid" value="<%= session.getAttribute("CustomerId") %>">
				<p><input type="submit" value="欲しい物"></p>
			</form>
		</div>

	<%@include file="../footer.jsp" %>

</body>
</html>
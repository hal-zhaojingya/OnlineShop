<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>削除成功</title>
<style>
	h1 {
		margin-top: 220px;
		text-align: center;
	}
	button {
		color:#444;
		font-size: 16px;
		letter-spacing: 2px;
		text-align: center;
		margin-left: 585px;
	}
</style>
</head>
<body>
	<h1>削除しました</h1>
	<form action="favorite" method="post">
		<input type="hidden" name="customerid" value="<%= session.getAttribute("CustomerId") %>">
		<button type="submit">ここに戻る</button>
	</form>
</body>
</html>
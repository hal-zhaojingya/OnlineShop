<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ほしいものリストに追加</title>
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
<h1>ほしいものリストに追加しました</h1>
<form action="goodslist" method="post">
	<input type="hidden" name="GoodsId" value="<%= request.getAttribute("GoodsId") %>">
	<button type="submit">ここに戻る</button>
</form>
</body>
</html>
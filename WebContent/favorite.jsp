
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ほしいものリスト</title>
</head>
<body>
	<%@include file="header.jsp" %>
	<h1 class="body_h1">ほしいものリスト</h1>
	<% ArrayList<HashMap<String, String>> list = (ArrayList<HashMap<String, String>>)request.getAttribute("favorite"); %>
		<article class="product-sec2">
 				<% for(int i = 0; i < list.size(); i++) { %>
 				<% HashMap<String, String> row = list.get(i); %>
			<section class="product">
				<div class="item-info-product ">
					<img src="images/<%= row.get("ImgSrcMain")%>" alt="" class="product-images">
						<form action="goodslist" method="post">
							<input type="hidden" name="GoodsId" value="<%= row.get("GoodsId") %>">
							<button type="submit" name="submit" value="<%= row.get("GoodsName")%>" class="submit_text"><%= row.get("GoodsName")%></button>
						</form>
						<div class="info-product-price">
							<span class="item_price">\<%= row.get("GoodsUnitPrice")%>/日</span>
						</div>
						<form action="favoritedelete" method="post">
							<input type="hidden" name="favoriteid" value="<%= row.get("favoriteid")%>">
							<input type="submit" value="削除" style="color: red;">
						</form>
				</div>
			</section>
		<% } %>
		</article>
<%@include file="footer.jsp" %>
</body>
</html>
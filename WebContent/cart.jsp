<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IDLE</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<style>
table tr td .total {
	margin-left: 100px;
}
.souka {
	margin-left: 100px;
}
</style>
</head>
<body id="top" onload="initialize()">
	<%@include file="../header.jsp" %>
	<h1 class="body_h1">ショッピングカート：<%= request.getAttribute("rowCount") %>点</h1>
	<% ArrayList<HashMap<String, String>> list = (ArrayList<HashMap<String, String>>)request.getAttribute("cart"); %>
 	<% for(int i = 0; i < list.size(); i++) { %>
 	<% HashMap<String, String> row = list.get(i); %>
	<section class="cart">
			<div class="container">
				<div class="row">
					<div class="text-center">
						<table class="table table-condensed" style="border-collapse:collapse">
							<thead>
								<tr>
									<th style="width:20%">商品イメージ</th>
									<th style="width:30%">商品名</th>
									<th style="width:10%">単価</th>
									<th style="width:16%">数量</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td data-th="Product">
										<div class="row">
											<div class="text-left" style="display:flex;justify-content:center;align-items:center;width:300px;height:230px;">
												<img src="images/<%= row.get("ImgSrcMain")%>" alt="" style="position:abosolute;top: 50%;" class="product-images cart_product">
											</div>
										</div>
									</td>
									<td data-th="Product">
										<div class="row">
											<div class="text-name">
												<p><%= row.get("GoodsName")%></p>
											</div>
										</div>
									</td>
									<td class="price">
									<input type="hidden" value="<%= row.get("GoodsUnitPrice")%>">
									\<%= row.get("GoodsUnitPrice")%>/日</td>
									<td class="quantity">
										<input type="number" class="form-control text-center" value="<%= row.get("count")%>">
									<td class="actions">
										<form action="cartdelete" method="post">
											<div class="text-right">
												<input type="hidden" name="goodsid" value="<%= row.get("GoodsId")%>">
												<input type="hidden" name="customerid" value="<%= session.getAttribute("CustomerId") %>">
												<button class="btn-delete" type="submit"><img src="images/delete_icon.png" width="15px"></button>
											</div>
										</form>
									</td>
								</tr>
							</tbody>
						</table>
						<br>
							<div>
								<p style="margin-right: 130px;float:right;">商品の小記(<%= row.get("count")%>点)：
								円 </p><br>
							</div>
							<br>
							<% } %>
							<div>
								<p style="margin-right: 130px;float:right;">ご請求額：
								\</p>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
						<div class="single_item">
							<form action="#" method="post">
									<input type="submit" name="submit" value="レジに進む" class="button" style="margin:50px 0 50px 900px;">
							</form>
						</div>
				</div>
			</div>
		</section>

	<%@include file="../footer.jsp" %>

</body>
</html>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品一覧</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<style>
.index_menu dl dt {
	font-weight: bold;
	margin-top: 5px;
}
</style>
</head>
<body>
<%@include file="header.jsp" %>
	<h1 class="body_h1"><%= request.getAttribute("GoodsTypeName")%></h1>
	<div class="index_menu">
	<h3>カテゴリー</h3>
		<form action="search_price" method="post">
		<dl>
			<dt>並べ替え</dt>
			<dd>
				<ul>
					<li><input type="checkbox">価格の安い順番</li>
					<li><input type="checkbox">価格の高い順番</li>
					<li><input type="checkbox">レビューの評価順</li>
					<li><input type="checkbox">最新商品</li>
				</ul>
			</dd>
		</dl>
		<dl>
			<dt>値段</dt>
			<dd>
				<input type="text" style="border: 1px solid black;width:50px;background:#fff;" onkeyup="(this.v = function(){this.value  = this.value.replace(/[*a-z-A-Z-]+/,'');}).call(this)" onblur="this.v();" />
				～
				<input type="text" style="border: 1px solid black;width:50px;background:#fff;" onkeyup="(this.v = function(){this.value  = this.value.replace(/[*a-z-A-Z-]+/,'');}).call(this)" onblur="this.v();" />
			</dd>
		</dl>
		<dl>
		<dt>ブランド</dt>
			<dd>
				<ul>
					<li><input type="checkbox">Nintendo Switch</li>
					<li><input type="checkbox">プレイステーション4</li>
					<li><input type="checkbox">Xbox One</li>
					<li><input type="checkbox">VR</li>
					<li><input type="checkbox">コントローラー</li>
					<li><input type="checkbox">ゲームソフト</li>
					<li><input type="checkbox">ゲームダウンロード</li>
					<li><input type="checkbox">ゲーム攻略本</li>
					<li><input type="checkbox">PCゲーム</li>
				</ul>
				<input type="submit" value="送信">
				<input type="reset" value="リセット">
			</dd>
		</dl>
		</form>
	</div>
		<% ArrayList<HashMap<String, String>> list = (ArrayList<HashMap<String, String>>)request.getAttribute("kategorie"); %>
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

				</div>
			</section>
		<% } %>
		</article>
<%@include file="footer.jsp" %>
</body>
</html>
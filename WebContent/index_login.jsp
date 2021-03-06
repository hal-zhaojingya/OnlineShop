<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IDLE</title>
</head>
<body id="top">
	<%@include file="../header.jsp" %>
	<div class="all" id="all">
    <div class="screen" id="screen">
            <img src="images/banner1.jpg" width="100%" height="600">
    </div>
</div>
	<h1 class="body_h1">おすすめ商品</h1>
	<div class="index_menu">
	<h3>カテゴリー</h3>
		<dl>
			<dt>ファッション</dt>
			<dd>
				<ul>
					<li><a href="#">メンズ</a></li>
					<li><a href="#">レディーズ</a></li>
					<li><a href="#">キーズ＆ベビー</a></li>
				</ul>
			</dd>
		</dl>
		<dl>
			<dt>ウェディング</dt>
			<dd>
				<ul>
					<li><a href="#">和服</a></li>
					<li>
					<a href="kategorie?kategorieid=5">ウェディングドレス</a>
					</li>
					<li><a href="#">スーツ</a></li>
					<li><a href="#">演出用</a></li>
					<li><a href="#">アクセサリー</a></li>
				</ul>
			</dd>
		</dl>
		<dl>
			<dt>おもちゃ＆ゲーム</dt>
			<dd>
				<ul>
					<li><a href="#">お人形</a></li>
					<li>
					<a href="kategorie?kategorieid=10">ゲーム機</a>
					</li>
					<li><a href="#">パーティーゲーム</a></li>
				</ul>
			</dd>
		</dl>
		<dl>
			<dt>車</dt>
			<dd>
				<ul>
					<li><a href="#">大型車</a></li>
					<li><a href="#">小型車</a></li>
				</ul>
			</dd>
		</dl>
		<dl>
			<dt>スマートフォン＆カメラ</dt>
			<dd>
				<ul>
					<li><a href="#">スマートフォン</a></li>
					<li><a href="#">カメラ</a></li>
					<li><a href="#">パソコン</a></li>
				</ul>
			</dd>
		</dl>
		<dl>
			<dt>家電</dt>
			<dd>
				<ul>
					<li><a href="#">家庭用</a></li>
					<li><a href="#">オフェンス用</a></li>
				</ul>
			</dd>
		</dl>
		<dl>
			<dt>スポーツ＆アウトドア</dt>
			<dd>
				<ul>
					<li>
					<a href="kategorie?kategorieid=19">キャンプ</a>
					</li>
					<li><a href="#">旅行</a></li>
					<li><a href="#">花見</a></li>
					<li><a href="#">ピクニック</a></li>
				</ul>
			</dd>
		</dl>
		<dl>
			<dt>本</dt>
			<dd>
				<ul>
					<li><a href="#">洋書</a></li>
					<li><a href="#">ミュージック</a></li>
					<li><a href="#">学生用書</a></li>
				</ul>
			</dd>
		</dl>
		<dl>
			<dt>楽器</dt>
			<dd>
				<ul>
					<li><a href="#">演出用</a></li>
					<li><a href="#">家庭用</a></li>
				</ul>
			</dd>
		</dl>
		<dl>
			<dt>ベビー＆マタニティ</dt>
			<dd>
				<ul>
					<li><a href="#">ベビーカー</a></li>
				</ul>
			</dd>
		</dl>
	</div>


		<!-- product-game -->
		<% ArrayList<HashMap<String, String>> list = (ArrayList<HashMap<String, String>>)request.getAttribute("member"); %>
		<div class="product-sec1">
			<h3 class="heading-tittle">ゲームのベストセラー</h3>
 				<% for(int i = 0; i < 1; i++) { %>
 				<% HashMap<String, String> row = list.get(i); %>
			<div class="product">
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
			</div>
		<% } %>
		<% for(int i = 1; i < 3; i++) { %>
 				<% HashMap<String, String> row = list.get(i); %>
			<div class="product">
				<div class="item-info-product ">
					<img src="images/<%= row.get("ImgSrcMain")%>" alt="" class="product-images">
						<form action="#" method="post">
							<input type="hidden" name="GoodsId" value="<%= row.get("GoodsId") %>">
							<button type="submit" name="submit" value="<%= row.get("GoodsName")%>" class="submit_text"><%= row.get("GoodsName")%></button>
						</form>
						<div class="info-product-price">
							<span class="item_price">\<%= row.get("GoodsUnitPrice")%>/日</span>
						</div>

				</div>
			</div>
		<% } %>


		</div>
		<!-- product-wedding -->

		<article class="product-sec1">
			<h3 class="heading-tittle">ウェディングのベストセラー</h3>
 				<% for(int i = 3; i < 6; i++) { %>
 				<% HashMap<String, String> row = list.get(i); %>
			<section class="product">
				<div class="item-info-product ">
					<img src="images/<%= row.get("ImgSrcMain")%>" alt="" class="product-images">
						<form action="#" method="post">
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

		<!-- product-camp -->

		<article class="product-sec1">
			<h3 class="heading-tittle">キャンプのベストセラー</h3>
 				<% for(int i = 6; i < 9; i++) { %>
 				<% HashMap<String, String> row = list.get(i); %>
			<section class="product">
				<div class="item-info-product ">
					<img src="images/<%= row.get("ImgSrcMain")%>" alt="" class="product-images">
						<form action="#" method="post">
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
	<script src="js/slideshow.js"></script>

</body>
</html>
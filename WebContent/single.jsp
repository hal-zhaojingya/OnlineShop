<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/ress.css" rel="stylesheet" type="text/css">
<link href="css/css.css" rel="stylesheet" type="text/css" />
<script src="js/js.js" type=text/javascript></script>
<title>Insert title here</title>
</head>
<body>
	<%@include file="../header.jsp" %>
		<h1 class="body_h1">商品</h1>
			<div id="ifocus">
				<div id="ifocus_pic">
					<div id="ifocus_piclist" style="left:0; top:0;">
						<ul>
							<li><a href="#"><img src="images/<%= request.getAttribute("ImgSrcMain") %>" alt="" /></a></li>
							<li><a href="#"><img src="images/<%= request.getAttribute("ImgSrc02") %>" alt="" /></a></li>
							<li><a href="#"><img src="images/<%= request.getAttribute("ImgSrc03") %>" alt="" /></a></li>
							<li><a href="#"><img src="images/<%= request.getAttribute("ImgSrc04") %>" alt="" /></a></li>
						</ul>
					</div>
					<div id="ifocus_opdiv"></div>
						<div id="ifocus_tx">
							<ul>
							    <li class="current"></li>
							    <li class="normal"></li>
							    <li class="normal"></li>
							    <li class="normal"></li>
							</ul>
						</div>
						</div>
						<div id="ifocus_btn">
							<ul>
								<li><a href="#"><img src="images/<%= request.getAttribute("ImgSrcMain") %>" alt="" /></a></li>
								<li><a href="#"><img src="images/<%= request.getAttribute("ImgSrc02") %>" alt="" /></a></li>
								<li><a href="#"><img src="images/<%= request.getAttribute("ImgSrc03") %>" alt="" /></a></li>
								<li><a href="#"><img src="images/<%= request.getAttribute("ImgSrc04") %>" alt="" /></a></li>
							</ul>
						</div>
						</div>
						<div class="singlewrap">
							<h2><%= request.getAttribute("GoodsName") %></h2>
							<p><%= request.getAttribute("GoodsDescript")%></p>
							<div class="singleprice">
								<p style="color:#808080;margin-top: 20px;">価格: <span style="color:red;margin-top: 20px;">\<%= request.getAttribute("GoodsUnitPrice")%>/日</span></p>
							</div>
						</div>
							<div class="singleform">
								<form action="cartinsert" method="post">
									<div class="share">
										<p>数量:
										<input type="number" name="shopCount" class="text_box" type="text" value="1" min="1" style="border: 1px solid black;"></p>
									</div>
										<fieldset class="singlefid_left">
											<input type="hidden" name="GoodsId" value="<%= request.getAttribute("GoodsId") %>">
											<input type="hidden" name="customerid" value="<%= session.getAttribute("CustomerId") %>">
											<input type="submit" name="submit" value="カートに入れる" class="button" />
										</fieldset>
									</form>
								<div>
									<form action="favoriteinsert" method="post">
										<fieldset class="singlefid_right">
											<input type="hidden" name="GoodsId" value="<%= request.getAttribute("GoodsId") %>">
											<input type="hidden" name="customerid" value="<%= session.getAttribute("CustomerId") %>">
											<input type="submit" name="submit" value="ほしいものリストに入れる" class="button " />
										</fieldset>
									</form>
								</div>
							</div>
						<br>
						<br>
						<br>
						<div class="product_desc">
							<h4 style="font-size:20px;margin-bottom:20px;">登録情報</h4>
							<table>
								<tr>
									<td>プラットフォーム</td><td><%= request.getAttribute("GoodsBrand")%></td>
								</tr>
								<tr>
									<td>メディア</td><td><%= request.getAttribute("GoodsMedia")%></td>
								</tr>
								<tr>
									<td>発売日</td><td><%= request.getAttribute("GoodsIssue")%></td>
								</tr>
								<tr>
									<td>商品の寸法</td><td><%= request.getAttribute("GoodsSize")%></td>
								</tr>
								<tr>
									<td>型番</td><td><%= request.getAttribute("GoodsModel")%></td>
								</tr>
								<tr>
									<td>現在地</td><td><%= request.getAttribute("AreaName")%></td>
								</tr>
							</table>
						</div>
							 <h4 style="margin-left:170px;font-size:20px;margin-bottom:20px;">この商品のレビュー</h4>
							 	<div class="desc">
				 				<div class="msgname">
									<img src="images/<%= request.getAttribute("CusPortrait") %>" style="width:100px;">
				 						<p><%= request.getAttribute("CustomerName") %></p>
				 				</div>
									<p class="desc-p"><%= request.getAttribute("review_title") %></p>
								<div class="hidden">
									<div class="branddesc"><%= request.getAttribute("review_message") %></div>
							    </div>
							    	<p class="desc-time"><%= request.getAttribute("review_time") %></p>
								</div>
								<br>
								<br>
								<br>
	<%@include file="../footer.jsp" %>
</body>
</html>
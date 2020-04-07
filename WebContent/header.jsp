<%@ page pageEncoding="UTF-8" %>
	<header class="header_wrapper">
		<p>IDLEには借りたいものがすべて揃っています！</p>
	</header>
	<script type='text/javascript' src='js/dropdown.js'></script>
	<div class="header-bot">
		<!-- header-bot-->
		<div class="logo_agile">
			<h1>
				<a href="logingoods">
					<img src="images/logo.png" alt=" ">
				</a>
			</h1>
		</div>
			<!-- header-bot -->
			<div class="header_lists">
				<div id="nav">
					<ul id="navMenu" class="header_lists_ul">
						<li>
							<img src="images/user.png" alt="" class="icon"><br>
							<a href="#"  rel='dropmenu1'><%= session.getAttribute("customer_name") %>さん</a>
						</li>
					</ul>
				</div>

				<script type='text/javascript' src='js/dropdown.js'></script>

				<ul id="dropmenu1" class="dropMenu">
					<li><h4>アカウントサービス</h4></li>
					<li class="dropMenu">
					<li>
						<form action=#" method="post">
							<input type="submit" value="注文履歴">
						</form>
					<li>
						<form action="admin" method="post">
							<input type="hidden" name="customerid" value="<%= session.getAttribute("CustomerId") %>">
							<input type="submit" value="アカウント">
						</form>
					<li>
						<form action="#" method="post">
							<input type="submit" value="貸す履歴">
						</form>
					<li>
						<form action="ownmsg" method="post">
							<input type="hidden" name="customerid" value="<%= session.getAttribute("CustomerId") %>">
							<input type="submit" value="借りたい商品">
						</form>
					<li>
						<form action="review" method="post">
							<input type="hidden" name="customerid" value="<%= session.getAttribute("CustomerId") %>">
							<input type="submit" value="評価管理">
						</form>
					<li><a href="logout">ログアウト</a></li>
				</ul>
				<script type="text/javascript">cssdropdown.startchrome("navMenu")</script>

				<!-- header lists -->

				<ul class="header_lists_ul">
					<li>
						<img src="images/map.png" alt="" class="icon">
						<form action="addresslist" method="post">
							<input type="hidden" name="customerid" value="<%= session.getAttribute("CustomerId") %>">
							<input type="submit" value="お届け先">
						</form>
					</li>
					<li>
						<img src="images/star.png" alt="" class="icon">
						<form action="favorite" method="post">
							<input type="hidden" name="customerid" value="<%= session.getAttribute("CustomerId") %>">
							<input type="submit" value="ほしい物リスト">
						</form>
					</li>
					<li>
						<img src="images/cart.png" alt="" class="icon"><br>
						<form action="cart" method="post">
							<input type="hidden" name="customerid" value="<%= session.getAttribute("CustomerId") %>">
							<input type="submit" value="カート">
						</form>
					</li>
					<li>
						<img src="images/msgboard.png" alt="" class="icon"><br>
							<a href="messagelist">掲示板</a>
					</li>
				</ul>
				<!-- //header lists -->

				<!-- search -->
				<div class="agileits_search">
					<form action="search" method="post">
						<input name="search" type="search" placeholder="Search" id="search">
						<button type="submit" class="btn-default">
							<img src="images/search.png" alt="" class="btn-img">
						</button>
					</form>
				</div>
			</div>
		</div>
		<div class="nav_wrap">
			<div class="karikata">
				<a href="logingoods"> 借方 </a>
			</div>
			<div class="kashikata">
				<a href="#"> 貸方 </a>
			</div>
		</div>
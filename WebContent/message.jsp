<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>掲示板</title>
<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/ress.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@include file="../header.jsp" %>
	<h1 class="body_h1">掲示板</h1>
	<script>
		(function($){
			$.fn.moreText = function(options){
			var defaults = {
			maxLength:50,
			mainCell:".branddesc",
			openBtn:'全部表示',
			closeBtn:'隠す'
		}
		return this.each(function() {
			var _this = $(this);

			var opts = $.extend({},defaults,options);
			var maxLength = opts.maxLength;
			var TextBox = $(opts.mainCell,_this);
			var openBtn = opts.openBtn;
			var closeBtn = opts.closeBtn;

			var countText = TextBox.html();
			var newHtml = '';
			if(countText.length > maxLength){
			newHtml = countText.substring(0,maxLength)+'...<button type="button" class="more">'+openBtn+'</button>';
			}else{
			newHtml = countText;
			}
			TextBox.html(newHtml);
			TextBox.on("click",".more",function(){
				if($(this).text()==openBtn){
				TextBox.html(countText+' <button type="button" class="more">'+closeBtn+'</button>');
			}else{
				TextBox.html(newHtml);
			}
		})
		})
		}
		})(jQuery);
			$(function(){
			$(".desc .hidden").moreText({
			maxLength: 50,
			mainCell: '.branddesc'
			});
		})
	</script>

	 <% ArrayList<HashMap<String, String>> list = (ArrayList<HashMap<String, String>>)request.getAttribute("message"); %>
		<% for(int i = 0; i < list.size() ; i++) { %>
 			<% HashMap<String, String> row = list.get(i); %>
 				<div class="desc">
	 				<div class="msgname">
						<img src="images/<%= row.get("CusPortrait")%>" style="width:100px;">
	 						<p><%= row.get("CustomerName")%></p>
	 				</div>
						<p class="desc-p"><%= row.get("mes_title")%></p>
					<div class="hidden">
						<div class="branddesc"><%= row.get("mes_message")%></div>
				    </div>
				    	<p class="desc-time"><%= row.get("mes_time")%></p>
				</div>
				<br>
		<% } %>
		<form action="message" method="post">
			<div class="msgboard">
				<h3>発表</h3><br>
				<p class="msgtitle">タイトル：<input type="text" name="title" maxlength="40" style="width:500px;border:1px solid black;background: #fff;" required></p><br>
				<input type="hidden" name="customerid" value="<%= session.getAttribute("CustomerId") %>">
				<p class="msgtextarea">内容：<textarea id="TextArea1" name="msg" onkeyup="checkLength(this);" style="width:500px;height:200px;border:1px solid black;background: #fff;" required></textarea></p><br>
				<br>
				<input type="submit" name="submit" value="送信" class="button msgbutton" />
				<span class="wordage">残り字数：<span id="sy" style="color:Red;">200</span></span>
			</div>
		</form>
		<script type="text/javascript">
		function checkLength(which) {
			var maxChars = 200;
			if(which.value.length > maxChars){
				alert("最大150文字まで入力してください");
				which.value = which.value.substring(0,maxChars);
				return false;
			}else{
				var curr = maxChars - which.value.length;
				document.getElementById("sy").innerHTML = curr.toString();
				return true;
			}
		}
		</script>
<%@include file="footer.jsp" %>
</body>
</html>
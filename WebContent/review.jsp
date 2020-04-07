<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>評価管理</title>
<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/ress.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@include file="../header.jsp" %>
	<h1 class="body_h1">評価管理</h1>
	 <% ArrayList<HashMap<String, String>> list = (ArrayList<HashMap<String, String>>)request.getAttribute("review"); %>
		<% for(int i = 0; i < list.size() ; i++) { %>
 			<% HashMap<String, String> row = list.get(i); %>
 				<div class="desc">
	 				<div class="msgname">
						<img src="images/<%= row.get("CusPortrait")%>" style="width:100px;">
	 						<p><%= row.get("CustomerName")%></p>
	 				</div>
						<p class="desc-p"><%= row.get("review_title")%></p>
					<div class="hidden">
						<div class="branddesc"><%= row.get("review_message")%></div>
				    </div>
				    	<p class="desc-time"><%= row.get("review_time")%></p>
				</div>
				<br>
		<% } %>
<%@include file="footer.jsp" %>
</body>
</html>
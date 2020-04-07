<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>お客様のご住所</title>
</head>
<body>
	<%@include file="../header.jsp" %>
		<h1 class="body_h1">お客様のご住所</h1>
	<table class="new_address">
		<tr>
			<td>
				<form action="newAddress.jsp" method="post">
					<input type="submit" value="新しい住所">
				</form>
			</td>
		</tr>
	</table>
	<% ArrayList<HashMap<String, String>> list = (ArrayList<HashMap<String, String>>)request.getAttribute("address"); %>
 				<% for(int i = 0; i < list.size(); i++) { %>
 					<% HashMap<String, String> row = list.get(i); %>
	<table class="address">
		<tr>
			<td colspan="2" class="address_td">既定の住所<hr></td>
		</tr>
		<tr>
			<td colspan="2">名前：<%= row.get("AddressName") %></td>
		</tr>
		<tr>
			<td colspan="2">郵便番号：<%= row.get("CustomerPost") %></td>
		</tr>
		<tr>
			<td colspan="2">住所：<%= row.get("CustomerAddress") %></td>
		</tr>
		<tr>
			<td colspan="2" class="address_td">電話番号：<%= row.get("CustomerTel") %></td>
		</tr>
		<tr>
			<td class="address_date" style="border-right:2px solid #eae5e3">
				<form action="changeaddress.jsp" method="post">
					<input type="hidden" name="CustomerAddressId" value="<%= row.get("CustomerAddressId") %>">
					<input type="submit" value="変更">
				</form>
			</td>
			<td class="address_date">
				<form action="addressdelete" method="post">
					<input type="hidden" name="CustomerAddressId" value="<%= row.get("CustomerAddressId") %>">
					<input type="submit" value="削除">
				</form>
			</td>
		</tr>
		<% } %>
	</table>

	<%@include file="../footer.jsp" %>
</body>
</html>
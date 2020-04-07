<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>お客様のご住所</title>
 <script>
    addEvent(window,'load',function(){
      var fm = document.getElementById('myForm');
      var content = fm.elements['customer_tel'];
      addEvent(content,'keypress',function(evt){
        var e = evt || window.event;
        var charCode = getCharCode(evt);
        if(!/\d/.test(String.fromCharCode(charCode)) && charCode > 8){
          preDef(evt);
        }
      });
      addEvent(content,'keyup',function(evt){
        this.value = this.value.replace(/[^\d]/g,'');
      });
    });

    function addEvent(obj,type,fn){
      if(obj.addEventListener){
        obj.addEventListener(type,fn,false);
      }else if(obj.attachEvent){
        obj.attachEvent('on' + type,function(){
          fn.call(obj);
        });
      }
    }
  </script>
</head>
<body>
	<%@include file="../header.jsp" %>
	<h1 class="body_h1">住所変更</h1>
	<script src="https://yubinbango.github.io/yubinbango/yubinbango.js" charset="UTF-8"></script>
	<form action="addressupdate" method="post" class="h-adr" id="myForm">
		<span class="p-country-name" style="display:none;">Japan</span>
		<% String CustomerAddressId = request.getParameter("CustomerAddressId");%>
		<input type="hidden" name="CustomerAddressId" value="<%= CustomerAddressId %>">
		<div class="address_div">
			<ul class="input_address">
				<li class="address_text">氏名</li>
				<li><label><input type="text" name="address_name" class="form_control address_li" required autofocus placeholder="山田　太郎"></label></li>
				<li class="address_text">郵便番号</li>
				<li><input type="text" name="customer_post" class="form_control address_li p-postal-code" size="8" maxlength="8" placeholder="郵便番号を入力してください" required></li>
				<li class="address_text">住所</li>
				<li><input type="text" name="customer_address" class="p-region p-locality p-street-address p-extended-address form_control address_li"></li>
				<li class="address_text">電話番号</li>
				<li><input type="text" class="form_control address_ad" name="customer_tel" maxlength="12" placeholder="電話番号を入力してください" required></li>
				<li><input type="submit" value="住所を変更" class="form_control btn address_btn"></li>
			</ul>
		</div>
	</form>
	<br>
	<br>
	<%@include file="../footer.jsp" %>
</body>
</html>
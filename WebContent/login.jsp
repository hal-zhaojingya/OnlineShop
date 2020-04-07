<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ja">
<head>
	<meta charset="UTF-8">
	<title>IDLE登録</title>
	<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="form_wrapper">
	<fieldset class="fieldst_wrapper">
    	<legend align="center"><img src="images/logo.png"></legend>

    	<h3>アカウントを作成</h3>
		<span class="error_mes"><%= request.getAttribute("message") %></span>
    	<form action="login" method="post">
        	<div class="form-group">
            	<input type="text" class="form_control" name="customer_name" placeholder="ログインID" required autofocus>
        	</div>
        	<div class="form-group">
            	<input type="password" class="form_control" name="customer_pass" placeholder="パスワード" required>
        	</div>
            <div class="customer-checkbox">
                <input type="checkbox" name="check">IDを自動入力<br>
            </div>
            <a href="./reset-password.html" class="customer-reset-password">パスワードを忘れた場合</a>
            <div class="form-group">
        	<input type="submit" class="form_control btn" value="ログイン">
        	</div>
        	<hr>
        	<div class="form_btn_wrapper">
        	<p class="text-muted">新しいお客様ですか？</p>
        	<a href="register" class="btn-sm">アカウントを作成</a>
        	</div>
    	</form>
    </fieldset>
</div>
</body>
</html>
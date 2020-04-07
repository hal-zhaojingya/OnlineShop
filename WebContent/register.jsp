<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ja">
<head>
	<meta charset="UTF-8">
	<title>IDLE新規登録</title>
	<link href="css/style.css" rel="stylesheet" type="text/css">
  <script type="text/javascript">
var flag = true;
function check(){
	return flag;
}

function checks(){
    if(document.getElementById("password").value != document.getElementById("password_check").value) {
        alert("二回のパスワードが一致しない");
        flag = false;
        return;
    }else{
       flag = true;
        return ;

    }
}
function showResult(){
    var text = document.getElementById("password").value;
    var re = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[^]{8,16}$/;
    var result = re.test(text);
    if(result){
    	flag = true;
		return;
    }else
    {
        alert("パスワードは大文字小文字、数字、8桁以上、16桁までが含まれてはいけません。");
        flag = false;
        return;
    }

}
</script>
</head>
<body>
	<div class="form_wrapper">
	<fieldset class="fieldst_wrapper">
    	<legend align="center"><img src="images/logo.png"></legend>

    	<h3>アカウントを作成</h3>
		<span class="error_mes"><%= request.getAttribute("name_err") %></span>
    	<form action="register" method="post" onsubmit="return check();">
        	<div class="form-group">
            	<input type="text" class="form_control" name="customer_name" placeholder="ログインID" required autofocus>
        	</div>
        	<div class="form-group">
            	<input type="email" class="form_control" name="customer_email" placeholder="Eメールアドレス" required>
        	</div>
        	<div class="form-group">
            	<input type="password" class="form_control" name="customer_pass" maxlength="20" placeholder="パスワード" id="password" required>
        	</div>
        	<div class="form-group">
            	<input type="password" class="form_control" name="confirm_password" maxlength="20" placeholder="もう一度パスワードを入力してください" id="password_check" onblur="checks()" required>
       		</div>
       		<div class="form-group">
        	<input type="submit" class="form_control btn" value="新規アカウント作成" onclick="showResult()">
        	</div>
        	<hr>
        	<div class="form_btn_wrapper">
        	<p class="text-muted">すでにアカウントをお持ちですか?</p>
        	<a href="login" class="btn-sm">ログイン</a>
        	</div>
    	</form>
    </fieldset>
</div>
</body>
</html>
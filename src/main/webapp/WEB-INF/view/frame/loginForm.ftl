<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Smart Erp</title>
	<link rel="stylesheet" type="text/css" href="/design/frame/style/css/login.css"/>
	<link type="image/x-icon" href="/design/static/images/common/favicon.ico" rel="shortcut icon">
	<script type="text/javascript" src="/design/frame/style/js/jquery-1.7.1.min.js"></script>
	<script src="/design/static/js/app/system/login.js"></script>
</head>
<body>

<div class="loginbg">
	<div class="bg_image">
		<div class="loginFormbg">
			<div class="form_area">
				<div class="submit_massage" id="submitPrompt">
					${message!""}
				</div>
				<form action="/frame/login" method="post" id="loginForm">
					<div class="form_username">
						<input type="text" name="username" class="form_input" placeholder="账号"/>
					</div>
					<div class="form_password">
						<input type="password" name="password" class="form_input" placeholder="密码" />
					</div>
					<div class="submit_btn_area">
						<a href="javascript:void(0)" onclick="sbumitForm();" class="submit_btn"></a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>
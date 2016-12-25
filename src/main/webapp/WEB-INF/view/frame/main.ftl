<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统</title>
<link type="image/x-icon" href="/design/static/images/common/favicon.ico" rel="shortcut icon">
<link rel="stylesheet" type="text/css" href="/design/frame/zui/css/zui.css"/>
<link rel="stylesheet" type="text/css" href="/design/frame/style/css/global.css"/>
<link rel="stylesheet" type="text/css" href="/design/frame/style/css/popup.css"/>
<link rel="stylesheet" type="text/css" href="/design/frame/style/css/header.css"/>
<script type="text/javascript" src="/design/frame/style/js/jquery-1.7.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/design/frame/jquery/jqueryui/jquery-ui.min.css"/>
<script type="text/javascript" src="/design/frame/jquery/jqueryui/jquery-ui.min.js"></script>
<script type="text/javascript" src="/design/frame/zui/js/zui.js"></script>
<script type="text/javascript" src="/design/frame/jquery/layout/jquery.layout.js"></script>
<script type="text/javascript" src="/design/frame/style/js/header.js"></script>
<script type="text/javascript" src="/design/frame/jquery/jquery.blockUI.js"></script>
<script type="text/javascript" src="/design/static/js/plugins/message.js"></script>
</head>
<body>

	<div class="ui-layout-north">
		<!-- header start-->
		<div class="header">
			<div class="header_inner">
				<table class="tb_common">
					<tr>
						<td><a href="#" class="logo" style="color:#0099FF">Smart</a></td>
						<td class="loginOut">
							<a onclick="modifyPersonInfo();" title="点击修改个人信息">
								<img src="/design/frame/style/img/default.gif"/>&nbsp;
									<span style="color:#fff">${user.name!""}<span>
							</a>&nbsp;&nbsp;
							<a onclick="loginOut();"><i class="icon icon-off"></i>&nbsp;退出 </a>
							<form id="loginOutForm" action="/frame/loginOut" method="post"></form>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<!-- header end-->
	</div>
	
	<div class="ui-layout-west">
		<dd class="menutitle"><i class="icon icon-desktop"></i> 导 航 菜 单</dd>
		<nav class="menu" data-toggle="menu" style="width: 100%;">
		  <ul class="nav nav-primary">
		  
		  <#if navigatorLists?? && (navigatorLists?size gt 0)>
		  	<#list navigatorLists as firstNav>
		  		<li class="nav-parent">
			      <a href="javascript:;"><i class="${firstNav.iconClass}"></i> ${firstNav.nameCn}</a>
			      <#if firstNav.navigatorList?? && (firstNav.navigatorList?size gt 0)>
				      <ul class="nav">
				      	<#list firstNav.navigatorList as secondNav>
				      		<li>
				      			<a href="javascript:;" onClick="$('#mainFrame').attr('src', '${secondNav.url}')">
				      				<i class="${secondNav.iconClass}"></i>${secondNav.nameCn}
				      			</a>
				      		</li>
				      	</#list>
				      </ul>
			      </#if>
			    </li>
		  	</#list>
		  </#if>
		  </ul>
		</nav>
	</div>
	
	
	<div class="ui-layout-center">
		<iframe id="mainFrame" height="100%" width="100%" border="0" frameborder="0" src="/frame/blank">
			浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。
		</iframe>
	</div>
	
	
	<div id="personDialog" style="display:none;">
		<div class="alert alert-info" style="padding:10px;">
			 	注意：修改个人信息成功后系统将自动退出登录！
		</div>
		<table class="popup_tb">
			<tr>
				<td class="title width_100px">账号<i class="star">*</i></td>
				<td><input type="text" class="txt width_50" name="userName" disabled/></td>
			</tr>
			<tr>
				<td class="title width_100px">昵称<i class="star">*</i></td>
				<td><input type="text" class="txt width_50" name="name" disabled/></td>
			</tr>
			<tr>
				<td class="title width_100px">密码<i class="star">*</i></td>
				<td><input type="password" class="txt width_50" name="password"/></td>
			</tr>
			<tr>
				<td class="title width_100px">邮箱</td>
				<td><input type="email" class="txt width_50" name="email"/></td>
			</tr>
			<tr>
				<td class="title width_100px">电话</td>
				<td><input type="text" class="txt width_50" name="phone"/></td>
			</tr>
		</table>
	</div>
	
</body>
</html>
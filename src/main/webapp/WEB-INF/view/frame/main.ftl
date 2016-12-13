<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统</title>
<link type="image/x-icon" href="/design/static/images/common/favicon.ico" rel="shortcut icon">
<link rel="stylesheet" type="text/css" href="/design/frame/zui/css/zui.css"/>
<link rel="stylesheet" type="text/css" href="/design/frame/style/css/header.css"/>
<script type="text/javascript" src="/design/frame/style/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="/design/frame/zui/js/zui.js"></script>
<script type="text/javascript" src="/design/frame/jquery/layout/jquery.layout.js"></script>
<script type="text/javascript" src="/design/frame/style/js/header.js"></script>
</head>
<body>

	<div class="ui-layout-north">
		<!-- header start-->
		<div class="header">
			<div class="header_inner">
				<table class="tb_common">
					<tr>
						<td><a href="#" class="logo" style="color:#0099FF">Smart</a></td>
						<td class="loginOut"><a><i class="icon icon-off"></i>&nbsp;退出 </a></td>
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
		  
		    <li class="nav-parent">
		      <a href="javascript:;"><i class="icon icon-wrench"></i> 系统管理</a>
		      <ul class="nav">
		        <li><a href="javascript:;" onClick="$('#mainFrame').attr('src', '/system/userManage')"><i class="icon-user"></i>用户管理</a></li>
		        <li><a href="javascript:;" onClick="$('#mainFrame').attr('src', '/system/roleManage')"><i class="icon icon-group"></i>角色管理</a></li>
		      </ul>
		    </li>
		  
		    <li class="nav-parent">
		      <a href="javascript:;"><i class="icon-time"></i> Cdiscount 专区</a>
		      <ul class="nav">
		        <li><a href="javascript:;"><i class="icon-user"></i>刊登管理</a></li>
		        <li><a href="javascript:;"><i class="icon-user"></i>EAN管理</a></li>
		      </ul>
		    </li>
		    
		    <li class="nav-parent">
		      <a href="javascript:;"><i class="icon-time"></i> Shopee专区</a>
		      <ul class="nav">
		        <li><a href="javascript:;"><i class="icon-user"></i>刊登管理</a></li>
		        <li><a href="javascript:;"><i class="icon-user"></i>EAN管理</a></li>
		      </ul>
		    </li>
		    
		  </ul>
		</nav>
	</div>
	
	
	<div class="ui-layout-center">
		<iframe id="mainFrame" height="100%" width="100%" border="0" frameborder="0" src="/frame/blank">
			浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。
		</iframe>
	</div>
</body>
</html>
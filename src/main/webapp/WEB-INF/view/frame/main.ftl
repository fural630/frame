<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统</title>
<link rel="stylesheet" type="text/css" href="/design/frame/zui/css/zui.css"/>

<!--
<link rel="stylesheet" type="text/css" href="/design/frame/style/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="/design/frame/style/css/global.css"/>
<link rel="stylesheet" type="text/css" href="/design/frame/style/css/sidebar.css"/>
<link rel="stylesheet" type="text/css" href="/design/frame/style/css/table.css"/>
-->
<link rel="stylesheet" type="text/css" href="/design/frame/style/css/header.css"/>

<script type="text/javascript" src="/design/frame/style/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="/design/frame/jquery/layout/jquery.layout.js"></script>
<script type="text/javascript" src="/design/frame/zui/js/zui.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $('body').layout({ 
        	applyDefaultStyles: true,
        	west__size : 214,		//左边宽度
        	west__spacing_open: 8,
        	north__closable : false,
        	north__spacing_open : 2,
        	togglerContent_open:"<div>&lt;$lt;</div>"
         });
         
          $('.menu .nav li:not(".nav-parent") a').click(function() {
			  var $this = $(this);
			  $('.menu .nav .active').removeClass('active');
			  $this.closest('li').addClass('active');
			  var parent = $this.closest('.nav-parent');
			  if(parent.length)
			  {
				  parent.addClass('active');
			  }
		  });
    });
</script>
</head>
<body>

	<div class="ui-layout-north">
		<!-- header start-->
		<div class="header">
		  <div class="header_inner">
		    <table class="tb_common">
		      <tr>
		        <td style="width:40%" class="paddingleft_10px td_left"><a href="#" class="logo" style="color:#0099FF"> Smart </a></td>
		        <td class="paddingright_0 td_right"><div class="top_nav">
		            <ul class="clearfix">
		              <li class="bg_none paddingright_0"> <a><img src="/design/frame/style/img/exit.png">退出 </a> </li>
		            </ul>
		          </div></td>
		      </Ttr>
		    </table>
		  </div>
		</div>
		<!-- header end-->
	</div>
	
	<div class="ui-layout-west">
		<dd class="menutitle"><i class="icon icon-laptop"></i> 导 航 菜 单</dd>
		<nav class="menu" data-toggle="menu" style="width: 100%;">
		  <ul class="nav nav-primary">
		  
		    <li class="nav-parent">
		      <a href="javascript:;"><i class="icon icon-laptop"></i> 系统管理</a>
		      <ul class="nav">
		        <li><a href="javascript:;" onClick="$('#mainFrame').attr('src', '/system/userManage')"><i class="icon-user"></i>用户管理</a></li>
		        <li><a href="javascript:;"><i class="icon icon-group"></i>角色管理</a></li>
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
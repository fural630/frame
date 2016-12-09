<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统</title>
<link rel="stylesheet" type="text/css" href="/design/frame/style/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="/design/frame/style/css/global.css"/>
<link rel="stylesheet" type="text/css" href="/design/frame/style/css/sidebar.css"/>
<script type="text/javascript" src="/design/frame/style/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="/design/frame/jquery/layout/jquery.layout.js"></script>
<script type="text/javascript" src="/design/frame/style/js/common.js"></script>
<script type="text/javascript" src="/design/frame/style/js/sidebar.js"></script>
<script type="text/javascript">
	$(function(){
	   $(".nav").accordion({
	        speed: 500,
		    closedSign: '+',
			openedSign: '-'
		});
	}); 
    $(document).ready(function () {
        $('body').layout({ 
        	applyDefaultStyles: true,
        	west__size : 214,		//左边宽度
        	spacing_open: 5	//各个块之间的缝隙
         });
    });
</script>
</head>
<body>
	<div class="ui-layout-west">
		<dl class="sidebar clearfix">
		<dd class="menutitle"><img src="/design/frame/style/img/mac.png"/>导 航 菜 单</dd>
			<dd>
				<ul class="nav">
				
					<li>
						<a href="#">销售</a>
						<ul class="clearfix">
							<li>
								<a href="#">Cdiscount 专区</a>
								<ul class="clearfix">
									<li>
										<a href="javascript:void(0);" onClick="$('#mainFrame').attr('src', '/system/userManage')">用户管理</a>
									</li>
								</ul>
							</li>
							<li>
								<a href="#">Shopee专区</a>
									<ul class="clearfix">
										<li> <a href="javascript:void(0);" onClick="parent.frames['mainFrame'].location='../function/销售管理/__客户项目信息.html'">客户项目信息</a></li>
									</ul>
							</li>
						</ul>
					</li>
					
					<li>
						<a href="#">产品中心</a>
						<ul class="clearfix">
							<li>
								<a href="javascript:void(0);" onClick="parent.frames['mainFrame'].location='../function/销售管理/__商务行为.html'">产品管理</a>
							</li>
						</ul>
					</li>
					
					<li>
						<a href="#">系统管理</a>
						<ul class="clearfix">
							<li>
								<a href="javascript:void(0);" onClick="$('#mainFrame').attr('src', '/system/userManage')">用户管理</a>
							</li>
							<li>
								<a href="javascript:void(0);" onClick="$('#mainFrame').attr('src', '/system/roleManage')">角色管理</a>
							</li>
						</ul>
					</li>
					
				</ul>
			</dd>
		</dd>
		</dl>
	</div>
	<div class="ui-layout-center">
		<iframe id="mainFrame" height="100%" width="100%" border="0" frameborder="0" src="/frame/blank">
			浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。
		</iframe>
	</div>
</body>
</html>
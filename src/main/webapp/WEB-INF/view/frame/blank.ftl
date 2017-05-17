<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <#include "../common/common.ftl"/>
    <script type="text/javascript" src="/design/static/js/plugins/developmentTools.js"></script>
  </head>
  <body>
  	<div id="tabs">
		  <ul>
		    <li><a href="#tabs-1">基本信息</a></li>
		    <li><a href="#tabs-2">视图信息</a></li>
	    	<li><a href="#tabs-3">采购信息</a></li>
		    <li><a href="#tabs-4">尺寸信息</a></li>
		    <li><a href="#tabs-5">描述信息</a></li>
		  </ul>
	  <div id="tabs-1">
	 	将：<select class="sel width_100px" name="translateNameSelect">
	 		<option value="en">英文名</option>
	 		<option value="zh-CN">中文名</option>
	 	</select>
	   </div>
	</div>
	<button class="btn btn-sm " type="button" onclick="reviewCode()">
		浏览结果
	</button>
	
	<pre id="codeReview">
		
	</pre>
  	
  </body>
 </html>
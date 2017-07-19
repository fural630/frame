<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <#include "../common/common.ftl"/>
    <script type="text/javascript" src="/design/static/js/plugins/developmentTools.js"></script>
  </head>
  <style>
  		.point {
  			cursor:pointer
  		}
  </style>
  <body>
  	<div id="tabs">
		<ul>
			<li><a href="#tabs-1">头部信息引入</a></li>
			<li><a href="#tabs-2">基本信息配置</a></li>
			<li><a href="#tabs-3">标准页面配置</a></li>
			<li><a href="#tabs-4">实体信息配置</a></li>
		</ul>
		<div id="tabs-1">
			 <table class="popup_tb" style="margin-top:10px;">
			 	<tr>
			 		<td class="title width_100px">自定义</td>
			 		<td>
			 			js路径 ：/design/static/js/app/ + <input type="text" placeholder="模块名" name="jsModelName" class="txt width_100px"/> + <input type="text" placeholder="文件名" name="jsFileName" class="txt width_120px"/>&nbsp;&nbsp;
			 			css路径 ：/design/static/css/ + <input type="text" placeholder="模块名" name="cssModelName" class="txt width_100px"/> + <input type="text" placeholder="文件名" name="cssFileName" class="txt width_120px"/>
			 		</td>
			 	</tr>
		 		<tr>
		 			<td class="title width_100px">Ztree</td>
		 			<td>
		 				<input style="margin:0px 0px;" type="checkbox" name="js" value="/design/frame/jquery/zTree_v3-master/js/jquery.ztree.core.js"> 
		 				<span onclick="parentChecked(this)" class="point"> jquery.ztree.core.js </span> 
		 				<input style="margin:0px 0px;" type="checkbox" name="js" value="/design/frame/jquery/zTree_v3-master/js/jquery.ztree.excheck.min.js">
		 				<span onclick="parentChecked(this)" class="point"> jquery.ztree.excheck.min.js </span>  
		 				<input style="margin:0px 5px;" type="checkbox" name="css" value="/design/frame/jquery/zTree_v3-master/css/zTreeStyle/zTreeStyle.css">
		 				<span onclick="parentChecked(this)" class="point"> zTreeStyle.css </span> 
		 			</td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">chosen</td>
		 			<td>
		 				<input style="margin:0px 0px;" type="checkbox" name="js" value="/design/frame/zui/lib/chosen/chosen.min.js">
		 				<span onclick="parentChecked(this)" class="point"> chosen.min.js </span>
		 				<input style="margin:0px 5px;" type="checkbox" name="css" value="/design/frame/zui/lib/chosen/chosen.css"> 
		 				<span onclick="parentChecked(this)" class="point"> chosen.css  </span>
		 			</td>
		 		</tr>
		 	</table>
		</div>
		<div id="tabs-2">
			 <table class="popup_tb" style="margin-top:10px;">
		 		<tr>
		 			<td class="title width_100px">模块中文<i class="star">*</i></td>
		 			<td><input type="text" class="txt width_90" name="modelNameCn"/></td>
		 			<td class="title width_100px">页面Action路径</td>
		 			<td><input type="text" class="txt width_90" name="modelAction" /></td>
		 		</tr>
		 	</table>
		 	<table class="popup_tb" style="margin-top:10px;" name="buttonTable">
		 		<tr>
		 			<td class="title">按钮语言包<i class="star">*</i></td>
		 			<td class="title">按钮图片<i class="star">*</i></td>
		 			<td class="title">按钮点击方法<i class="star">*</i></td>
		 			<td class="title">
		 				<button class="btn btn-sm " type="button" onclick="addButtonConfigRow()">
							<i class="icon icon-plus-sign"></i>
						</button>
		 			</td>
		 		</tr>
		 		<tr>
		 			<td><input type="text" name="buttonPackage" class="txt"/></td>
		 			<td><input type="text" name="buttonIcon" class="txt"/></td>
		 			<td><input type="text" name="buttonFunction" class="txt"/></td>
		 			<td><button class="btn btn-sm btn-danger" type="button" onclick="removeButtonConfigRow(this)"><i class="icon icon-trash"></i></button></td>
		 		</tr>
		 	</table>
		</div>
		<div id="tabs-3">
			PageTable : <input type="text" class="txt width_100px" name="pageTableName">
			<table class="popup_tb" style="margin-top:10px;" name="pageConfigTable">
		 		<tr>
		 			<td class="title">表头字段<i class="star">*</i></td>
		 			<td class="title">表头中文<i class="star">*</i></td>
		 			<td class="title">表头style<i class="star">*</i></td>
		 			<td class="title">实体类型<i class="star">*</i></td>
		 			<td class="title">枚举类</td>
		 			<td class="title">查询类型<i class="star">*</i></td>
		 			<td class="title">查询样式<i class="star">*</i></td>
		 			<td class="title">
		 				<button class="btn btn-sm " type="button" onclick="addPageConfigRow()">
							<i class="icon icon-plus-sign"></i>
						</button>
		 			</td>
		 		</tr>
		 		<tr>
		 			<td><input type="text" name="beanField" class="txt"/></td>
		 			<td>
		 				<input type="text" name="fieldNameCn" class="txt width_100px"/>
		 			</td>
		 			<td>
		 				<input type="text" name="fieldClase" class="txt width_120px" placeholder="min-width:120px;"/>
		 			</td>
		 			<td>
		 				<select name="beanType" class="sel">
		 					<option value="String">String</option>
		 					<option value="Integer">Integer</option>
		 				</select>
		 			</td>
		 			<td>
		 				<input type="text" name="queryEnum" class="txt width_100px"/>
		 			</td>
		 			<td>
		 				<select name="queryType" class="sel">
		 					<option value="empty">无</option>
		 					<option value="txt">文本框</option>
		 					<option value="date">日期</option>
		 				</select>
		 			</td>
		 			<td>
		 				<input type="queryClass" class="txt width_100px" value="txt width_100px"/>
		 			</td>
		 			<td><button class="btn btn-sm btn-danger" type="button" onclick="removePageConfigRow(this)"><i class="icon icon-trash"></i></button></td>
		 		</tr>
		 	</table>
		</div>
	</div>
	<button class="btn btn-sm " type="button" onclick="reviewCode()">
		浏览结果
	</button>
	
	<pre id="codeReview">
		
	</pre>
  	
  </body>
 </html>
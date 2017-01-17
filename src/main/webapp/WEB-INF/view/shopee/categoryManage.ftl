<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <#include "../common/common.ftl"/>
    <script type="text/javascript" src="/design/static/js/app/shopee/categoryManage.js"></script>
  </head>
  <body>
    <form action="/shopee/categoryManage" id="mainPageForm" method="post">
  	<div class="current_nav_name clearfix"><@s.message "shopee.category.manage"/>
		<div class="fr small_size">
			<button class="btn btn-sm " type="button" onclick="showImportCategoryDialog('<@s.message "import.category"/>')"><i class="icon icon-plus-sign"></i> <@s.message "import.category"/></button>
		</div>
	</div>
	<#include "../common/page.ftl"/>
	<div class="mainbody clearfix"> 
	<input name="categoryQuery" class="txt width_300px" style="margin:10px 0px 10px 10px;" placeholder="全局搜索类别或类别ID">
	  <div class="tableview clearfix">
	    <div class="content">
	      <table class="tb_border tb_full stripe" id="categoryManageTable" name="pageTable">
	          <tr>
	          	<th></th>
	            <th>Category</th>
	            <th>Subcategory</th>
	            <th>3rd Level Category</th>
	            <th>Category ID</th>
	          </tr>
	          <tr class="conditionTr">
	          	<td></td>
	          	<td>
	          		<ul>
	          			<li><input type="text" class="txt width_100px" name="params[name]" value="${page.params.name!''}" /></li>
	          			<li>*&nbsp;<input type="checkbox" title="勾选启用模糊查找" name="params[nameLike]" <#if page.params.nameLike??> checked </#if>></li>
	          		</ul>
	          	</td>
	          	<td>
	          		<ul>
	          			<li><input type="text" class="txt width_100px" name="params[username]" value="${page.params.username!''}" /></li>
	          			<li>*&nbsp;<input type="checkbox" title="勾选启用模糊查找" name="params[usernameLike]" <#if page.params.usernameLike??> checked </#if>></li>
	          		</ul>
	          	</td>
	          	<td>
	          		<ul>
	          			<li><input type="text" class="txt width_100px" name="params[email]" value="${page.params.email!''}" /></li>
	          			<li>*&nbsp;<input type="checkbox" title="勾选启用模糊查找" name="params[emailLike]" <#if page.params.emailLike??> checked </#if>></li>
	          		</ul>
	          	</td>
	          	<td></td>
	          </tr>
	          </form>
		  		 <tr>
		            <td style="text-align:center"><input name="main_page_checkbox" type="checkbox" value="1" onclick="countCheckbox()" /></td>
		            <td>name</td>
		            <td>username</td>
		            <td>email</td>
		            <td>123</td>
		          </tr>
	      		</table>
			<div class="paging clearfix">
				<div class="massaction"></div>
			</div>
	    </div>
	  </div>
	</div>
	
	<div id="uploadCategoryDialog" style="display:none;">
		<div class="alert alert-info" style="padding:10px;">
			注意：请从Shopee平台下载类别模板后直接导入无需修改格式，导入数据后原类别将会被删除覆盖。
		</div>
		<form name="uploadCategoryFrom" action="/shopee/uploadCategory" method="post" enctype="multipart/form-data" target="iframe_shippingData">
			<table class="popup_tb">
		 		<tr>
		 			<td class="title width_100px">导入文件<i class="star">*</i></td>
		 			<td><input type="file" name="productFile" class="form-control" value="" style="width:50%"></td>
		 		</tr>
		 		<!--
		 		<tr>
		 			<td class="title width_100px">模板文件下载<i class="star">*</i></td>
		 			<td>
		 				<a href="/download/template/productImportTemplate.xls">
		 					<i class="icon icon-file-excel"></i> 商品导入文件模板下载
		 				</a>
		 			</td>
		 		</tr>
		 		-->
	 		</table>
		</form>
		<iframe name="iframe_shippingData" width="100%" height="100" frameborder="0"></iframe>
	</div>
  
  </body>
</html>
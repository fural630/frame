<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <#include "../common/common.ftl"/>
    <script type="text/javascript" src="/design/static/js/app/shopee/categoryManage.js"></script>
  </head>
  <body>
    <form action="/shopee/shopeeCategoryManage" id="mainPageForm" method="post">
  	<div class="current_nav_name clearfix"><@s.message "shopee.category.manage"/>
		<div class="fr small_size">
			<button class="btn btn-sm " type="button" onclick="showImportCategoryDialog('<@s.message "import.category"/>')"><i class="icon icon-plus-sign"></i> <@s.message "import.category"/></button>
		</div>
	</div>
	<#include "../common/page.ftl"/>
	<div class="mainbody clearfix"> 
	<div class="globalQuery">
		<input type="text" name="params[categoryQuery]" value="${page.params.categoryQuery!''}" class="txt width_300px" style="margin:10px 0px 10px 10px;" placeholder="全局搜索类别或类别ID">
	</div>
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
	          			<li><input type="text" class="txt width_100px" name="params[firstCategory]" value="${page.params.firstCategory!''}" /></li>
	          			<li>*&nbsp;<input type="checkbox" title="勾选启用模糊查找" name="params[firstCategoryLike]" <#if page.params.firstCategoryLike??> checked </#if>></li>
	          		</ul>
	          	</td>
	          	<td>
	          		<ul>
	          			<li><input type="text" class="txt width_100px" name="params[subcategory]" value="${page.params.subcategory!''}" /></li>
	          			<li>*&nbsp;<input type="checkbox" title="勾选启用模糊查找" name="params[subcategoryLike]" <#if page.params.subcategoryLike??> checked </#if>></li>
	          		</ul>
	          	</td>
	          	<td>
	          		<ul>
	          			<li><input type="text" class="txt width_100px" name="params[thirdCategory]" value="${page.params.thirdCategory!''}" /></li>
	          			<li>*&nbsp;<input type="checkbox" title="勾选启用模糊查找" name="params[thirdCategoryLike]" <#if page.params.thirdCategoryLike??> checked </#if>></li>
	          		</ul>
	          	</td>
	          	<td>
	          		<ul>
	          			<li><input type="text" class="txt width_100px" name="params[categoryId]" value="${page.params.categoryId!''}" /></li>
	          			<li>*&nbsp;<input type="checkbox" title="勾选启用模糊查找" name="params[categoryIdLike]" <#if page.params.categoryIdLike??> checked </#if>></li>
	          		</ul>
	          	</td>
	          </tr>
	          </form>
	          <#assign queryLowcase = ''>
	          <#if page.params.categoryQuery??>
	            	<#assign queryLowcase = page.params.categoryQuery?lower_case>
	          </#if>
	          <#assign spanStart = "<span style='color:red;background-color:#ffff00'>">
	          <#assign spanEnd = "</span>">
	          	<#if collection??>
	          		<#list collection as obj>
			  		 <tr>
			            <td style="text-align:center"><input name="main_page_checkbox" type="checkbox" value="1" onclick="countCheckbox()" /></td>
			            <td>
			            	<#assign categoryName = obj.firstCategory>
				            <#if queryLowcase?length gt 0> 
				            	<#assign categoryLowerCase = categoryName?lower_case>
				            	<#assign start = categoryLowerCase?index_of(queryLowcase)>
				            	<#assign end = start + queryLowcase?length>
				            	<#if end gt 0 && start != -1 > 
				            		<#assign categoryName = categoryName?substring(0, start) + spanStart + categoryName?substring(start, end) + spanEnd + categoryName?substring(end, categoryName?length)>
				            		${categoryName}
				            	<#else>
				            		${categoryName}
				            	</#if>
			            	<#else>
				            	${categoryName}
			            	</#if>
			            </td>
			            <td>
			            	<#assign categoryName = obj.subcategory>
				            <#if queryLowcase?length gt 0> 
				            	<#assign categoryLowerCase = categoryName?lower_case>
				            	<#assign start = categoryLowerCase?index_of(queryLowcase)>
				            	<#assign end = start + queryLowcase?length>
				            	<#if end gt 0 && start != -1 > 
				            		<#assign categoryName = categoryName?substring(0, start) + spanStart + categoryName?substring(start, end) + spanEnd + categoryName?substring(end, categoryName?length)>
				            		${categoryName}
				            	<#else>
				            		${categoryName}
				            	</#if>
			            	<#else>
				            	${categoryName}
			            	</#if>
			            </td>
			            <td>
			            	<#assign categoryName = obj.thirdCategory>
				            <#if queryLowcase?length gt 0> 
				            	<#assign categoryLowerCase = categoryName?lower_case>
				            	<#assign start = categoryLowerCase?index_of(queryLowcase)>
				            	<#assign end = start + queryLowcase?length>
				            	<#if end gt 0 && start != -1 > 
				            		<#assign categoryName = categoryName?substring(0, start) + spanStart + categoryName?substring(start, end) + spanEnd + categoryName?substring(end, categoryName?length)>
				            		${categoryName}
				            	<#else>
				            		${categoryName}
				            	</#if>
			            	<#else>
				            	${categoryName}
			            	</#if>
			            </td>
			            <td>
			            	<#assign categoryName = obj.categoryId>
				            <#if queryLowcase?length gt 0> 
				            	<#assign categoryLowerCase = categoryName?lower_case>
				            	<#assign start = categoryLowerCase?index_of(queryLowcase)>
				            	<#assign end = start + queryLowcase?length>
				            	<#if end gt 0 && start != -1 > 
				            		<#assign categoryName = categoryName?substring(0, start) + spanStart + categoryName?substring(start, end) + spanEnd + categoryName?substring(end, categoryName?length)>
				            		${categoryName}
				            	<#else>
				            		${categoryName}
				            	</#if>
			            	<#else>
				            	${categoryName}
			            	</#if>
			            </td>
			          </tr>
		          </#list>
		  		</#if>
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
		 			<td><input type="file" name="categoryFile" class="form-control" value="" style="width:50%"></td>
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
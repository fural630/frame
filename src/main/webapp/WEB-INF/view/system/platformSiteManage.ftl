<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <#include "../common/common.ftl"/>
    <script  type="text/javascript" src="/design/static/js/app/system/platformSiteManage.js"></script>
  </head>
  <body>
    <form action="/system/platformSiteManage" id="mainPageForm" method="post">
  	<div class="current_nav_name clearfix"><@s.message "platform.site.config"/>
		<div class="fr small_size"> 
			<button class="btn btn-sm " type="button" onclick="showPlatformSiteDialog('<@s.message "add.platform.site.config"/>')">
				<i class="icon icon-plus-sign"></i><@s.message "platform.config"/>
			</button>
		</div>
	</div>
	<#include "../common/page.ftl"/>
	<div class="mainbody clearfix"> 
	  <div class="tableview clearfix">
	    <div class="content">
	    
	      <table class="tb_border tb_full stripe" id="userManageTable" name="pageTable">
	          <tr>
	          	<th></th>
	            <th>平台</th>
	            <th>站点中文</th>
	            <th>站点英文</th>
	            <th>货币代码</th>
	            <th>语言</th>
	            <th>操作</th>
	          </tr>
	          <tr class="conditionTr">
	          	<td></td>
	          	<td>
	          		<ul>
	          			<li>
	          			<#if page.params.platformId??> 
          					<@select id="platformId" name="params[platformId]" selected="${page.params.platformId}" optionClass="Platform"  cssClass="sel width_100px" headerKey="" headerValue=""/>
          				<#else>
          					<@select id="platformId" name="params[platformId]"  optionClass="Platform"  cssClass="sel width_100px" headerKey="" headerValue=""/>
          				</#if>
          				</li>
	          			<li></li>
	          		</ul>
	          	</td>
	          	<td>
	          		<ul>
	          			<li><input type="text" class="txt width_100px" name="params[siteNameCn]" value="${page.params.siteNameCn!''}" /></li>
	          			<li>*&nbsp;<input type="checkbox" title="勾选启用模糊查找" name="params[siteNameCnLike]" <#if page.params.siteNameCnLike??> checked </#if>></li>
	          		</ul>
	          	</td>
	          	<td>
	          		<ul>
	          			<li><input type="text" class="txt width_100px" name="params[siteNameEn]" value="${page.params.siteNameEn!''}" /></li>
	          			<li>*&nbsp;<input type="checkbox" title="勾选启用模糊查找" name="params[siteNameEnLike]" <#if page.params.siteNameEnLike??> checked </#if>></li>
	          		</ul>
	          	</td>
	          	<td>
	          		<ul>
          				<li>
	          				<#if page.params.currencyId??> 
	          					<@select id="currencyId" name="params[currencyId]" selected="${page.params.currencyId}" optionClass="Currency"  cssClass="sel width_100px" headerKey="" headerValue=""/>
	          				<#else>
	          					<@select id="currencyId" name="params[currencyId]"  optionClass="Currency"  cssClass="sel width_100px" headerKey="" headerValue=""/>
	          				</#if>
	          			</li>
	          			<li></li>
	          		</ul>
	          	</td>
	          	<td>
	          		<ul>
	          			<li>
	          				<#if page.params.language??> 
	          					<@select id="language" name="params[language]" selected="${page.params.language}" optionClass="Language"  cssClass="sel width_100px" headerKey="" headerValue=""/>
	          				<#else>
	          					<@select id="language" name="params[language]"  optionClass="Language"  cssClass="sel width_100px" headerKey="" headerValue=""/>
	          				</#if>
	          			</li>
	          			<li></li>
	          		</ul>
	          	</td>
	          	<td></td>
	          </tr>
	          </form>
	          	<#if collection??>
	          		<#list collection as obj>
	      		 <tr>
		            <td style="text-align:center"><input name="main_page_checkbox" type="checkbox" value="${obj.id}" onclick="countCheckbox()" /></td>
		            <td><@matchValue key="${obj.platformId}" optionClass="Platform"/></td>
		            <td>${obj.siteNameCn}</td>
		            <td>${obj.siteNameEn}</td>
		            <td><@matchValue key="${obj.currencyId}" optionClass="Currency"/></td>
		            <td><@matchValue key="${obj.language}" optionClass="Language"/></td>
		            <td class="optionTd" style="width:60px;text-align:center;">
		            	<div class="btn-group">
						  <button type="button" class="btn dropdown-toggle btn-sm" data-toggle="dropdown">
						  	操作
						  	<span class="caret"></span>
						  </button>
						  <ul class="dropdown-menu pull-right" role="menu">
						    <li><a href="javascript:void(0)" onclick="editPlatformSite(${obj.id})" ><i class="icon icon-pencil"></i> 编辑 </a></li>
						    <li class="divider"></li>
						    <li><a href="javascript:void(0)" onclick="confirmMsg('deletePlatformSite(${obj.id})')" ><i class="icon icon-trash"></i> 删除 </a></li>
						  </ul>
						</div>
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
	
	<div id="platFormSiteDialog" style="display:none;">
		<input type="hidden" name="id">
		<table class="popup_tb">
	 		<tr>
	 			<td class="title width_100px">平台<i class="star">*</i></td>
	 			<td>
	 				<@select name="platformId" cssClass="sel width_100px" id="platformId" headerKey="" headerValue="" optionClass="Platform"/>
	 			</td>
	 		</tr>
	 		<tr>
	 			<td class="title width_100px">站点币种<i class="star">*</i></td>
	 			<td>
	 				<@select name="currency" cssClass="sel width_100px" id="currency" headerKey="" headerValue="" optionClass="Currency"/>
	 			</td>
	 		</tr>
	 		<tr>
	 			<td class="title width_100px">站点语言<i class="star">*</i></td>
	 			<td>
	 				<@select name="language" cssClass="sel width_100px" id="language" headerKey="" headerValue="" optionClass="Language"/>
	 			</td>
	 		</tr>
	 		<tr>
	 			<td class="title width_100px">站点中文名称<i class="star">*</i></td>
	 			<td><input type="text" class="txt width_150px" name="siteNameCn"/>&nbsp;建议格式：平台-站点&nbsp;(例如 Shopee-马来西亚)</td>
	 		</tr>
	 		<tr>
	 			<td class="title width_100px">站点英文标识<i class="star">*</i></td>
	 			<td><input type="text" class="txt width_150px" name="siteNameEn"/>&nbsp;建议格式：平台-站点英文简写&nbsp;(例如 Shopee-My)</td>
	 		</tr>
	 	</table>
	</div>
	
  </body>
</html>
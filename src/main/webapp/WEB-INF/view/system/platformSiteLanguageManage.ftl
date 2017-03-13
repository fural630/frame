<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <#include "../common/common.ftl"/>
    <script  type="text/javascript" src="/design/static/js/app/system/platformSiteLanguageManage.js"></script>
  </head>
  <body>
    <form action="/system/platfromSiteLanguageManage" id="mainPageForm" method="post">
  	<div class="current_nav_name clearfix"><@s.message "platform.site.language"/>
		<div class="fr small_size"> 
		<button class="btn btn-sm " type="button" onclick="showPlatformDialog('<@s.message "platform.config"/>')">
			<@s.message "platform.config"/>
		</button>
		<button class="btn btn-sm " type="button" onclick="showSiteDialog('<@s.message "site.config"/>')">
			<@s.message "site.config"/>
		</button>
		<button class="btn btn-sm " type="button" onclick="showUserDialog('<@s.message "add.user"/>')">
			<i class="icon icon-plus-sign"></i> <@s.message "add.platform.site.language.relation"/>
		</button>
		</div>
	</div>
	<#include "../common/page.ftl"/>
	<div class="mainbody clearfix"> 
	  <div class="tableview clearfix">
	    <div class="content">
	    
	      <table class="tb_border tb_full stripe" id="userManageTable" name="pageTable">
	          <tr>
	            <th>平台</th>
	            <th>站点</th>
	            <th>语言</th>
	            <th>操作</th>
	          </tr>
	          <tr class="conditionTr">
	          	<td>
	          		<ul>
	          			<li>
	          				<#if page.params.role??> 
	          					<@select id="role" name="params[role]" selected="${page.params.role}" optionClass="Role"  cssClass="sel width_100px" headerKey="" headerValue=""/>
	          				<#else>
	          					<@select id="role" name="params[role]"  optionClass="Role"  cssClass="sel width_100px" headerKey="" headerValue=""/>
	          				</#if>
	          			</li>
	          			<li></li>
	          		</ul>
	          	</td>
	          	<td>
	          		<ul>
	          			<li>
	          				<#if page.params.role??> 
	          					<@select id="role" name="params[role]" selected="${page.params.role}" optionClass="Role"  cssClass="sel width_100px" headerKey="" headerValue=""/>
	          				<#else>
	          					<@select id="role" name="params[role]"  optionClass="Role"  cssClass="sel width_100px" headerKey="" headerValue=""/>
	          				</#if>
	          			</li>
	          			<li></li>
	          		</ul>
	          	</td>
	          	<td>
	          		<ul>
	          			<li>
	          				<#if page.params.role??> 
	          					<@select id="role" name="params[role]" selected="${page.params.role}" optionClass="Role"  cssClass="sel width_100px" headerKey="" headerValue=""/>
	          				<#else>
	          					<@select id="role" name="params[role]"  optionClass="Role"  cssClass="sel width_100px" headerKey="" headerValue=""/>
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
		            <td style="text-align:center"><input name="main_page_checkbox" type="checkbox" value="1" onclick="countCheckbox()" /></td>
		            <td>${obj.name!""}</td>
		            <td>${obj.userName!""}</td>
		            <td><@matchValue key="${obj.role}" optionClass="Role"/></td>
		            <td>${obj.email!""}</td>
		            <td>${obj.phone!""}</td>
		            <td><@matchValue key="${obj.status}" optionClass="OpenClose"/></td>
		            <td>${obj.createTime!""}</td>
		            <td>
		            	<a href="javascript:void(0)" onclick="showLog(this)"><img src="/design/static/images/common/system-log.png"/></a>
		            	<div class="log_content">
		            		${obj.log!""}
		            	</div>
		            </td>
		            <td class="optionTd" style="width:60px;text-align:center;">
		            	<div class="btn-group">
						  <button type="button" class="btn dropdown-toggle btn-sm" data-toggle="dropdown">
						  	操作
						  	<span class="caret"></span>
						  </button>
						  <ul class="dropdown-menu pull-right" role="menu">
						    <li><a href="javascript:void(0)" onclick="editUserInfo(${obj.id})" ><i class="icon icon-pencil"></i> 编辑 </a></li>
						    <li><a href="javascript:void(0)" onclick="permissionEdit(${obj.id})" ><i class="icon icon-eye-open"></i> 导航权限设置</a></li>
						    <li class="divider"></li>
						    <li><a href="javascript:void(0)" onclick="confirmMsg('deleteUser(${obj.id})')" ><i class="icon icon-trash"></i> 删除 </a></li>
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
	
	<div id="platFormDialog" style="display:none;">
		<div class="ta_r">
			<button class="btn btn-sm" type="button" onclick="showEditPlatformDialog('<@s.message "add.platform"/>')">
				<i class="icon icon-plus-sign"></i><@s.message "add.platform"/>
			</button>
		</div>
	 	<table class="popup_tb tb_border" id="platformListTable" style="margin-top:10px;">
	 		<tr>
	 			<th class="width_80" style="text-align:center">平台列表</th>
	 			<th class="width_20" style="text-align:center">操作</th>
	 		</tr>
	 	</table>
	</div>
	
	<div id="editPlatFormDialog" style="display:none;">
		<input type="hidden" name="id">
		<table class="popup_tb">
	 		<tr>
	 			<td class="title width_100px">平台名称<i class="star">*</i></td>
	 			<td><input type="text" class="txt width_80" name="name"/></td>
	 		</tr>
	 	</table>
	</div>
  </body>
</html>
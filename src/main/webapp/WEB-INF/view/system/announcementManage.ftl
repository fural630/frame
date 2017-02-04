<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <#include "../common/common.ftl"/>
    <script type="text/javascript" src="/design/frame/zui/lib/chosen/chosen.min.js"></script>
    <script src="/design/static/js/app/system/announcement.js"></script>
    <link rel="stylesheet" type="text/css" href="/design/frame/zui/lib/chosen/chosen.css"/>
  </head>
  <body>
    <form action="/system/announcementManage" id="mainPageForm" method="post">
  	<div class="current_nav_name clearfix"><@s.message "announcement.manage"/>
		<div class="fr small_size">
			<button class="btn btn-sm " type="button" onclick="showRoleDialog('<@s.message "add.announcement"/>')"><i class="icon icon-plus-sign"></i> <@s.message "add.announcement"/></button>
		</div>
	</div>
	<#include "../common/page.ftl"/>
	<div class="mainbody clearfix"> 
	  <div class="tableview clearfix">
	    <div class="content">
	      <table class="tb_border tb_full stripe" id="announcementManageTable" name="pageTable">
	          <tr>
	          	<th></th>
	            <th>ID</th>
	            <th>标题</th>
	            <th>创建人</th>
	            <th>修改时间</th>
	            <th>日志</th>
	            <th>操作</th>
	          </tr>
	          <tr class="conditionTr">
	          	<td></td>
	          	<td>
	          		<ul>
	          			<li><input type="text" class="txt width_100px" name="params[name]" value="${page.params.name!''}" /></li>
	          			<li></li>
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
	          			<li>
	          				<#if page.params.userSelect??> 
	          					<@select id="userSelect" name="params[userSelect]" selected="${page.params.userSelect}" optionClass="UserSelect"  cssClass="chosen-select form-control width_100px" headerKey="" headerValue="" tabindex="2"/>
	          				<#else>
	          					<@select id="userSelect" name="params[userSelect]"  optionClass="UserSelect"  cssClass="chosen-select form-control width_100px" headerKey="" headerValue="" tabindex="2"/>
	          				</#if>
	          			</li>
	          			<li></li>
	          		</ul>
	          	</td>
	          	<td>
	          		<ul>
						<li>
							<label>从：</label>
							<input type="text" class="txt width_100px datepicker" name="params[timeFrom]" value="${page.params.timeFrom!""}" />
						</li>
						<li>
							<label>到：</label>
							<input type="text" class="txt width_100px datepicker" name="params[timeTo]" value="${page.params.timeTo!""}" />
						</li>
					</ul>
	          	</td>
	          	<td></td>
	          	<td></td>
	          </tr>
	          </form>
		  		 <tr>
		            <td style="text-align:center"><input name="main_page_checkbox" type="checkbox" value="1" onclick="countCheckbox()" /></td>
		            <td>name</td>
		            <td>username</td>
		            <td>email</td>
		            <td>createTime</td>
		            <td>
		            	<a href="javascript:void(0)" onclick="showLog(this)"><img src="/design/static/images/common/system-log.png"/></a>
		            	<div class="log_content">
		            		log
		            	</div>
		            </td>
		            <td class="optionTd" style="width:60px;text-align:center;">
			          	<div class="btn-group">
						  <button type="button" class="btn dropdown-toggle btn-sm" data-toggle="dropdown">
						  	操作
						  	<span class="caret"></span>
						  </button>
						  <ul class="dropdown-menu pull-right" role="menu">
						    <li><a href="javascript:void(0)" onclick="editUserInfo()" ><i class="icon icon-pencil"></i> 编辑 </a></li>
						    <li><a href="javascript:void(0)" onclick="permissionEdit()" ><i class="icon icon-eye-open"></i> 查看</a></li>
						    <li class="divider"></li>
						    <li><a href="javascript:void(0)" onclick="confirmMsg('deleteUser()')" ><i class="icon icon-trash"></i> 删除 </a></li>
						  </ul>
						</div>
		            </td>
		          </tr>
	      		</table>
			<div class="paging clearfix">
				<div class="massaction"></div>
			</div>
	    </div>
	  </div>
	</div>
	
	<div id="roleDialog" style="display:none;">
		<input type="hidden" name="id"/>
		<form id="roleDialogFrom">
	 	<table class="popup_tb">
	 		<tr>
	 			<td class="title width_100px">角色名称<i class="star">*</i></td>
	 			<td><input type="text" class="txt width_50" name="roleName" required/></td>
	 		</tr>
	 		<tr>
	 			<td class="title width_100px">角色描述<i class="star">*</i></td>
	 			<td><textarea class="txt width_96 remark" id="description" name="description" style="height:150px;"></textarea></td>
	 		</tr>
	 	</table>
	 	</form>
	</div>
  
  </body>
</html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <#include "../common/common.ftl"/>
    <script src="/design/static/js/app/system/roleManage.js"></script>
  </head>
  <body>
    <form action="/system/roleManage" id="mainPageForm" method="post">
  	<div class="current_nav_name clearfix"><@s.message "navigator.role.manage"/>
		<div class="fr small_size">
			<button class="btn btn-sm " type="button" onclick="showRoleDialog('<@s.message "add.role"/>')"><i class="icon icon-plus-sign"></i> <@s.message "add.role"/></button>
		</div>
	</div>
	<#include "../common/page.ftl"/>
	<div class="mainbody clearfix"> 
	  <div class="tableview clearfix">
	    <div class="content">
	      <table class="tb_border tb_full stripe" id="roleManageTable" name="pageTable">
	          <tr>
	          	<th></th>
	            <th>角色名称</th>
	            <th>角色描述</th>
	            <th>创建人</th>
	            <th>最近修改人</th>
	            <th>创建时间</th>
	            <th>修改时间</th>
	            <th>日志</th>
	            <th>操作</th>
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
	          	<td>
	          		<ul>
	          			<li>
	          				<input type="text" class="txt width_100px" name="params[phone]" value="${page.params.phone!''}" />
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
		            <td>123</td>
		            <td>fe</td>
		            <td>createTime</td>
		            <td>
		            	<a href="javascript:void(0)" onclick="showLog(this)"><img src="/design/static/images/common/system-log.png"/></a>
		            	<div class="log_content">
		            		log
		            	</div>
		            </td>
		            <td style="width:60px;text-align:center;">
						<div class="btn-group">
						  <button type="button" class="btn dropdown-toggle btn-sm" data-toggle="dropdown">
						  	操作
						  	<span class="caret"></span>
						  </button>
						  <ul class="dropdown-menu pull-right" role="menu">
						    <li><a href="###">操作</a></li>
						    <li><a href="###">另一个操作</a></li>
						    <li class="divider"></li>
						    <li><a href="###">更多操作</a></li>
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
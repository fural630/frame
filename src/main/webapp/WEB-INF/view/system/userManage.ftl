<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <#include "../common/common.ftl"/>
    <script  type="text/javascript" src="/design/static/js/app/system/userManage.js"></script>
	<link rel="stylesheet" type="text/css" href="/design/frame/jquery/zTree_v3-master/css/zTreeStyle/zTreeStyle.css"/>
	<script type="text/javascript" src="/design/frame/jquery/zTree_v3-master/js/jquery.ztree.core.js"></script>
	<script type="text/javascript" src="/design/frame/jquery/zTree_v3-master/js/jquery.ztree.excheck.min.js"></script>
  </head>
  <body>
    <form action="/system/userManage" id="mainPageForm" method="post">
  	<div class="current_nav_name clearfix"><@s.message "navigator.user.manage"/>
		<div class="fr small_size"> 
		<button class="btn btn-sm " type="button" onclick="showUserDialog('<@s.message "add.user"/>')">
			<i class="icon icon-plus-sign"></i> <@s.message "add.user"/>
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
	            <th sort="name">姓名<input type="text" name="sorts[name]" value="${page.sorts.name!''}"></th>
	            <th sort="userName">账号<input type="text" name="sorts[userName]" value="${page.sorts.userName!''}"></th>
	            <th>角色</th>
	            <th>邮箱</th>
	            <th>电话</th>
	            <th>账号状态</th>
	            <th>创建时间</th>
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
	          			<li><input type="text" class="txt width_100px" name="params[userName]" value="${page.params.userName!''}" /></li>
	          			<li>*&nbsp;<input type="checkbox" title="勾选启用模糊查找" name="params[userNameLike]" <#if page.params.userNameLike??> checked </#if>></li>
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
	          			<li><input type="text" class="txt width_100px" name="params[email]" value="${page.params.email!''}" /></li>
	          			<li>*&nbsp;<input type="checkbox" title="勾选启用模糊查找" name="params[emailLike]" <#if page.params.emailLike??> checked </#if>></li>
	          		</ul>
	          	</td>
	          	<td>
	          	</td>
	          	<td>
	          		<ul>
	          			<li>
	          				<#if page.params.status??> 
	          					<@select id="status" name="params[status]" selected="${page.params.status}" optionClass="OpenClose"  cssClass="sel width_100px" headerKey="" headerValue=""/>
	          				<#else>
	          					<@select id="status" name="params[status]"  optionClass="OpenClose"  cssClass="sel width_100px" headerKey="" headerValue=""/>
	          				</#if>
	          			</li>
	          			<li></li>
					</ul>	
	          	</td>
	          	<td>
	          		<ul>
						<li>
							<label>从：</label>
							<input type="text" class="txt width_100px datepicker" name="params[createTimeFrom]" value="${page.params.createTimeFrom!""}" />
						</li>
						<li>
							<label>到：</label>
							<input type="text" class="txt width_100px datepicker" name="params[createTimeTo]" value="${page.params.createTimeTo!""}" />
						</li>
					</ul>
	          	</td>
	          	<td></td>
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
	
	<div id="userDialog" style="display:none;">
		<input type="hidden" name="id"/>
	 	<table class="popup_tb">
	 		<tr>
	 			<td class="title width_100px">姓名<i class="star">*</i></td>
	 			<td><input type="text" class="txt width_50" name="name"/></td>
	 		</tr>
	 		<tr>
	 			<td class="title width_100px">账号<i class="star">*</i></td>
	 			<td><input type="text" class="txt width_50" name="userName"/></td>
	 		</tr>
	 		<tr>
	 			<td class="title width_100px">密码<i class="star">*</i></td>
	 			<td><input type="password" class="txt width_50" name="password"/></td>
	 		</tr>
	 		<tr>
	 			<td class="title width_100px">角色<i class="star">*</i></td>
	 			<td>
	 				<@select name="role" cssClass="sel width_100px" id="role" selected="1" optionClass="Role"/>
	 			</td>
	 		</tr>
	 		<tr>
	 			<td class="title width_100px">账号状态<i class="star">*</i></td>
	 			<td><@select name="status" cssClass="sel width_100px" id="status" selected="1" optionClass="OpenClose"/></td>
	 		</tr>
	 		<tr>
	 			<td class="title width_100px">邮箱</td>
	 			<td><input type="email" class="txt width_50" name="email"/></td>
	 		</tr>
	 		<tr>
	 			<td class="title width_100px">电话</td>
	 			<td><input type="text" class="txt width_50" name="phone" /></td>
	 		</tr>
	 	</table>
	 	<div class="validateTip"></div>
	</div>
	
	<div id="userNavigatorDialog" style="display:none;">
		<input type="hidden" name="id"/>
		<div class="alert alert-info" style="padding:10px;">
			重新设置用户导航权限后，需退出重新登录后才能生效。
		</div>
		<div id="navigatorTree" class="ztree"></div>
	</div>
  
  </body>
</html>
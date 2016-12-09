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
		<div class="fr small_size"> <a class="btn" onclick="showRoleDialog('<@s.message "add.role"/>')"><img src="/design/frame/style/img/add.png"/><@s.message "add.role"/></a>
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
	          	<#if collection??>
	          		<#list collection as obj>
	      		 <tr>
		            <td style="text-align:center"><input name="main_page_checkbox" type="checkbox" value="1" onclick="countCheckbox()" /></td>
		            <td>${obj.name!""}</td>
		            <td>${obj.username!""}</td>
		            <td>${obj.email!""}</td>
		            <td>123</td>
		            <td><@matchValue key="${obj.status}" optionClass="OpenClose"/></td>
		            <td>${obj.createTime!""}</td>
		            <td>
		            	<a href="javascript:void(0)" onclick="showLog(this)"><img src="/design/static/images/common/system-log.png"/></a>
		            	<div class="log_content">
		            		${obj.log!""}
		            	</div>
		            </td>
		            <td style="width:60px;text-align:center;">
					 <div class="menu">
					  <ul>
					    <li class="option_btn" onmouseover="optionMouserover(this)" onmouseout="optionMouseout(this)"><a class="btn" href="javascript:void(0)">操作</a>
					      <ul class="menu_ul">
							<li><a href="javascript:void(0)" onclick="editUserInfo(${obj.id})" >编辑 </a></li>
					        <li><a href="javascript:void(0)" onclick="deleteUser(${obj.id})" >删除 </a></li>
					      </ul>
					    </li>
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
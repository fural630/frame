<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<#include "../common/common.ftl"/>
		<script type="text/javascript" src="/design/frame/zui/lib/chosen/chosen.min.js"></script>
		<link rel="stylesheet" type="text/css" href="/design/frame/zui/lib/chosen/chosen.css"/>
		<script type="text/javascript" src="/design/frame/jquery/zTree_v3-master/js/jquery.ztree.core.js"></script>
		<script type="text/javascript" src="/design/frame/jquery/zTree_v3-master/js/jquery.ztree.excheck.min.js"></script>
		<link rel="stylesheet" type="text/css" href="/design/frame/jquery/zTree_v3-master/css/zTreeStyle/zTreeStyle.css"/>
		<script type="text/javascript" src="/design/static/js/app/system/publishUserDistributeManage.js"></script>
	</head>
	<body>
		<form action="/system/publishUserDistributeManage" id="mainPageForm" method="post">
		<div class="current_nav_name clearfix">刊登人分配配置
			<div class="fr small_size">
				<button class="btn btn-sm" type="button" onclick="showPublishUserDistributeDialog('<@s.message "config.publish.user.distribute"/>')">
					<i class="icon icon-plus-sign"></i> <@s.message "config.publish.user.distribute"/>
				</button>
			</div>
		</div>
		<#include "../common/page.ftl"/>
		<div class="mainbody clearfix">
			<div class="tableview clearfix">
				<div class="content">
					<table class="tb_border tb_full stripe" id="publicUserDistributeTable" name="pageTable">
						<tr>
							<th></th>
							<th>图片</th>
							<th>SPU</th>
							<th>平台</th>
							<th>站点</th>
							<th>刊登人</th>
							<th>创建人</th>
							<th>创建时间</th>
							<th>操作</th>
						</tr>
						<tr class="conditionTr">
							<td></td>
							<td></td>
							<td>
				          		<ul>
				          			<li><input type="text" class="txt width_100px" name="params[sku]" value="${page.params.sku!''}" /></li>
				          			<li>*&nbsp;<input type="checkbox" title="勾选启用模糊查找" name="params[skuLike]" <#if page.params.skuLike??> checked </#if>></li>
				          		</ul>
				          	</td>
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
				          			<li>
				          			<#if page.params.platformSiteId??> 
			          					<@select id="platformSiteId" name="params[platformSiteId]" selected="${page.params.platformSiteId}" optionClass="SiteSelect"  cssClass="sel width_100px" headerKey="" headerValue=""/>
			          				<#else>
			          					<@select id="platformSiteId" name="params[platformSiteId]"  optionClass="SiteSelect"  cssClass="sel width_100px" headerKey="" headerValue=""/>
			          				</#if>
			          				</li>
				          			<li></li>
				          		</ul>
	          				</td>
	          				<td>
	          					<ul>
		          					<li>
				          				<#if page.params.publishUserId??> 
				          					<@select id="publishUserId" name="params[publishUserId]" selected="${page.params.publishUserId}" optionClass="UserSelect"  cssClass="chosen-select form-control width_100px" headerKey="" headerValue="" tabindex="2"/>
				          				<#else>
				          					<@select id="publishUserId" name="params[publishUserId]"  optionClass="UserSelect"  cssClass="chosen-select form-control width_100px" headerKey="" headerValue="" tabindex="2"/>
				          				</#if>
				          			</li>
				          			<li></li>
			          			</ul>
	          				</td>
	          				<td>
	          					<ul>
		          					<li>
				          				<#if page.params.creatorId??> 
				          					<@select id="creatorId" name="params[creatorId]" selected="${page.params.creatorId}" optionClass="UserSelect"  cssClass="chosen-select form-control width_100px" headerKey="" headerValue="" tabindex="2"/>
				          				<#else>
				          					<@select id="creatorId" name="params[creatorId]"  optionClass="UserSelect"  cssClass="chosen-select form-control width_100px" headerKey="" headerValue="" tabindex="2"/>
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
						</tr>
						</form>
						<tr>
				            <td style="text-align:center"><input name="main_page_checkbox" type="checkbox" value="1" onclick="countCheckbox()" /></td>
				            <td>
				            	<img src="https://cbu01.alicdn.com/img/ibank/2017/636/892/3966298636_1619311604.jpg" data-image="https://cbu01.alicdn.com/img/ibank/2017/636/892/3966298636_1619311604.jpg" class="img-thumbnail" width="110"/>
				            </td>
				           	<td>Spu</td>
				            <td>
				            	123
				            </td>
				            <td>
				            	123
				            </td>
				            <td>
				            	123
				            </td>
				            <td>
				            	123
				            </td>
				            <td>
				            	123
				            </td>
				            <td class="optionTd" style="width:60px;text-align:center;">
				            	<div class="btn-group">
								  <button type="button" class="btn dropdown-toggle btn-sm" data-toggle="dropdown">
								  	操作
								  	<span class="caret"></span>
								  </button>
								  <ul class="dropdown-menu pull-right" role="menu">
								    <li><a href="javascript:void(0)" onclick="editUserInfo(2)" ><i class="icon icon-pencil"></i> 编辑 </a></li>
								    <li class="divider"></li>
								    <li><a href="javascript:void(0)" onclick="confirmMsg('deleteUser(3)')" ><i class="icon icon-trash"></i> 删除 </a></li>
								  </ul>
								</div>
				            </td>
				        </tr>
					</table>
					<div class="paging clearfix">
						<div class="massaction">
							<table class="tb_common">
								<tr>
									<td style="width:40%" class="td_left">
										<a href="javascript:void(0)" onclick="pageSelectAll();">全选</a>&nbsp;&nbsp;|&nbsp;&nbsp;
										<a href="javascript:void(0)" onclick="pageNoSelectAll();">全不选</a>&nbsp;&nbsp;|&nbsp;&nbsp;
										<a href="javascript:void(0)" onclick="pageUnselected();">反选</a>&nbsp;&nbsp;|&nbsp;&nbsp;
										已选择&nbsp;<span id="pageCheckCount">0</span>&nbsp;条
									</td>
									<td class="td_right">批量操作&nbsp;&nbsp;
										<select class="sel" id="batchOptionSelect">
											<option value="" selected></option>
											<option value="batchDeleteProduct">批量删除</option>
										</select>
										&nbsp; <button class="btn btn-sm" type="button" onclick="batchOptionSubmit()">提交</button>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div id="publishUserConfigDialog" style="display:none;">
			<div class="ta_r">
				<button class="btn btn-sm " type="button" onclick="resetAll()"><i class="icon icon-undo"></i> 重置查询</button>
			</div>
			<table class="popup_tb" style="margin-top:10px;">
	 		<tr>
	 			<td class="title" style="width:25%">SPU<i class="star">*</i></td>
	 			<td class="title" style="width:25%">平台<i class="star">*</i></td>
	 			<td class="title" style="width:25%">站点<i class="star">*</i></td>
	 			<td class="title" style="width:25%">刊登人<i class="star">*</i></td>
	 		</tr>
	 		<tr>
	 			<td>
	 				<input type="text" class="txt width_100px" name="spu" value="">
	 				<button class="btn btn-sm " type="button" onclick="inintSpuZtree()"><i class="icon icon-search"></i></i> 查询</button>
	 			</td>
	 			<td>
	 				<@select id="platformId" name="platformId" optionClass="Platform"  cssClass="sel width_100px" headerKey="" headerValue=""/>
	 				<button class="btn btn-sm" type="button" onclick="">
						<i class="icon icon-plus-sign"></i>
					</button>
					<button class="btn btn-sm btn-danger" type="button" onclick="">
						<i class="icon icon-trash"></i>
					</button>
	 			</td>
	 			<td>
	 				<@select id="siteId" name="siteId" optionClass="SiteSelect"  cssClass="sel width_100px" headerKey="" headerValue=""/>
	 				<button class="btn btn-sm" type="button" onclick="">
						<i class="icon icon-plus-sign"></i>
					</button>
					<button class="btn btn-sm btn-danger" type="button" onclick="">
						<i class="icon icon-trash"></i>
					</button>
	 			</td>
	 			<td>
	 				<@select id="publishUserId" name="publishUserId" optionClass="UserSelect"  cssClass="sel width_100px" headerKey="" headerValue=""/>
	 				<button class="btn btn-sm" type="button" onclick="">
						<i class="icon icon-plus-sign"></i>
					</button>
					<button class="btn btn-sm btn-danger" type="button" onclick="">
						<i class="icon icon-trash"></i>
					</button>
	 			</td>
	 		<tr>
	 		<tr>
	 			<td valign="top">
 					<div id="spuTree" class="ztree"></div>
	 			</td>
	 			<td valign="top">
	 				<div id="platformTree" class="ztree"></div>
	 			</td>
	 			<td valign="top">
	 				<div id="siteTree" class="ztree"></div>
	 			</td>
	 			<td valign="top">
	 				<div id="publishUserTree" class="ztree"></div>
	 			</td>
	 		<tr>
 		</table>
		</div>
		
	</body>
</html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <#include "../common/common.ftl"/>
    <script src="/design/static/js/app/product/productManage.js"></script>
  </head>
  <body>
    <form action="/system/userManage" id="mainPageForm" method="post">
  	<div class="current_nav_name clearfix">产品中心
		<div class="fr small_size"> 
		<button class="btn btn-sm " type="button" onclick="showProductDialog('添加产品')">
			<i class="icon icon-plus-sign"></i> 添加产品
		</button>
		<button class="btn btn-sm " type="button" onclick="showUploadProductDialog('批量导入产品')">
			<i class="icon icon-upload-alt"></i> 批量导入产品
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
	            <th>SKU</th>
	            <th>SPU</th>
	            <th>基本信息</th>
	            <th>主图</th>
	            <!--
	            <th>尺寸信息</th>
	            -->
	            <th>采购信息</th>
	            <th>审核状态</th>
	            <th>人员信息</th>
	            <th>时间信息</th>
	            <th>日志</th>
	            <th>操作</th>
	          </tr>
	          <tr class="conditionTr">
	          	<td></td>
	          	<td>
	          		<ul>
	          			<li>
	          				<select class="sel width_100px">
	          					<option></option>
	          					<option>SKU</option>
	          					<option>SPU</option>
	          				</select>
	          			</li>
	          			<li><input type="text" class="txt width_100px" name="params[name]" value="${page.params.name!''}" /></li>
	          			<li>*&nbsp;<input type="checkbox" title="勾选启用模糊查找" name="params[nameLike]" <#if page.params.nameLike??> checked </#if>></li>
	          		</ul>
	          	</td>
	          	<td>
	          		<li><input type="text" class="txt width_100px" name="params[name]" value="${page.params.name!''}" /></li>
          			<li>*&nbsp;<input type="checkbox" title="勾选启用模糊查找" name="params[nameLike]" <#if page.params.nameLike??> checked </#if>></li>
	          	</td>
	          	<td>
	          		<ul>
	          			<li>
	          				<select class="sel width_100px">
	          					<option></option>
	          					<option>中文名</option>
	          					<option>英文名</option>
	          				</select>
	          			</li>
	          			<li><input type="text" class="txt width_100px" name="params[name]" value="${page.params.name!''}" /></li>
	          			<li>*&nbsp;<input type="checkbox" title="勾选启用模糊查找" name="params[nameLike]" <#if page.params.nameLike??> checked </#if>></li>
	          		</ul>
	          	</td>
	          	<td></td>
	          	<td>
	          		<ul>
	          			<li><input type="text" class="txt width_100px" name="params[email]" value="${page.params.email!''}" /></li>
	          			<li>*&nbsp;<input type="checkbox" title="勾选启用模糊查找" name="params[emailLike]" <#if page.params.emailLike??> checked </#if>></li>
	          		</ul>
	          	</td>
	          	<!--
	          	<td>
	          		<ul>
	          			<li>
	          				<input type="text" class="txt width_100px" name="params[phone]" value="${page.params.phone!''}" />
	          			</li>
	          			<li></li>
	          		</ul>
	          	</td>
	          	-->
	          	<td>
	          		<ul>
	          			<li>
	          				<#if page.params.status??> 
	          					<@select id="status" name="params[status]" selected="${page.params.status}" optionClass="OpenClose"  cssClass="sel width_50px" headerKey="" headerValue=""/>
	          				<#else>
	          					<@select id="status" name="params[status]"  optionClass="OpenClose"  cssClass="sel width_50px" headerKey="" headerValue=""/>
	          				</#if>
	          			</li>
	          			<li></li>
					</ul>	
	          	</td>
	          	<td></td>
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
	      		 <tr>
		            <td style="text-align:center"><input name="main_page_checkbox" type="checkbox" value="1" onclick="countCheckbox()" /></td>
		            <td>
		            	SKU:DV7-01
		            </td>
		            <td>
		            	SPU:DV7
		            </td>
		            <td>
		            	中文名：烘焙模具 六件套<br/>
		            	英文名：cooking accessory
		            </td>
		            <td><img src="http://www.guphotos.com/images/V/5/V2225/V2225-1-53ce-xCR4.jpg" width="100" height="100"/></td>
		            <!--
		            <td>
		            	包裹长度：10（cm）<br/>
		          		包裹宽度：10（cm）<br/>
		          		包裹高度：5（cm）<br/>
		          		包裹重量：50（g）<br/>
		            </td>
		            -->
		            <td>
		            	采购价：10<br/>
		            	采购链接：<a href="http://detail.1688.com/offer/520381456935.html?spm=0.0.0.0.tfSOcH">打开链接</a><br/>
		            	采购备注：50单起
		            </td>
		            <td>待编辑</td>
		            <td>
		            	创建人：张三<br/>
		            	编辑人：未分配<br/>
		            	刊登人：未分配<br/>
		            </td>
		            <td>
		            	创建时间：<br/>2016-05-05 10:10:10<br/>
		            	修改时间：<br/>2016-05-05 10:10:10<br/>
		            </td>
		            <td>
		            	<a href="javascript:void(0)" onclick="showLog(this)"><img src="/design/static/images/common/system-log.png"/></a>
		            	<div class="log_content">
		            		123
		            	</div>
		            </td>
		            <td class="optionTd" style="width:60px;text-align:center;">
		            	<div class="btn-group">
						  <button type="button" class="btn dropdown-toggle btn-sm" data-toggle="dropdown">
						  	操作
						  	<span class="caret"></span>
						  </button>
						  <ul class="dropdown-menu pull-right" role="menu">
						    <li><a href="javascript:void(0)" onclick="editUserInfo(1})"><i class="icon icon-edit"></i> 编辑 </a></li>
						    <li><a href="javascript:void(0)" onclick="reviewAudit(1)" ><i class="icon icon-check-board"></i> 查看审核 </a></li>
						    <li><a href="javascript:void(0)" onclick="reviewAudit(1)" ><i class="icon icon-hand-right"></i> 分配编辑人</a></li>
						    <li><a href="javascript:void(0)" onclick="reviewAudit(1)" ><i class="icon icon-hand-right"></i> 分配刊登人</a></li>
						    <li class="divider"></li>
						    <li><a href="javascript:void(0)" onclick="deleteUser(1)" ><i class="icon icon-trash"></i> 删除 </a></li>
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
									<option value="batchUploadOffers">批量分配编辑人</option>
									<option value="batchUpdateToWaitPendding">批量分配刊登人</option>
									<option value="batchShelvesProduct">批量删除</option>
									<option value="batchDelete">批量通过审核</option>
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
	
	<div id="productDialog" style="display:none;">
		<input type="hidden" name="id"/>
		<div id="tabs">
		  <ul>
		    <li><a href="#tabs-1">基本信息</a></li>
		    <li><a href="#tabs-2">视图信息</a></li>
		    <li><a href="#tabs-3">采购信息</a></li>
		    <li><a href="#tabs-4">尺寸信息</a></li>
		    <li><a href="#tabs-5">描述信息</a></li>
		  </ul>
		  <div id="tabs-1">
		    <table class="popup_tb">
		 		<tr>
		 			<td class="title width_100px">SKU<i class="star">*</i></td>
		 			<td><input type="text" class="txt width_50" name="sku"/></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">SPU<i class="star">*</i></td>
		 			<td><input type="password" class="txt width_50" name="spu"/></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">中文名<i class="star">*</i></td>
		 			<td><input type="text" class="txt width_98" name=""/></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">英文名</td>
		 			<td><input type="text" class="txt width_98" name="" /></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">法语名</td>
		 			<td><input type="text" class="txt width_98" name="" /></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">德语名</td>
		 			<td><input type="text" class="txt width_98" name="" required/></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">意大利语名</td>
		 			<td><input type="text" class="txt width_98" name="" required/></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">日语名</td>
		 			<td><input type="text" class="txt width_98" name="" required/></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">西班牙语名</td>
		 			<td><input type="text" class="txt width_98" name="" required/></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">中文报关名</td>
		 			<td><input type="text" class="txt width_98" name="" required/></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">英文报关名</td>
		 			<td><input type="text" class="txt width_98" name="" required/></td>
		 		</tr>
		 	</table>
		  </div>
		  
		  <div id="tabs-2">
		  	<input type="text" class="txt" style="width:80%;" id="imageUrlAddress" placeholder="图片地址/Url"/>
		  	<button class="btn btn-sm " type="button" onclick="addImageUrlAddress();">
				<i class="icon icon-plus-sign"></i> 添加
			</button>
				<img data-toggle="lightbox" src="http://www.guphotos.com/images/V/5/V2225/V2225-1-53ce-xCR4.jpg" 
				data-image="http://www.guphotos.com/images/V/5/V2225/V2225-1-53ce-xCR4.jpg" data-caption="" class="img-thumbnail" title="点击放大" width="110">
				<img data-toggle="lightbox" src="http://www.guphotos.com/images/V/5/V2225/V2225-1-53ce-xCR4.jpg" 
				data-image="http://www.guphotos.com/images/V/5/V2225/V2225-1-53ce-xCR4.jpg" data-caption="" class="img-thumbnail" title="点击放大" width="110">
				<!--
				<table style="width:100%;text-align:center; margin-top:5px;">
					<tr>
						<td>
							<button class="btn btn-sm " type="button">
								<i class="icon icon-trash"></i> 删除
							</button>
						</td>
					</tr>
				</table>
				-->
	 	  </div>
	 	  
		  <div id="tabs-3">
	  		<table class="popup_tb">
		 		<tr>
		 			<td class="title width_100px">采购价格</td>
		 			<td><input type="text" class="txt width_100px" name=""/></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">采购链接</td>
		 			<td><input type="text" class="txt width_96" name=""/></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">采购备注</td>
		 			<td><textarea class="txt width_96 remark" id="" name="" placeholder="" style="height:150px;"></textarea></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">销售备注</td>
		 			<td><textarea class="txt width_96 remark" id="" name="" placeholder="" style="height:150px;"></textarea></td>
		 		</tr>
	 		</table>
		  </div>
		  
		  <div id="tabs-4">
			  <table class="popup_tb">
		 		<tr>
		 			<td class="title width_100px">含包装重量(g)</td>
		 			<td><input type="text" class="txt width_100px" name=""/></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">包装长度(cm)</td>
		 			<td><input type="text" class="txt width_100px" name=""/></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">包装宽度(cm)</td>
		 			<td><input type="text" class="txt width_100px" name=""/></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">包装高度(cm)</td>
		 			<td><input type="text" class="txt width_100px" name=""/></td>
		 		</tr>
	 		</table>
		  </div>
		  
		  <div id="tabs-5">
	  		<table class="popup_tb">
		 		<tr>
		 			<td class="title width_100px">中文描述</td>
		 			<td><textarea id="description_cn" name="description_cn"></textarea></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">英文描述</td>
		 			<td><textarea id="description_en" name="description_en"></textarea></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">包装宽度(cm)</td>
		 			<td><input type="text" class="txt width_100px" name=""/></td>
		 		</tr>
		 		<tr>
		 			<td class="title width_100px">包装高度(cm)</td>
		 			<td><input type="text" class="txt width_100px" name=""/></td>
		 		</tr>
	 		</table>
		  </div>
		  
		</div>
	</div>
	
	<div id="uploadProductDialog" style="display:none;">
		<table class="popup_tb">
	 		<tr>
	 			<td class="title width_100px">上传文件<i class="star">*</i></td>
	 			<td><input type="file" class="form-control" value="" style="width:50%"></td>
	 		</tr>
	 		<tr>
	 			<td class="title width_100px">模板文件下载<i class="star">*</i></td>
	 			<td><a><i class="icon icon-file-excel"></i> 商品导入文件模板下载</a></td>
	 		</tr>
 		</table>
		
	</div>
	
	<div id="auditProductDialog" style="display:none;">
		<div class="comments">
		  <section class="comments-list">
		    <div class="comment">
		      <a href="###" class="avatar">
		        <i class="icon-user icon-2x"></i>
		      </a>
		      <div class="content">
		        <div class="pull-right text-muted">2016-05-10 10:56:25</div>
		        <div><a href="###"><strong>Catouse</strong></a></div>
		        <div class="text">你到底把我家钥匙放哪里了...</div>
		      </div>
		    </div>
		    
		    <div class="comment">
		      <a href="###" class="avatar">
		        <i class="icon-yinyang icon-2x"></i>
		      </a>
		      <div class="content">
		        <div class="pull-right text-muted">2016-05-10 10:56:25</div>
		        <div><a href="###"><strong>张三</strong></a></div>
		        <div class="text">对不起我也没看见</div>
		      </div>
		    </div>
		    
		  </section>
		  <footer>
		    <div class="reply-form" id="commentReplyForm1">
		      <a href="###" class="avatar"><i class="icon-user icon-2x"></i></a>
		      <form class="form">
		        <div class="form-group">
		          <textarea class="form-control new-comment-text" rows="3" placeholder="撰写留言..." style="width:98%"></textarea>
		        </div>
		      </form>
		    </div>
		  </footer>
		</div>
	</div>
	
	
  
  </body>
</html>
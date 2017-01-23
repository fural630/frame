<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <#include "../common/common.ftl"/>
    <script type="text/javascript" src="/design/static/js/app/shopee/shopeePublishManage.js"></script>
    <link rel="stylesheet" type="text/css" href="/design/static/css/shopee/shopeePublishManage.css"/>
  </head>
  <body>
    <form action="/shopee/shopeePublishManage" id="mainPageForm" method="post">
  	<div class="current_nav_name clearfix">Shopee<@s.message "shopee.publish.manage"/>
		<div class="fr small_size">
			<button class="btn btn-sm" type="button" onclick="showShpeeSkuDialog('获取刊登SKU')"> 获取刊登SKU <span class="label label-badge">12</span></button>
		</div>
	</div>
	<#include "../common/page.ftl"/>
	<div class="mainbody clearfix"> 
	  <div class="tableview clearfix">
	    <div class="content">
	      <table class="tb_border tb_full stripe" id="categoryManageTable" name="pageTable">
	          <tr>
	          	<th></th>
	            <th><i class="icon icon-caret-up"></i>SKU</th>
	            <th><i class="icon icon-caret-down"></i>SPU</th>
	            <th>主图</th>
	            <th>名称</th>
	            <th>品牌名</th>
	            <th>CategoryID</th>
	            <th>价格</th>
	            <th>库存</th>
	            <th>产品重量</th>
	            <th>运输时间</th>
	            <th>编辑状态</th>
	            <th>操作</th>
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
	          	</td>
	          	<td>
	          		<ul>
	          			<li><input type="text" class="txt width_100px" name="params[categoryId]" value="${page.params.categoryId!''}" /></li>
	          			<li>*&nbsp;<input type="checkbox" title="勾选启用模糊查找" name="params[categoryIdLike]" <#if page.params.categoryIdLike??> checked </#if>></li>
	          		</ul>
	          	</td>
	          	<td></td>
	          	<td></td>
	          	<td></td>
	          	<td></td>
	          	<td></td>
	          	<td></td>
	          	<td></td>
	          	<td></td>
	          </tr>
	          </form>
	          <tr>
	          	<td style="text-align:center"><input name="main_page_checkbox" type="checkbox" value="" onclick="countCheckbox()" /></td>
	          	<td>SKU</td>
	          	<td>SPU</td>
	          	<td><img src="https://www.guphotos.com/images/W/L/W3770BL/W3770BL-1-e87c-dmkq.jpg" data-image="https://www.guphotos.com/images/W/L/W3770BL/W3770BL-1-e87c-dmkq.jpg" class="img-thumbnail" width="110"/></td>
	          	<td>Climbing Rigging Rescue</td>
	          	<td>Smart</td>
	          	<td>4782</td>
	          	<td>20.1</td>
	          	<td>999</td>
	          	<td>30</td>
	          	<td>2</td>
	          	<td>待编辑</td>
	            <td class="optionTd" style="width:60px;text-align:center;">
	            	<div class="btn-group">
					  <button type="button" class="btn dropdown-toggle btn-sm" data-toggle="dropdown">
					  	操作
				  	  <span class="caret"></span>
					  </button>
		          		<ul class="dropdown-menu pull-right" role="menu">
						    <li><a href="javascript:void(0)" onclick="editSku()" ><i class="icon icon-edit"></i> 单体编辑</a></li>
						    <li><a href="javascript:void(0)" onclick="editMultiSku()" ><i class="icon icon-edit-sign"></i> 变体编辑</a></li>
						    <li class="divider"></li>
						    <li><a href="javascript:void(0)" onclick="confirmMsg('deleteProduct()')" ><i class="icon icon-trash"></i> 删除 </a></li>
					  	</ul>
					</div>
	          	</td>
	          </tr>
	          	<#if collection??>
	          		<#list collection as obj>
			  		 <tr>
			            <td style="text-align:center"><input name="main_page_checkbox" type="checkbox" value="${obj.id}" onclick="countCheckbox()" /></td>
			            <td>
			            </td>
			            <td>
			            </td>
			            <td>
			            </td>
			            <td>
			            </td>
			          </tr>
		          </#list>
		  		</#if>
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
									<#if page.params._roleLevel gte 10>
										<option value="batchDistributeEditUser">生成平台上传文件</option>
									</#if>
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
	
	<div id="shopeeProductDialog" style="display:none;">
		<input type="hidden" name="id"/>
		<table class="popup_tb">
	 		<tr>
	 			<td class="title width_100px">SKU<i class="star">*</i></td>
	 			<td><input type="text" class="txt width_100px" name="sku"/></td>
	 		</tr>
	 		<tr>
	 			<td class="title width_100px">Parent SKU<i class="star">*</i></td>
	 			<td><input type="text" class="txt width_100px" name="parentSku"/></td>
	 		</tr>
	 		<tr>
	 			<td class="title width_100px">产品类别<i class="star">*</i></td>
	 			<td>
	 				<div>
	 					<button class="btn btn-sm " type="button" onclick="expandCategory()">
	 						<i class="icon icon-double-angle-down"></i> 展开类别
						</button>&nbsp;&nbsp;已选类别 &nbsp;&nbsp;:&nbsp;&nbsp;
	 					<span id="navigation"></span>
	 				</div>	
	 				<div class="category_area" id="categoryArea"></div>
	 			</td>
	 		</tr>
	 		<tr>
	 			<td class="title width_100px">类别ID<i class="star">*</i></td>
	 			<td><input type="text" class="txt width_100px" name="parentSku"/></td>
	 		</tr>
	 		<tr>
	 			<td class="title width_100px">产品图片<i class="star">*</i></td>
	 			<td>
	 				<div class="image_box">
	 					<div class="image_title">SKU1 选择图片</div>
	 					<div class="image_count_info">
	 					<table class="image_info_table">
	 						<tr>
	 							<td style="text-align:left;width:70%">
	 								<input type="text" class="txt" style="width:400px;" id="imageUrlAddress" placeholder="图片地址/Url"/>
	 								<button class="btn btn-sm " type="button" onclick="addImageUrlAddress()">
	 									添加图片地址
	 								</button>
	 								<!--<a class="btn" onclick="clearImageUrlAddress();">清空</a>-->
	 							</td>
	 							<td style="text-align:right;">已选择图片：<span id="selectImageCount">0</span> 张 | 最多 4 张图片</div></td>
	 						</tr>
	 					</table>
	 					<div id="image_area">
	 						<ul id="sortable">
	 							<li>
									<div class="iamge_div">
									<img onclick="changeCheckStatus(this)" name="productImage" src="https://www.guphotos.com/images/H/H4640/H4640-1-d082.jpg" data-image="https://www.guphotos.com/images/H/H4640/H4640-1-d082.jpg" class="img-thumbnail-selected move" title="拖动改变图片顺序" width="110">
										<table class="width_100 image_operating_table">
											<tr>
												<td>
													<button class="btn btn-sm" type="button" onclick="changeCheckStatus(this)"><i class="icon icon-checked"></i></button>
												</td>
												<td>
													<button class="btn btn-sm " type="button" onclick="{deleteImage}"><i class="icon icon-trash"></i></button>
												</td>
											</tr>
										</table>
									</div>
								</li>
								<li>
									<div class="iamge_div">
									<img onclick="changeCheckStatus(this)" name="productImage" src="https://www.guphotos.com/images/S/S280/S280-2-0853.JPG" data-image="https://www.guphotos.com/images/S/S280/S280-2-0853.JPG" class="img-thumbnail move" title="拖动改变图片顺序" width="110">
										<table class="width_100 image_operating_table">
											<tr>
												<td>
													<button class="btn btn-sm" type="button" onclick="changeCheckStatus(this)"><i class="icon icon-check-empty"></i></button>
												</td>
												<td>
													<button class="btn btn-sm" type="button" onclick="{deleteImage}"><i class="icon icon-trash"></i></button>
												</td>
											</tr>
										</table>
									</div>
								</li>
	 						</ul>
	 					</div>
	 				</div>
	 			</td>
	 		</tr>
	 		<tr>
	 			<td class="title width_100px">产品名称<i class="star">*</i></td>
	 			<td><input type="text" class="txt width_100px" name="parentSku"/></td>
	 		</tr>
	 		<tr>
	 			<td class="title width_100px">价格<i class="star">*</i></td>
	 			<td><input type="text" class="txt width_100px" name="parentSku"/></td>
	 		</tr>
	 		<tr>
	 			<td class="title width_100px">库存<i class="star">*</i></td>
	 			<td><input type="text" class="txt width_100px" name="parentSku"/></td>
	 		</tr>
	 		<tr>
	 			<td class="title width_100px">产品重量<i class="star">*</i></td>
	 			<td><input type="text" class="txt width_100px" name="parentSku"/></td>
	 		</tr>
	 		<tr>
	 			<td class="title width_100px">送达时间<i class="star">*</i></td>
	 			<td><input type="text" class="txt width_100px" name="parentSku"/></td>
	 		</tr>
	 		<tr>
	 			<td class="title width_100px">产品描述<i class="star">*</i></td>
	 			<td><input type="text" class="txt width_100px" name="parentSku"/></td>
	 		</tr>
 		</table>
	</div>
  
  </body>
</html>
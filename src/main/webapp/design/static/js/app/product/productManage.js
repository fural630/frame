$(function () {
	initDialog();
	$( "#tabs" ).tabs();
	CKEDITOR.replace('descriptionCn');
	CKEDITOR.replace('descriptionEn');
	CKEDITOR.replace('descriptionFr');
	CKEDITOR.replace('descriptionDe');
	CKEDITOR.replace('descriptionJp');
	CKEDITOR.replace('descriptionEs');
	CKEDITOR.replace('descriptionIt');
	
	CKEDITOR.replace('briefDescriptionCn');
	CKEDITOR.replace('briefDescriptionEn');
	CKEDITOR.replace('briefDescriptionFr');
	CKEDITOR.replace('briefDescriptionDe');
	CKEDITOR.replace('briefDescriptionJp');
	CKEDITOR.replace('briefDescriptionEs');
	CKEDITOR.replace('briefDescriptionIt');
	
	$('#skuSelect').chosen({
	    disable_search_threshold: 5, // 5 个以下的选择项则不显示检索框
	    search_contains: true,         // 从任意位置开始检索
	    allow_single_deselect : true
	});
	initSortable();
});

function initSortable() {
	$("#sortable").sortable();
} 

function initDialog () {
	$("#productDialog").dialog({
		autoOpen: false,
		modal: true,
		width: 800,
		height: 600,
		resizable: false,
		buttons : [ {
				text : "保存",
				icons : {
					primary : "ui-icon-heart"
				},
				click : function() {
					if (validateProduct()) {
						alert("save");
					}
				}
			}
		],
		close: function( event, ui ) {
			$.myformPlugins.cleanForm("#productDialog");
		}
	});
	
	$("#uploadProductDialog").dialog({
		autoOpen: false,
		modal: true,
		width: 600,
		height: 400,
		resizable: false,
		buttons : [ {
				text : "上传",
				icons : {
					primary : "ui-icon-heart"
				},
				click : function() {
				}
			}
		],
		close: function( event, ui ) {
		}
	});
	
	$("#auditProductDialog").dialog({
		autoOpen: false,
		modal: true,
		width: 800,
		height: 600,
		resizable: false,
		buttons : [ {
				text : "通过",
				icons : {
					primary : "ui-icon-heart"
				},
				click : function() { 
				}
			},{
				text : "保存审批语",
				icons : {
					primary : "ui-icon-heart"
				},
				click : function() {
				}
			},{
				text : "申请审核",
				icons : {
					primary : "ui-icon-heart"
				},
				click : function() {
				}
			}
		],
		close: function( event, ui ) {
		}
	});
	
	$("#distributionEditUserDialog").dialog({
		autoOpen: false,
		modal: true,
		width: 450,
		height: 420,
		resizable: false,
		buttons : [ {
				text : "保存",
				icons : {
					primary : "ui-icon-heart"
				},
				click : function() { 
				}
			}
		],
		close: function( event, ui ) {
		}
	});
	
	$("#distributionPublishUserDialog").dialog({
		autoOpen: false,
		modal: true,
		width: 800,
		height: 600,
		resizable: false,
		buttons : [ {
				text : "保存",
				icons : {
					primary : "ui-icon-heart"
				},
				click : function() { 
				}
			}
		],
		close: function( event, ui ) {
		}
	});
	
}

function validateProduct() {
	var errorMassage = "";
	var dialog = $("#productDialog");
	var sku = $.trim(dialog.find("input[name='sku']").val());
	if (sku == "") {
		errorMassage += "&nbsp;*&nbsp;请选择填写SKU";
	}
	
	var spu = $.trim(dialog.find("input[name='spu']").val());
	if (spu == "") {
		errorMassage += "&nbsp;*&nbsp;请选择填写SPU";
	}
	
	if (errorMassage != "") {
		dialog.find(".validateTip").html(errorMassage).show();
		return false;
	} else {
		dialog.find(".validateTip").hide();
	}
	return true; 
}

function showProductDialog(title) {
	$("#productDialog").dialog("option", "title", title);
	$("#productDialog").dialog("open");
}

function showUploadProductDialog(title) {
	$("#uploadProductDialog").dialog("option", "title", title);
	$("#uploadProductDialog").dialog("open");
}

function showProductAuditDialog(title) {
	$("#auditProductDialog").dialog("option", "title", title);
	$("#auditProductDialog").dialog("open");
}

function showDistributionEditUserDialog(title) {
	$("#distributionEditUserDialog").dialog("option", "title", title);
	$("#distributionEditUserDialog").dialog("open");
	$('#editUserSelect').chosen({
	    disable_search_threshold: 5, // 5 个以下的选择项则不显示检索框
	    search_contains: true         // 从任意位置开始检索
	});
}

function reviewAudit(id) {
	showProductAuditDialog("审核进度");
}

function addImageUrlAddress () {
	var imageUrlAddress = $.trim($("#imageUrlAddress").val());
	if (imageUrlAddress == "") {
		var param = {
			status : 0,
			message : "请填写图片地址"
		};
		$.message.showMessage(param);
		return;
	} 
	createSelectImageHtml(imageUrlAddress);
}

function createSelectImageHtml(url) {
	var imageHtml = "";
	imageHtml += '<li>';
	imageHtml += 	'<div class="iamge_div">';
	imageHtml += 		'<img name="productImage" src="{url}" data-image="{url}" class="img-thumbnail move" title="拖动改变图片顺序" width="110">';
	imageHtml += 		'<table class="width_100 image_operating_table">';
	imageHtml += 			'<tr>';
	imageHtml += 				'<td>';
	imageHtml += 					'<a href="{url}" data-toggle="lightbox" class="btn btn-sm"><i class="icon icon-zoom-in"></i></a>';
	imageHtml += 				'</td>';
	imageHtml += 				'<td>';
	imageHtml += 					'<button class="btn btn-sm " type="button"><i class="icon icon-trash"></i></button>';
	imageHtml += 				'</td>';
	imageHtml += 			'</tr>';
	imageHtml += 		'</table>';
	imageHtml += 	'</div>';
	imageHtml += '</li>';
	imageHtml = imageHtml.replace(/{url}/g, url);
	$("#sortable").append(imageHtml);
	clearImageUrlAddress();
	initSortable();
	$('[data-toggle="lightbox"]').lightbox();
}

function clearImageUrlAddress() {
	$("#imageUrlAddress").val("");
}
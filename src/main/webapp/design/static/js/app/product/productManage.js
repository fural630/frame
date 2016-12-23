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
	
	$('#userSelect').chosen({
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
						saveProduct();
					}
				}
			}
		],
		close: function( event, ui ) {
			cleanProductDialog();
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
		autoOpen: true,
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

function saveProduct() {
	var dialog = $("#productDialog");
	
	var id = $.trim(dialog.find("input[name=id]").val());
	
	var sku = $.trim(dialog.find("input[name=sku]").val());
	var spu = $.trim(dialog.find("input[name=spu]").val());
	
	var nameCn = $.trim(dialog.find("input[name=nameCn]").val());
	var nameEn = $.trim(dialog.find("input[name=nameEn]").val());
	var nameFr = $.trim(dialog.find("input[name=nameFr]").val());
	var nameDe = $.trim(dialog.find("input[name=nameDe]").val());
	var nameIt = $.trim(dialog.find("input[name=nameIt]").val());
	var nameJp = $.trim(dialog.find("input[name=nameJp]").val());
	var nameEs = $.trim(dialog.find("input[name=nameEs]").val());
	
	var declarationNameCn = $.trim(dialog.find("input[name=declarationNameCn]").val());
	var declarationNameEn = $.trim(dialog.find("input[name=declarationNameEn]").val());
	
	var purchasePrice = $.trim(dialog.find("input[name=purchasePrice]").val());
	var purchaseUrl = $.trim(dialog.find("input[name=purchaseUrl]").val());
	var purchaseNotes = $.trim(dialog.find("textarea[name=purchaseNotes]").val());
	var salesNotes = $.trim(dialog.find("textarea[name=salesNotes]").val());
	
	var packageWeight = $.trim(dialog.find("input[name=packageWeight]").val());
	var packageWidth = $.trim(dialog.find("input[name=packageWidth]").val());
	var packageHeight = $.trim(dialog.find("input[name=packageHeight]").val());
	var packageLength = $.trim(dialog.find("input[name=packageLength]").val());
	
	var descriptionCn = CKEDITOR.instances["descriptionCn"].getData();
	var descriptionEn = CKEDITOR.instances["descriptionEn"].getData();
	var descriptionFr = CKEDITOR.instances["descriptionFr"].getData();
	var descriptionDe = CKEDITOR.instances["descriptionDe"].getData();
	var descriptionJp = CKEDITOR.instances["descriptionJp"].getData();
	var descriptionEs = CKEDITOR.instances["descriptionEs"].getData();
	var descriptionIt = CKEDITOR.instances["descriptionIt"].getData();
	var briefDescriptionCn = CKEDITOR.instances["briefDescriptionCn"].getData();
	var briefDescriptionEn = CKEDITOR.instances["briefDescriptionEn"].getData();
	var briefDescriptionFr = CKEDITOR.instances["briefDescriptionFr"].getData();
	var briefDescriptionDe = CKEDITOR.instances["briefDescriptionDe"].getData();
	var briefDescriptionJp = CKEDITOR.instances["briefDescriptionJp"].getData();
	var briefDescriptionEs = CKEDITOR.instances["briefDescriptionEs"].getData();
	var briefDescriptionIt = CKEDITOR.instances["briefDescriptionIt"].getData();
	
	var imageElements = dialog.find("img[name=productImage]");
	var productImageList = [];
	imageElements.each(function(e) {
		var imageUrl = $(this).attr("src");
		if (imageUrl != "") {
			productImageList.push(imageUrl);
		}
	});
	
	$.ajax({
		url : "/product/saveProduct",
		type: 'POST',
		dataType : "json",
		data : {
			id : id,
			sku : sku,
			spu : spu,
			nameCn : nameCn,
			nameEn : nameEn,
			nameFr : nameFr,
			nameDe : nameDe,
			nameIt : nameIt,
			nameJp : nameJp,
			nameEs : nameEs,
			declarationNameCn : declarationNameCn,
			declarationNameEn : declarationNameEn,
			purchasePrice : purchasePrice,
			purchaseUrl : purchaseUrl,
			purchaseNotes : purchaseNotes,
			salesNotes : salesNotes,
			packageWeight : packageWeight,
			packageWidth : packageWidth,
			packageHeight : packageHeight,
			packageLength : packageLength,
			descriptionCn : descriptionCn,
			descriptionEn : descriptionEn,
			descriptionFr : descriptionFr,
			descriptionDe : descriptionDe,
			descriptionJp : descriptionJp,
			descriptionEs : descriptionEs,
			descriptionIt : descriptionIt,
			briefDescriptionCn : briefDescriptionCn,
			briefDescriptionEn : briefDescriptionEn,
			briefDescriptionFr : briefDescriptionFr,
			briefDescriptionDe : briefDescriptionDe,
			briefDescriptionJp : briefDescriptionJp,
			briefDescriptionEs : briefDescriptionEs,
			briefDescriptionIt : briefDescriptionIt,
			productImageList : productImageList
		},
		success : function (data) {
			$.message.showMessage(data);
			if (data.status == 1) {
				dialog.dialog("close");
				refresh(1000);
			}
		}
	});
}

function cleanProductDialog() {
	$.myformPlugins.cleanForm("#productDialog");
	$("#sortable").html("");
	CKEDITOR.instances["descriptionCn"].setData("");
	CKEDITOR.instances["descriptionEn"].setData("");
	CKEDITOR.instances["descriptionFr"].setData("");
	CKEDITOR.instances["descriptionDe"].setData("");
	CKEDITOR.instances["descriptionJp"].setData("");
	CKEDITOR.instances["descriptionEs"].setData("");
	CKEDITOR.instances["descriptionIt"].setData("");
	CKEDITOR.instances["briefDescriptionCn"].setData("");
	CKEDITOR.instances["briefDescriptionEn"].setData("");
	CKEDITOR.instances["briefDescriptionFr"].setData("");
	CKEDITOR.instances["briefDescriptionCn"].setData("");
	CKEDITOR.instances["briefDescriptionDe"].setData("");
	CKEDITOR.instances["briefDescriptionJp"].setData("");
	CKEDITOR.instances["briefDescriptionEs"].setData("");
	CKEDITOR.instances["briefDescriptionIt"].setData("");
}

function editProduct(id) {
	var dialog = $("#productDialog");
	$.ajax({
		url : "/product/editProduct",
		type: 'POST',
		dataType : "json",
		data : {
			id : id,
		},
		success : function (data) {
			var product = data.product;
			var imageList = data.imageList;
			fillingProductData(product, imageList);
		}
	});
	
}

function fillingProductData(product, imageList) {
	var dialog = $("#productDialog");
	dialog.find("input[name=id]").val(product.id);
	dialog.find("input[name=sku]").val(product.sku);
	dialog.find("input[name=spu]").val(product.spu);
	dialog.find("input[name=nameCn]").val(product.nameCn);
	dialog.find("input[name=nameEn]").val(product.nameEn);
	dialog.find("input[name=nameFr]").val(product.nameFr);
	dialog.find("input[name=nameDe]").val(product.nameDe);
	dialog.find("input[name=nameIt]").val(product.nameIt);
	dialog.find("input[name=nameJp]").val(product.nameJp);
	dialog.find("input[name=nameEs]").val(product.nameEs);
	dialog.find("input[name=declarationNameCn]").val(product.declarationNameCn);
	dialog.find("input[name=declarationNameEn]").val(product.declarationNameEn);
	
	dialog.find("input[name=purchasePrice]").val(product.purchasePrice);
	dialog.find("input[name=purchaseUrl]").val(product.purchaseUrl);
	dialog.find("textarea[name=purchaseNotes]").val(product.purchaseNotes);
	dialog.find("textarea[name=salesNotes]").val(product.salesNotes);
	
	dialog.find("input[name=packageWeight]").val(product.packageWeight);
	dialog.find("input[name=packageWidth]").val(product.packageWidth);
	dialog.find("input[name=packageHeight]").val(product.packageHeight);
	dialog.find("input[name=packageLength]").val(product.packageLength);
	
	CKEDITOR.instances["descriptionCn"].setData(product.descriptionCn);
	CKEDITOR.instances["descriptionEn"].setData(product.descriptionEn);
	CKEDITOR.instances["descriptionFr"].setData(product.descriptionFr);
	CKEDITOR.instances["descriptionDe"].setData(product.descriptionDe);
	CKEDITOR.instances["descriptionJp"].setData(product.descriptionJp);
	CKEDITOR.instances["descriptionEs"].setData(product.descriptionEs);
	CKEDITOR.instances["descriptionIt"].setData(product.descriptionIt);
	CKEDITOR.instances["briefDescriptionCn"].setData(product.briefDescriptionCn);
	CKEDITOR.instances["briefDescriptionEn"].setData(product.briefDescriptionEn);
	CKEDITOR.instances["briefDescriptionFr"].setData(product.briefDescriptionFr);
	CKEDITOR.instances["briefDescriptionDe"].setData(product.briefDescriptionDe);
	CKEDITOR.instances["briefDescriptionJp"].setData(product.briefDescriptionJp);
	CKEDITOR.instances["briefDescriptionEs"].setData(product.briefDescriptionEs);
	CKEDITOR.instances["briefDescriptionIt"].setData(product.briefDescriptionIt);
	
	$("#sortable").html("");
	if (imageList != undefined && imageList.length > 0) {
		for (var i = 0; i < imageList.length; i++) {
			createSelectImageHtml(imageList[i]);
		}
	}
	showProductDialog("编辑商品");
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
	$("#auditProductComment").scrollTop($("#auditProductComment")[0].scrollHeight);		//设置滚动条最底端
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
	imageHtml += 					'<button class="btn btn-sm " type="button" onclick="{deleteImage}"><i class="icon icon-trash"></i></button>';
	imageHtml += 				'</td>';
	imageHtml += 			'</tr>';
	imageHtml += 		'</table>';
	imageHtml += 	'</div>';
	imageHtml += '</li>';
	imageHtml = imageHtml.replace(/{deleteImage}/g, "deleteImage('{url}')");
	imageHtml = imageHtml.replace(/{url}/g, url);
	$("#sortable").append(imageHtml);
	clearImageUrlAddress();
	initSortable();
	$('[data-toggle="lightbox"]').lightbox();
}

function deleteImage(imageUrl) {
	$("#productDialog").find("img[src='"+imageUrl+"']").each(function () {
		var li = $(this).closest("li");
		li.remove();
	});
}

function clearImageUrlAddress() {
	$("#imageUrlAddress").val("");
}

function deleteProduct(id) {
	$.ajax({
		url : "/product/deleteProductById",
		type: 'POST',
		dataType : "json",
		data : {
			id : id
		},
		success : function (data) {
			$.message.showMessage(data);
			if (data.status == 1){
				refresh(1000);
			}
		}
	});
}
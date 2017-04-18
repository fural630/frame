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
	
//	CKEDITOR.replace('briefDescriptionCn');
//	CKEDITOR.replace('briefDescriptionEn');
//	CKEDITOR.replace('briefDescriptionFr');
//	CKEDITOR.replace('briefDescriptionDe');
//	CKEDITOR.replace('briefDescriptionJp');
//	CKEDITOR.replace('briefDescriptionEs');
//	CKEDITOR.replace('briefDescriptionIt');
	
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
					validateProductFrom();
				}
			},{
				text : "关闭",
				icons : {
					primary : "ui-icon-heart"
				},
				click : function() {
					$("#uploadProductDialog").dialog("close");
					refresh(1000);
				}
			}
			
		],
		close: function( event, ui ) {
			$.myformPlugins.cleanForm("#uploadProductDialog");
		}
	});
	
	$("#auditProductDialog").dialog({
		autoOpen: false,
		modal: true,
		width: 800,
		height: 600,
		resizable: false,
		close: function( event, ui ) {
		}
	});
	
	$("#distributionEditUserDialog").dialog({
		autoOpen: false,
		modal: true,
		width: 550,
		height: 520,
		resizable: false,
		buttons : [ {
				text : "保存",
				icons : {
					primary : "ui-icon-heart"
				},
				click : function() { 
					saveProductEditUser();
				}
			},{
				text : "关闭",
				icons : {
					primary : "ui-icon-heart"
				},
				click : function() { 
					$(this).dialog("close");
				}
			}
		],
		close: function( event, ui ) {
			refresh();
		}
	});
	
	$("#distributionPublishUserDialog").dialog({
		autoOpen: false,
		modal: true,
		width: 550,
		height: 520,
		resizable: false,
		buttons : [ {
				text : "保存",
				icons : {
					primary : "ui-icon-heart"
				},
				click : function() { 
					saveProductPublishUser();
				}
			},{
				text : "关闭",
				icons : {
					primary : "ui-icon-heart"
				},
				click : function() { 
					$(this).dialog("close");
				}
			}
		],
		close: function( event, ui ) {
			refresh();
		}
	});
	
}

function validateProductFrom() {
	var dialog = $("#uploadProductDialog");
	var file = dialog.find("input[name=productFile]").val();
	if (file == "" || file == null || file == undefined) {
		var param = {
			status : 0,
			message : "请选择要上传的文件"
		};
		$.message.showMessage(param);
		return;
	}
	$.blockUI({
		message: '<img src="/design/static/images/common/progressbar10.gif">',
		timeout: 5000,
		css:{
			backgroundColor: "",
			border:"0"
		}
	});
	dialog.find("form[name=uploadProductFrom]").submit();
}

function saveProductEditUser() {
	var dialog = $("#distributionEditUserDialog");
	var userId = dialog.find("select[name='editUserSelect']").val();
	if (null == userId || "" == userId) {
		var param = {
				status : 0,
				message : "请选择分配人员"
			};
		$.message.showMessage(param);
		return;
	}
	
	var spus = getTreeSpuList("editorUserTree");
	
	if (spus.length == 0) {
		var param = {status : 0,message : "请勾选要分配的SKU或SPU"};
		$.message.showMessage(param);
	}
	
	var spuList = spus.join();
	
	$.ajax({
		url : "/product/saveProductEditUser",
		type: 'POST',
		dataType : "json",
		data : {
			userId : userId,
			spuList : spuList
		},
		success : function (data) {
			$.message.showMessage(data);
		}
	});
	
}

function saveProductPublishUser() {
	var dialog = $("#distributionPublishUserDialog");
	var userId = dialog.find("select[name='publishUserSelect']").val();
	if (null == userId || "" == userId) {
		var param = {
				status : 0,
				message : "请选择分配人员"
			};
		$.message.showMessage(param);
		return;
	}
	
	var spus = getTreeSpuList("publishUserTree");
	
	if (spus.length == 0) {
		var param = {status : 0,message : "请勾选要分配的SKU或SPU"};
		$.message.showMessage(param);
	}
	
	var spuList = spus.join();
	
	$.ajax({
		url : "/product/saveProductPublishUser",
		type: 'POST',
		dataType : "json",
		data : {
			userId : userId,
			spuList : spuList
		},
		success : function (data) {
			$.message.showMessage(data);
		}
	});
}

function validateProduct() {
	var errorMassage = "";
	var dialog = $("#productDialog");
	var sku = $.trim(dialog.find("input[name='sku']").val());
	if (sku == "") {
		errorMassage += "&nbsp;*&nbsp;请填写SKU";
	}
	
	var spu = $.trim(dialog.find("input[name='spu']").val());
	if (spu == "") {
		errorMassage += "&nbsp;*&nbsp;请填写SPU";
	}
	
	var nameCn = $.trim(dialog.find("input[name='nameCn']").val());
	if (nameCn == "") {
		errorMassage += "&nbsp;*&nbsp;请填写中文名称";
	}
	
	var nameEn = $.trim(dialog.find("input[name='nameEn']").val());
	if (nameEn == "") {
		errorMassage += "&nbsp;*&nbsp;请填写英文名称";
	}
	
	var declarationNameCn = $.trim(dialog.find("input[name='declarationNameCn']").val());
	if (declarationNameCn == "") {
		errorMassage += "&nbsp;*&nbsp;请填写中文报关名";
	}
	
	var declarationNameEn = $.trim(dialog.find("input[name='declarationNameEn']").val());
	if (declarationNameEn == "") {
		errorMassage += "&nbsp;*&nbsp;请填写英文报关名";
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
	
	var color = $.trim(dialog.find("input[name=color]").val());
	var size = $.trim(dialog.find("input[name=size]").val());
	
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
//	var briefDescriptionCn = CKEDITOR.instances["briefDescriptionCn"].getData();
//	var briefDescriptionEn = CKEDITOR.instances["briefDescriptionEn"].getData();
//	var briefDescriptionFr = CKEDITOR.instances["briefDescriptionFr"].getData();
//	var briefDescriptionDe = CKEDITOR.instances["briefDescriptionDe"].getData();
//	var briefDescriptionJp = CKEDITOR.instances["briefDescriptionJp"].getData();
//	var briefDescriptionEs = CKEDITOR.instances["briefDescriptionEs"].getData();
//	var briefDescriptionIt = CKEDITOR.instances["briefDescriptionIt"].getData();
	
	var imageElements = dialog.find("img[name=productImage]");
	var mainImage = "";
	var productImageList = [];
	imageElements.each(function() {
		var imageUrl = $(this).attr("src");
		if (imageUrl != "") {
			if (mainImage == "") {
				mainImage = imageUrl;
			}
			productImageList.push(imageUrl);
		}
	});
	
	var multiSkuTable = $("table[name=multiSkuTable]");
	var multiSkuList = [];
	var multiColorList = [];
	var multiSizeList = [];
	multiSkuTable.find("tr:gt(0)").each(function () {
		var multiSku = $(this).find("input[name=multiSku]").val();
		var multiColor = $(this).find("input[name=multiColor]").val();
		var multiSize = $(this).find("input[name=multiSize]").val();
		if ($.trim(multiSku) != "") {
			multiSkuList.push(multiSku);
			multiColorList.push(multiColor);
			multiSizeList.push(multiSize);
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
			color : color,
			size : size,
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
//			briefDescriptionCn : briefDescriptionCn,
//			briefDescriptionEn : briefDescriptionEn,
//			briefDescriptionFr : briefDescriptionFr,
//			briefDescriptionDe : briefDescriptionDe,
//			briefDescriptionJp : briefDescriptionJp,
//			briefDescriptionEs : briefDescriptionEs,
//			briefDescriptionIt : briefDescriptionIt,
			productImageList : productImageList,
			mainImage : mainImage,
			multiSkuList : multiSkuList,
			multiColorList : multiColorList,
			multiSizeList : multiSizeList
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
//	CKEDITOR.instances["briefDescriptionCn"].setData("");
//	CKEDITOR.instances["briefDescriptionEn"].setData("");
//	CKEDITOR.instances["briefDescriptionFr"].setData("");
//	CKEDITOR.instances["briefDescriptionCn"].setData("");
//	CKEDITOR.instances["briefDescriptionDe"].setData("");
//	CKEDITOR.instances["briefDescriptionJp"].setData("");
//	CKEDITOR.instances["briefDescriptionEs"].setData("");
//	CKEDITOR.instances["briefDescriptionIt"].setData("");
	
	var multiTable = $("#productDialog").find("table[name=multiSkuTable]");
	multiTable.find("tr:gt(1)").each(function () {
		$(this).remove();
	});
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
	dialog.find("input[name=color]").val(product.color);
	dialog.find("input[name=size]").val(product.size);
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
//	CKEDITOR.instances["briefDescriptionCn"].setData(product.briefDescriptionCn);
//	CKEDITOR.instances["briefDescriptionEn"].setData(product.briefDescriptionEn);
//	CKEDITOR.instances["briefDescriptionFr"].setData(product.briefDescriptionFr);
//	CKEDITOR.instances["briefDescriptionDe"].setData(product.briefDescriptionDe);
//	CKEDITOR.instances["briefDescriptionJp"].setData(product.briefDescriptionJp);
//	CKEDITOR.instances["briefDescriptionEs"].setData(product.briefDescriptionEs);
//	CKEDITOR.instances["briefDescriptionIt"].setData(product.briefDescriptionIt);
	
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
	if ($("#productDialog").find("input[name=id]").val() != "") {
		$("#multiSkuArea").hide();
	} else {
		$("#multiSkuArea").show();
	}
	
	var roleLevel = getUserRoleLevel();
	roleLevel = Number(roleLevel);
	if(roleLevel >=10) {
		$("#productDialog").dialog("option", "buttons", [{
			text : "保存",
			icons : {
				primary : "ui-icon-heart"
			},
			click : function() {
				if (validateProduct()) {
					saveProduct();
				}
			}
		}]);
	} else {
		$("#productDialog").dialog("option", "buttons", [{
			text : "保存",
			icons : {
				primary : "ui-icon-heart"
			},
			click : function() {
				if (validateProduct()) {
					saveProduct();
				}
			}
		}, {
			text : "完成编辑",
			icons : {
				primary : "ui-icon-heart"
			},
			click : function() {
				if (validateProduct()) {
					finishEdit();
				}
			}
		}]);
	}
	$("#productDialog").dialog("open");
}

function finishEdit() {
	var dialog = $("#productDialog");
	var id = dialog.find("input[name=id]").val();
	$.ajax({
		url : "/product/finishEdit",
		type: 'POST',
		dataType : "json",
		data : {
			productId : id
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

function showUploadProductDialog(title) {
	$("#uploadProductDialog").dialog("option", "title", title);
	$("#uploadProductDialog").dialog("open");
}

function showProductAuditDialog(title) {
	var roleLevel = getUserRoleLevel();
	roleLevel = Number(roleLevel);
	if(roleLevel >=10) {
		$("#auditProductDialog").dialog("option", "buttons", [ {
			text : "通过",
			icons : {
				primary : "ui-icon-heart"
			},
			click : function() {
				passProductAudit();
			}
		}, {
			text : "打回待编辑",
			icons : {
				primary : "ui-icon-heart"
			},
			click : function() {
				pendingReExamination();
			}
		}, {
			text : "关闭刷新",
			icons : {
				primary : "ui-icon-heart"
			},
			click : function() {
				$(this).dialog("close");
				refresh(1000);
			}
		}]);
	} else {
		$("#auditProductDialog").dialog("option", "buttons", [ {
			text : "申请审核",
			icons : {
				primary : "ui-icon-heart"
			},
			click : function() {
				submitReview();
			}
		}, {
			text : "关闭刷新",
			icons : {
				primary : "ui-icon-heart"
			},
			click : function() {
				$(this).dialog("close");
				refresh(1000);
			}
		}]);
	}
	$("#auditProductDialog").dialog("option", "title", title);
	$("#auditProductDialog").dialog("open");
	$("#auditProductComment").scrollTop($("#auditProductComment")[0].scrollHeight);		// 设置滚动条最底端
}

function showDistributionEditUserDialog(title) {
	$("#editorSelectCount").text("0");
	$("#distributionEditUserDialog").dialog("option", "title", title);
	$("#distributionEditUserDialog").dialog("open");
// $("#distributionEditUserDialog").find("select[name='editUserSelect']").chosen({
//	    disable_search_threshold: 5, // 5 个以下的选择项则不显示检索框
//	    search_contains: true         // 从任意位置开始检索
//	});
}

function showDistributionPublishUserDialog (title) {
	$("#publishUserSelectCount").text("0");
	$("#distributionPublishUserDialog").dialog("option", "title", title);
	$("#distributionPublishUserDialog").dialog("open");
}

function submitReview() {
	var dialog = $("#auditProductDialog");
	var productId = dialog.find("input[name=id]").val();
	var auditMessage = dialog.find("textarea[name=auditMessage]").val();
	if ("" == auditMessage) {
		auditMessage = "请审核";
	}
	$.ajax({
		url : "/product/submitReview",
		type: 'POST',
		dataType : "json",
		data : {
			productId : productId,
			auditMessage : auditMessage
		},
		success : function (data) {
			$.message.showMessage(data);
			if (data.status == 1) {
				var productAuditList = data.data;
				dialog.find("textarea[name=auditMessage]").val("");
				createProductAuditList(productAuditList);
			}
		}
	});
}

function pendingReExamination() {
	if(validateAuditMessage()) {
		var dialog = $("#auditProductDialog");
		var productId = dialog.find("input[name=id]").val();
		var auditMessage = dialog.find("textarea[name=auditMessage]").val();
		$.ajax({
			url : "/product/pendingReExamination",
			type: 'POST',
			dataType : "json",
			data : {
				productId : productId,
				auditMessage : auditMessage
			},
			success : function (data) {
				$.message.showMessage(data);
				if (data.status == 1) {
					var productAuditList = data.data;
					dialog.find("textarea[name=auditMessage]").val("");
					createProductAuditList(productAuditList);
				}
			}
		});
	}
}

function passProductAudit() {
	var dialog = $("#auditProductDialog");
	var productId = dialog.find("input[name=id]").val();
	
	var auditStatus = getProductAuditStatus(productId);
	
	var auditMessage = "通过";
	$.ajax({
		url : "/product/passProductAudit",
		type: 'POST',
		dataType : "json",
		data : {
			productId : productId,
			auditMessage : auditMessage
		},
		success : function (data) {
			$.message.showMessage(data);
			if (data.status == 1) {
				var productAuditList = data.data;
				dialog.find("textarea[name=auditMessage]").val("");
				createProductAuditList(productAuditList);
			}
		}
	});
}

function validateAuditMessage() {
	var dialog = $("#auditProductDialog");
	var productId = dialog.find("inputp[name=id]").val();
//	var auditStatus = getProductAuditStatus(productId);
//	auditStatus = Number(auditStatus);
	var auditMessage = dialog.find("textarea[name=auditMessage]").val();
	if ($.trim(auditMessage) == "") {
		var param = {
			status : 0,
			message : "请填写留言"
		};
		$.message.showMessage(param);
		return false;
	}
	return true;
}

function getProductAuditStatus(productId) {
	var auditStatus = "";
	$.ajax({
		url : "/product/getProductAuditStatus",
		type: 'POST',
		dataType : "json",
		async: false,
		data : {
			productId : productId,
		},
		success : function (data) {
			auditStatus = data;
		}
	});
	return auditStatus;
}

function reviewAudit(productId) {
	var dialog = $("#auditProductDialog");
	$.ajax({
		url : "/product/getProductAuditList",
		type: 'POST',
		dataType : "json",
		data : {
			productId : productId,
		},
		success : function (data) {
			var productAuditList = data;
			createProductAuditList(productAuditList);
			dialog.find("input[name=id]").val(productId);
			showProductAuditDialog("审核进度");
		}
	});
}

function updateAuditContent(productId) {
	var dialog = $("#auditProductDialog");
	$.ajax({
		url : "/product/getProductAuditList",
		type: 'POST',
		dataType : "json",
		data : {
			productId : productId,
		},
		success : function (data) {
			var productAuditList = data;
			createProductAuditList(productAuditList);
		}
	});
}

function createProductAuditList(productAuditList) {
	var auditList = "";
	auditList += '<div class="comment">';
	auditList += 	'<a href="javascript:;" class="avatar">';
	auditList += 		'<i class="icon-user icon-2x"></i>';
	auditList += 	'</a>';
	auditList += 	'<div class="content">';
	auditList += 		'<div class="pull-right text-muted">{createTime}</div>';
	auditList += 		'<div><strong>{userName}</strong></div>';
	auditList += 		'<div class="text">{comment}</div>';
	auditList += 	'</div>';
	auditList += '</div>';
	
	var auditHtml = "";
	for(var i = 0; i < productAuditList.length; i++) {
		var productAudit = productAuditList[i];
		auditHtml += auditList.replace(/{createTime}/g, productAudit.createTime)
				.replace(/{userName}/g, productAudit.userName)
				.replace(/{comment}/g, productAudit.comment);
	}
	$("#auditProductDialog").find("section").html(auditHtml);
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

function distributionEditUser(productId) {
	var dialog = $("#distributionEditUserDialog");
	$.ajax({
		url : "/product/getProductEditUser",
		type: 'POST',
		dataType : "json",
		data : {
			productId : productId
		},
		success : function (data) {
			var userId = data;
			if (userId != null) {
				dialog.find("select[name='editUserSelect']").val(userId);
			} else {
				dialog.find("select[name='editUserSelect']").val("");
			}
			dialog.find("input[name=id]").val(productId);
			showDistributionEditUserDialog("分配编辑人员");
		}
	});
}

function distributionPublishUser(productId) {
	var dialog = $("#distributionPublishUserDialog");
	$.ajax({
		url : "/product/getProductPublishUser",
		type: 'POST',
		dataType : "json",
		data : {
			productId : productId
		},
		success : function (data) {
			var userId = data;
			if (userId != null) {
				dialog.find("select[name='publishUserSelect']").val(userId);
			} else {
				dialog.find("select[name='publishUserSelect']").val("");
			}
			dialog.find("input[name=id]").val(productId);
			showDistributionPublishUserDialog("分配刊登人员");
		}
	});
}

function batchDistributeEditUser() {
	loadEditorUserTree();
	showDistributionEditUserDialog("批量分配编辑人员");
}

function batchDistributePublishUser(idList) {
	loadPublishUserTree();
	showDistributionPublishUserDialog("批量分配刊登人员");
}

function batchDeleteProduct(idList) {
	confirmMsg("deleteProductByIds('"+idList+"')");
}

function deleteProductByIds(idList) {
	$.ajax({
		url : "/product/deleteProductByIds",
		type: 'POST',
		dataType : "json",
		data : {
			idList : idList
		},
		success : function (data) {
			$.message.showMessage(data);
			if (data.status == 1){
				refresh(1000);
			}
		}
	});
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

function getUserRoleLevel() {
	var level = 0;
	$.ajax({
		url : "/system/getUserRoleLevel",
		type: 'POST',
		dataType : "json",
		async: false,
		success : function (data) {
			level = data;
		}
	});
	return level;
}

function aKeyTranslateName() {
	var productDialog = $("#productDialog");
	var sourceLanguage = productDialog.find("select[name=translateNameSelect]").val();
	var text = "";
	var message = "";
	var targetLanguages = "de,it,ja,es,fr";
	if (sourceLanguage == "zh-CN") {
		text = productDialog.find("input[name=nameCn]").val();
		message = "请先填写中文名称";
		targetLanguages += ",en";
	} else if (sourceLanguage == "en") {
		text = productDialog.find("input[name=nameEn]").val();
		message = "请先填写英文名称";
		targetLanguages += ",zh-CN";
	}
	if ($.trim(text) == "") {
		var param = {
			status : 0,
			message : message
		};
		$.message.showMessage(param);
		return;
	}
	
	$.ajax({
		url : "/translate/aKeyTranslateName",
		type: 'POST',
		dataType : "json",
		beforeSend : function (xhr) {
			$.blockUI({
				message: '<img src="/design/static/images/common/progressbar10.gif">',
				timeout: 1000 * 60,
				css:{
					backgroundColor: "",
					border:"0"
				}
			});
		},
		data : {
			targetLanguages : targetLanguages,
			sourceLanguage : sourceLanguage,
			text : text
		},
		success : function (data) {
			if (data.status == 1) {
				var translationMap = data.data;
				$.each(translationMap, function (key, value) {
					if (key == "zh-CN") {
						productDialog.find("input[name=nameCn]").val(value);
					}
					if (key == "en") {
						productDialog.find("input[name=nameEn]").val(value);
					}
					if (key == "fr") {
						productDialog.find("input[name=nameFr]").val(value);
					}
					if (key == "de") {
						productDialog.find("input[name=nameDe]").val(value);
					}
					if (key == "ja") {
						productDialog.find("input[name=nameJp]").val(value);
					}
					if (key == "es") {
						productDialog.find("input[name=nameEs]").val(value);
					}
					if (key == "it") {
						productDialog.find("input[name=nameIt]").val(value);
					}
				});
			}
			$.message.showMessage(data);
		}
	});
	
	
	
}

function translateName(targetLanguage, _this) {
	var productDialog = $("#productDialog");
	var text = productDialog.find("input[name=nameEn]").val();
	
	if ($.trim(text) == "") {
		var param = {
			status : 0,
			message : "请先填写英文名称"
		};
		$.message.showMessage(param);
		return;
	}
	
	var sourceLanguage = "en";
	$.ajax({
		url : "/translate/translateName",
		type: 'POST',
		dataType : "json",
		beforeSend : function (xhr) {
			$.blockUI({
				message: '<img src="/design/static/images/common/progressbar10.gif">',
				timeout: 1000 * 60,
				css:{
					backgroundColor: "",
					border:"0"
				}
			});
		},
		data : {
			targetLanguage : targetLanguage,
			sourceLanguage : sourceLanguage,
			text : text
		},
		success : function (data) {
			if (data.status == 1) {
				$(_this).prev().val(data.data);
			}
			$.message.showMessage(data);
		}
	});
}

function aKeyTranslationDescription() {
	var descriptionEn = CKEDITOR.instances["descriptionEn"].getData();
	if ($.trim(descriptionEn) == "") {
		var param = {
			status : 0,
			message : "请先填写英文描述"
		};
		$.message.showMessage(param);
		return;
	}
	var targetLanguages = "de,it,ja,es,fr";
	$.ajax({
		url : "/translate/aKeyTranslationDescription",
		type: 'POST',
		dataType : "json",
		beforeSend : function (xhr) {
			$.blockUI({
				message: '<img src="/design/static/images/common/progressbar10.gif">',
				timeout: 20000,
				css:{
					backgroundColor: "",
					border:"0"
				}
			});
		},
		data : {
			targetLanguages : targetLanguages,
			text : descriptionEn
		},
		success : function (data) {
			if (data.status == 1) {
				var translationMap = data.data;
				$.each(translationMap, function (key, value) {
					if (key == "zh-CN") {
						CKEDITOR.instances["descriptionCn"].setData(value);
					}
					if (key == "en") {
						CKEDITOR.instances["descriptionEn"].setData(value);
					}
					if (key == "fr") {
						CKEDITOR.instances["descriptionFr"].setData(value);
					}
					if (key == "de") {
						CKEDITOR.instances["descriptionDe"].setData(value);
					}
					if (key == "ja") {
						CKEDITOR.instances["descriptionJp"].setData(value);
					}
					if (key == "es") {
						CKEDITOR.instances["descriptionEs"].setData(value);
					}
					if (key == "it") {
						CKEDITOR.instances["descriptionIt"].setData(value);
					}
				});
			}
			$.message.showMessage(data);
		}
	});
}

function addSkuRow() {
	var dialog = $("#productDialog");
	var multiTable = dialog.find("table[name=multiSkuTable]");
	var skuRow = '';
	skuRow += '<tr>';
	skuRow += 	'<td class="title">SKU</td>';
	skuRow += 	'<td><input type="text" class="txt width_90" name="multiSku"/></td>';
	skuRow += 	'<td class="title">颜色</td>';
	skuRow += 	'<td><input type="text" class="txt width_90" name="multiColor"/></td>';
	skuRow += 	'<td class="title">尺寸</td>';
	skuRow += 	'<td><input type="text" class="txt width_90" name="multiSize"/></td>';
	skuRow += 	'<td><button class="btn btn-sm btn-danger" type="button" onclick="removeMultiSkuRow(this)"><i class="icon icon-trash"></i></button></td>';
	skuRow += '</tr>';
	multiTable.append(skuRow);
}

function removeMultiSkuRow(obj) {
	$(obj).parent().parent().remove();
}

function aKeyCreateSku() {
	var dialog = $("#productDialog");
	var spu = dialog.find("input[name=spu]").val();
	if ($.trim(spu) == "") {
		var param = {
			status : 0,
			message : "请先填写SPU"
		};
		$.message.showMessage(param);
		return;
	}
	var multiTable = dialog.find("table[name=multiSkuTable]");
	var flag = false;
	multiTable.find("tr:gt(0)").each(function () {
		var sku = spu;
		var multiColor = $(this).find("input[name=multiColor]").val();
		var multiSize = $(this).find("input[name=multiSize]").val();
		if ($.trim(multiColor) != "" || $.trim(multiSize) != "") {
			flag = true;
			if ($.trim(multiColor) != "") {
				sku += "-" + multiColor;
			}
			if ($.trim(multiSize) != "") {
				sku += "-" + multiSize;
			}
			$(this).find("input[name=multiSku]").val(sku);
		}
	});
	
	if (!flag) {
		var param = {
			status : 0,
			message : "请至少有一行填写颜色或尺寸"
		};
		$.message.showMessage(param);
	} else {
		var param = {
			status : 1,
			message : "操作成功"
		};
		$.message.showMessage(param);
	}
}

function openProcurementLink () {
	var dialog = $("#productDialog");
	var link = dialog.find("input[name=purchaseUrl]").val();
	var id = dialog.find("input[name=id]").val();
	if (link == undefined) {
		if ($.trim(id) != "") {
			$.ajax({
				url : "/product/getProductPurchaseUrl",
				type: 'POST',
				dataType : "json",
				data : {
					productId : id
				},
				success : function (data) {
					var url = data;
					window.open(url);
				}
			});
		} else {
			var param = {
				status : 0,
				message : "未设置采购链接"
			};
			$.message.showMessage(param);
		}
	} else {
		if ($.trim(link) == "") {
			var param = {
				status : 0,
				message : "未设置采购链接"
			};
			$.message.showMessage(param);
		} else {
			window.open(link);
		}
	}
}

function batchSubmitAudit(idList) {
	$.ajax({
		url : "/product/batchSubmitAudit",
		type: 'POST',
		dataType : "json",
		data : {
			idList : idList
		},
		success : function (data) {
			$.message.showMessage(data);
			if (data.status == 1) {
				refresh(1000);
			}
		}
	});
}

function exportProductData(idList) {
	if ($("#exportProductForm").length > 0) {
		$("#exportProductForm").remove();
	}
	var turnForm = document.createElement("form");   
	document.body.appendChild(turnForm);
	turnForm.method = 'post';
	turnForm.id = 'exportProductForm';
	var newElement = document.createElement("input");
	newElement.setAttribute("name","params");
    newElement.setAttribute("type","hidden");
    newElement.setAttribute("value", idList);
	turnForm.appendChild(newElement);
	turnForm.action = "/product/exportProductData";
	turnForm.submit();
}

function loadPublishUserTree() {
	var setting = {
		check: {
			enable: true,
			chkboxType : { "Y" : "ps", "N" : "s" }
		},
		async: {
			enable: true,
			url:"/product/loadPublishUserTree",
			dataType : "json",
			type: "post",
		},
		callback: {
			onCheck: publishUserTreezOnCheck
		}
	};
	$.fn.zTree.init($("#publishUserTree"), setting);
}

function loadEditorUserTree() {
	var setting = {
		check: {
			enable: true,
			chkboxType : { "Y" : "ps", "N" : "s" }
		},
		async: {
			enable: true,
			url:"/product/loadEditorUserTree",
			dataType : "json",
			type: "post",
		},
		callback: {
			onCheck: editorUserTreezOnCheck
		}
	};
	$.fn.zTree.init($("#editorUserTree"), setting);
}

function editorUserTreezOnCheck(event, treeId, treeNode) {
	var count = 0;
	var treeObj = $.fn.zTree.getZTreeObj("editorUserTree");
	var nodes = treeObj.getCheckedNodes(true);
	for (var i = 0; i < nodes.length; i++) {
		var node = nodes[i];
		if (node.isParent) {
			count++;
		}
	}
	$("#editorSelectCount").text(count);
}

function publishUserTreezOnCheck(event, treeId, treeNode) {
	var count = 0;
	var treeObj = $.fn.zTree.getZTreeObj("publishUserTree");
	var nodes = treeObj.getCheckedNodes(true);
	for (var i = 0; i < nodes.length; i++) {
		var node = nodes[i];
		if (node.isParent) {
			count++;
		}
	}
	$("#publishUserSelectCount").text(count);
}

function getTreeSpuList(selector) {
	var spuList = [];
	var treeObj = $.fn.zTree.getZTreeObj(selector);
	var nodes = treeObj.getCheckedNodes(true);
	for (var i = 0; i < nodes.length; i++) {
		var node = nodes[i];
		if (node.isParent) {
			var name = node.name;
			if (name.indexOf("(") > -1) {
				name = name.split("(")[0];
			}
			spuList.push(name);
		}
	}
	return spuList;
}

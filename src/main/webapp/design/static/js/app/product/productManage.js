$(function () {
	initDialog();
	$( "#tabs" ).tabs();
	CKEDITOR.replace('description_cn');
	CKEDITOR.replace('description_en');
});
function initDialog () {
	$("#productDialog").dialog({
		autoOpen: true,
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
//					if (validate()) {
//						saveUser();
//					}
				}
			}
		],
		close: function( event, ui ) {
//			$.myformPlugins.cleanForm("#userDialog");
//			var validateFrom = $("#userDialogFrom").validate();
//			validateFrom.resetForm();
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

function reviewAudit(id) {
	showProductAuditDialog("审核进度");
}
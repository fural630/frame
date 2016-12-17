$(function () {
	initDialog();
	$( "#tabs" ).tabs();
	CKEDITOR.replace('description_cn');
	CKEDITOR.replace('description_en');
	$('#skuSelect').chosen({
	    disable_search_threshold: 5, // 5 个以下的选择项则不显示检索框
	    search_contains: true         // 从任意位置开始检索
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
//					if (validate()) {
//						saveUser();
//					}
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
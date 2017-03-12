$(function () {
	initDialog();
});
function initDialog () {
	$("#platFormDialog").dialog({
		autoOpen: false,
		modal: true,
		width: 700,
		height: 520,
		resizable: false,
		buttons : [ {
				text : "保存",
				icons : {
					primary : "ui-icon-heart"
				},
				click : function() {
					if (validate()) {
						saveUser();
					}
				}
			},{
				text : "关闭",
				icons : {
					primary : "ui-icon-heart"
				},
				click : function() {
					if (validate()) {
						saveUser();
					}
				}
			}
		],
		close: function( event, ui ) {
			$.myformPlugins.cleanForm("#userDialog");
		}
	});
	
	$("#siteDialog").dialog({
		autoOpen: false,
		modal: true,
		width: 600,
		height: 400,
		resizable: false,
		buttons : [ {
				text : "保存",
				icons : {
					primary : "ui-icon-heart"
				},
				click : function() {
					saveUserNavigator();
				}
			}
		],
		close: function( event, ui ) {
			
		}
	});
	
	$("#editPlatformDialog").dialog({
		autoOpen: false,
		modal: true,
		width: 500,
		height: 320,
		resizable: false,
		buttons : [ {
				text : "修改",
				icons : {
					primary : "ui-icon-heart"
				},
				click : function() {
					if (validate()) {
						saveUser();
					}
				}
			}
		],
		close: function( event, ui ) {
			$.myformPlugins.cleanForm("#userDialog");
		}
	});
}

function showPlatformDialog(title) {
	$("#platFormDialog").dialog("option", "title", title);
	$("#platFormDialog").dialog("open");
	loadPlatformList();
}

function showSiteDialog(title) {
	$("#siteDialog").dialog("option", "title", title);
	$("#siteDialog").dialog("open");
}

function loadPlatformList() {
	$("#platformListTable tr:gt(0)").remove();
	$.ajax({
		url : "/system/getPlatformList",
		type: 'POST',
		dataType : "json",
		success : function (data) {
			if (null != data) {
				createPlatformList(data);
			}
		}
	});
}
function createPlatformList(platformList) {
	var list = "";
	for (var i = 0; i < platformList.length; i++) {
		var name = platformList[i].name;
		var id = platformList[i].id;
		list += '<tr>';
		list += 	'<td>' + name + '</td>';
		list += 	'<td style="text-align:center">';
		list += 		'<button class="btn btn-sm" type="button" title="修改" onclick="editPlatform('+id+')"><i class="icon icon-edit-sign"></i></button>&nbsp;';
		list += 		'<button class="btn btn-sm" type="button" title="删除" onclick="removePlatform('+id+')"><i class="icon icon-trash"></i></button>';
		list += 	'</td>';
		list += '</tr>';
	}
	$("#platformListTable").append(list);
}

function editPlatform(id) {
	var dialog = $("#editPlatformDialog");
	$.ajax({
		url : "/system/getPlatformById",
		type: 'POST',
		dataType : "json",
		data : {
			id : id
		},
		success : function (data) {
			if (null != data) {
				dialog.dialog("option", "title", "修改平台");
				dialog.dialog("open");
				dialog.find("input[name='id']").val(data.id);
				dialog.find("input[name='name']").val(data.name);
			}
		}
	});
}
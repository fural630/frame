$(function () {
	initDialog();
});
function initDialog () {
	$("#editPlatFormDialog").dialog({
		autoOpen: false,
		modal: true,
		width: 400,
		height: 220,
		resizable: false,
		buttons : [ {
				text : "保存",
				icons : {
					primary : "ui-icon-heart"
				},
				click : function() {
					savePlatform();
				}
			}
		],
		close: function( event, ui ) {
			$.myformPlugins.cleanForm("#editPlatFormDialog");
		}
	});
	
	$("#platFormDialog").dialog({
		autoOpen: false,
		modal: true,
		width: 700,
		height: 520,
		resizable: false,
		buttons : [ {
				text : "关闭",
				icons : {
					primary : "ui-icon-heart"
				},
				click : function() {
					$("#platFormDialog").dialog("close");
				}
			}
		]
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
	
}

function savePlatform() {
	var platformName = $.trim($("#editPlatFormDialog").find("input[name='name']").val());
	var id = $("#editPlatFormDialog").find("input[name='id']").val();
	if (platformName == '') {
		var param = {status : 0, message : "请输入平台名称"};
		$.message.showMessage(param);
		return;
	}
	
	$.ajax({
		url : "/system/savePlatform",
		type: 'POST',
		dataType : "json",
		data : {
			name : platformName,
			id : id
		},
		success : function (data) {
			$.message.showMessage(data);
			if (data.status == "1") {
				loadPlatformList();
				$("#editPlatFormDialog").dialog("close");
			}
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

function showEditPlatformDialog(title) {
	$("#editPlatFormDialog").dialog("option", "title", title);
	$("#editPlatFormDialog").dialog("open");
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
		list += 		'<button class="btn btn-sm" type="button" title="删除" onclick="confirmMsg(\'removePlatform('+id+')\', \'删除平台属于敏感操作，所有关联平台信息，将无法关联，请尽量使用修改操作，是否确认删除？\')"><i class="icon icon-trash"></i></button>&nbsp;';
		list += 	'</td>';
		list += '</tr>';
	}
	$("#platformListTable").append(list);
}

function removePlatform(id) {
	$.ajax({
		url : "/system/removePlatform",
		type: 'POST',
		dataType : "json",
		data : {
			id : id
		},
		success : function (data) {
			$.message.showMessage(data);
			if (data.status == "1") {
				loadPlatformList();
			}
		}
	});
}

function editPlatform(id) {
	var dialog = $("#editPlatFormDialog");
	$.ajax({
		url : "/system/getPlatformById",
		type: 'POST',
		dataType : "json",
		data : {
			id : id
		},
		success : function (data) {
			if (null != data) {
				dialog.find("input[name='id']").val(data.id);
				dialog.find("input[name='name']").val(data.name);
				showEditPlatformDialog("修改平台");
			}
		}
	});
}
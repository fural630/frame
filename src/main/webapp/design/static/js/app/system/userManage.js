$(function () {
	initDialog();
});
function initDialog () {
	$("#userDialog").dialog({
		autoOpen: false,
		modal: true,
		width: 600,
		height: 420,
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
			}
		],
		close: function( event, ui ) {
			$.myformPlugins.cleanForm("#userDialog");
		}
	});
	
	$("#userNavigatorDialog").dialog({
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

function saveUserNavigator() {
	var idList = [];
	var treeObj = $.fn.zTree.getZTreeObj("navigatorTree");
	var nodes = treeObj.getCheckedNodes(true);
	for (var i = 0; i < nodes.length; i++) {
		var node = nodes[i];
		var id = node.id;
		idList.push(id);
	}
	var ids = idList.join();
	var userId = $("#userNavigatorDialog input[name=id]").val();
	
	$.ajax({
		url : "/system/saveUserNavigator",
		type: 'POST',
		dataType : "json",
		data : {
			userId : userId,
			ids : ids
		},
		success : function (data) {
			if (data.status == 1) {
				$("#userNavigatorDialog").dialog("close");
			}
			$.message.showMessage(data);
		}
	});
	
}


function loadNavigatorTree(userId) {
	var setting = {
		check: {
			enable: true,
			chkboxType : { "Y" : "ps", "N" : "s" }
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		async: {
			enable: true,
			url:"/system/loadNavigatorTree",
			dataType : "json",
			otherParam: {"userId": userId},
			type: "post",
		}
	};
	
	$.fn.zTree.init($("#navigatorTree"), setting);
	$("#userNavigatorDialog input[name=id]").val(userId);
}

function permissionEdit(userId) {
	loadNavigatorTree(userId);
	showUserNavigatorDialog("分配导航权限");
}

function showUserNavigatorDialog(title) {
	$("#userNavigatorDialog").dialog("option", "title", title);
	$("#userNavigatorDialog").dialog("open");
}

function showUserDialog (title) {
	$("#userDialog").dialog("option", "title", title);
	$("#userDialog").dialog("open");
}

function validate() {
	var errorMassage = "";
	var dialog = $("#userDialog");
	var name = $.trim(dialog.find("input[name='name']").val());
	var userName = $.trim(dialog.find("input[name='userName']").val());
	var password = $.trim(dialog.find("input[name='password']").val());
	if (name == "") {
		errorMassage += "&nbsp;*&nbsp;请填写姓名";
	} 
	if (userName == "") {
		errorMassage += "&nbsp;*&nbsp;请填写账号";
	} 
	if (password == "") {
		errorMassage += "&nbsp;*&nbsp;请填写密码";
	} 
	if (errorMassage != "") {
		$(".validateTip").html(errorMassage);
		$(".validateTip").show();
		return false;
	} else {
		$(".validateTip").hide();
	}
	return true; 
}

function saveUser () {
	var dialog = $("#userDialog");
	var id = $.trim(dialog.find("input[name='id']").val());
	var name = $.trim(dialog.find("input[name='name']").val());
	var userName = $.trim(dialog.find("input[name='userName']").val());
	var password = $.trim(dialog.find("input[name='password']").val());
	var role = dialog.find("select[name='role']").val();
	var status = dialog.find("select[name='status']").val();
	var email = $.trim(dialog.find("input[name='email']").val());
	var phone = $.trim(dialog.find("input[name='phone']").val());
	
	$.ajax({
		url : "/system/saveUser",
		type: 'POST',
		dataType : "json",
		data : {
			id : id,
			name : name,
			userName : userName,
			password : password,
			role : role,
			email : email,
			phone : phone,
			status : status
		},
		success : function (data) {
			$.message.showMessage(data);
			if (data.status == 1) {
				$("#userDialog").dialog("close");
				$.myformPlugins.cleanForm("#userDialog");
				refresh(1000);
			}
		}
	});
}

function editUserInfo (id) {
	var url = "/system/getUserInfo";
	$.ajax({
		url : url,
		type: 'POST',
		dataType : "json",
		data : {
			id : id
		},
		success : function (data) {
			if (null != data) {
				fillingData(data, "#userDialog");
			} else {
				var param = {
					status : -1
				};
				$.message.showMessage(param);
			}
		}
	});
}

function fillingData (obj, selector) {
	showUserDialog("修改用户信息");
	for ( var name in obj ){ 
		var input = $(selector).find("input[name=" + name +"]");
		if (input.length > 0) {
			input.val(obj[name]);
		}
		var select = $(selector).find("select[name=" + name +"]");
		if (select.length > 0) {
			select.val(obj[name]);
		}
	}
}

function deleteUser (id) {
	$.ajax({
		url : "/system/deleteUser",
		type: 'POST',
		dataType : "json",
		data : {
			id : id
		},
		success : function (data) {
			$.message.showMessage(data);
			refresh(1000);
		}
	});
} 
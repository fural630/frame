$(function () {
	initDialog();
});
function initDialog () {
	$("#roleDialog").dialog({
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
					if (validate()) {
						saveRole();
					}
				}
			}
		],
		close: function( event, ui ) {
			$.myformPlugins.cleanForm("#roleDialog");
			var validateFrom = $("#roleDialogFrom").validate();
			validateFrom.resetForm();
		}
	});
}

function showRoleDialog (title) {
	$("#roleDialog").dialog("option", "title", title);
	$("#roleDialog").dialog("open");
}

function validate() {
	return $("#roleDialogFrom").valid();
}

function saveRole () {
	var dialog = $("#roleDialog");
	var id = $.trim(dialog.find("input[name='id']").val());
	var roleName = $.trim(dialog.find("input[name='roleName']").val());
	var description = $.trim(dialog.find("textarea[name='description']").val());
	
	var url = "/system/saveRole";
	
	$.ajax({
		url : url,
		type: 'POST',
		dataType : "json",
		data : {
			id : id,
			roleName : roleName,
			description : description
		},
		success : function (data) {
			$.message.showMessage(data);
			if (data.status == 1) {
				$("#roleDialog").dialog("close");
				$.myformPlugins.cleanForm("#roleDialog");
				refresh(1000);
			}
		}
	});
}

function editRoleInfo (id) {
	var url = "/system/getRoleInfo";
	$.ajax({
		url : url,
		type: 'POST',
		dataType : "json",
		data : {
			id : id
		},
		success : function (data) {
			$.unblockUI();
			if (null != data) {
				fillingData(data, "#roleDialog");
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
	showRoleDialog("修改用户信息");
	for ( var name in obj ){ 
		var input = $(selector).find("input[name=" + name +"]");
		if (input.length > 0) {
			input.val(obj[name]);
		}
		var select = $(selector).find("select[name=" + name +"]");
		if (select.length > 0) {
			select.val(obj[name]);
		}
		var textarea = $(selector).find("textarea[name=" + name +"]");
		if (textarea.length > 0) {
			textarea.val(obj[name]);
		}
	}
}

function deleteRole (id) {
	if(confirm("确定删除？")){
		var url = "/system/deleteRole";
		$.ajax({
			url : url,
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
} 
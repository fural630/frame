$(function () {
	$('#publishUserId').chosen({
	    disable_search_threshold: 5, // 5 个以下的选择项则不显示检索框
	    search_contains: true,         // 从任意位置开始检索
	    allow_single_deselect : true
	});
	$('#creatorId').chosen({
	    disable_search_threshold: 5, // 5 个以下的选择项则不显示检索框
	    search_contains: true,         // 从任意位置开始检索
	    allow_single_deselect : true
	});
	inintDialog();
});

function inintDialog () {
	$("#publishUserConfigDialog").dialog({
		autoOpen: false,
		modal: true,
		width: 800,
		height: 600,
		resizable: false,
		buttons : [{
				text : "关闭",
				icons : {
					primary : "ui-icon-heart"
				},
				click : function() {
					$("#publishUserConfigDialog").dialog("close");
					refresh(1000);
				}
			}
		],
		close: function( event, ui ) {
			$.myformPlugins.cleanForm("#publishUserConfigDialog");
		}
	});
}

function showPublishUserDistributeDialog(title) {
	$("#publishUserConfigDialog").dialog("option", "title", title);
	$("#publishUserConfigDialog").dialog("open");
	inintSpuZtree();
	inintPlatformTree();
	inintSiteTree();
	inintPublishUserTree();
}

function inintSpuZtree() {
	var setting = {
		check: {
			enable: true,
			chkboxType : { "Y" : "ps", "N" : "s" }
		},
		async: {
			enable: true,
			url : "/system/inintSpuZtree",
			dataType : "json",
			type : "post"
		}
	};
	$.fn.zTree.init($("#spuTree"), setting);
}

function inintPlatformTree() {
	var setting = {
		check: {
			enable: true,
			chkboxType : { "Y" : "ps", "N" : "s" }
		},
		async: {
			enable: true,
			url : "/system/inintPlatformTree",
			dataType : "json",
			type : "post"
		}
	};
	$.fn.zTree.init($("#platformTree"), setting);
}

function inintSiteTree() {
	var setting = {
		check: {
			enable: true,
			chkboxType : { "Y" : "ps", "N" : "s" }
		},
		async: {
			enable: true,
			url : "/system/inintSiteTree",
			dataType : "json",
			type : "post"
		}
	};
	$.fn.zTree.init($("#siteTree"), setting);
}

function inintPublishUserTree() {
	var setting = {
		check: {
			enable: true,
			chkboxType : { "Y" : "ps", "N" : "s" }
		},
		async: {
			enable: true,
			url : "/system/inintPublishUserTree",
			dataType : "json",
			type : "post"
		}
	};
	$.fn.zTree.init($("#publishUserTree"), setting);
}
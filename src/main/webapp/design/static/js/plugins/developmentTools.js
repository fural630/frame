$(function () {
	$( "#tabs" ).tabs();
	reviewCode();
});

function baseCode() {
	var baseHtml = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><br/>';
	baseHtml += '<html><br/>';
	baseHtml += '	<head><br/>';
	baseHtml += '		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><br/>';
	baseHtml += '		<#include "../common/common.ftl"/><br/>';
	baseHtml += '{headImport}';
	baseHtml += '	</head><br/>';
	baseHtml += '	<body><br/>';
	baseHtml += '		<form action="{modelAction}" id="mainPageForm" method="post"><br/>';
	baseHtml += '		<div class="current_nav_name clearfix">{modelNameCn}<br/>';
	baseHtml += '			<div class="fr small_size"><br/>';
	baseHtml += '{buttonImport}';
	baseHtml += '			</div><br/>';
	baseHtml += '		</div><br/>';
	baseHtml += '		<#include "../common/page.ftl"/><br/>';
	baseHtml += '		<div class="mainbody clearfix"><br/>';
	baseHtml += '			<div class="tableview clearfix"><br/>';
	baseHtml += '				<div class="content"><br/>';
	baseHtml += '					<table class="tb_border tb_full stripe" id="{pageTable}" name="pageTable"><br/>';
	baseHtml += '{filedNameCn}';
	baseHtml += '{condition}';
	baseHtml += '';
	baseHtml += '';
	baseHtml += '					</table><br/>';
	baseHtml += '				</div><br/>';
	baseHtml += '			</div><br/>';
	baseHtml += '		</div><br/>';
	baseHtml += '';
	baseHtml += '';
	baseHtml += '		</form><br/>';
	baseHtml += '	</body><br/>';
	baseHtml += '</html>';
	return baseHtml;
}


function reviewCode() {
	var code = baseCode();
	code = inintHeadImport(code);
	code = inintBaseInfo(code);
	code = inintButton(code);
	code = inintFiledNameCn(code);
	code = inintCondition(code)
	$("#codeReview").html(replaceCode(code));
}

function inintHeadImport(code) {
	var tagDiv = $("#tabs-1");
	
	var jsList = tagDiv.find("input[name='js']");
	var jsHtml = '';
	jsList.each(function (){
		if ($(this).is(":checked")) {
			var link = $(this).val();
			jsHtml += '		<script type="text/javascript" src="'+link+'.js"></script><br/>';
		} 
	});
	
	var cssList = tagDiv.find("input[name='css']");
	var cssHtml = '';
	cssList.each(function (){
		if ($(this).is(":checked")) {
			var link = $(this).val();
			cssHtml += '		<link rel="stylesheet" type="text/css" href="'+link+'.css"/><br/>';
		} 
	});
	
	var jsModelName = tagDiv.find("input[name='jsModelName']").val();
	var jsFileName = tagDiv.find("input[name='jsFileName']").val();
	
	var cssModelName = tagDiv.find("input[name='cssModelName']").val();
	var cssFileName = tagDiv.find("input[name='cssFileName']").val();
	
	var customizeJs = "";
	if ($.trim(jsModelName) != "" && $.trim(jsFileName)) {
		customizeJs = '		<script type="text/javascript" src="/design/static/js/app/'+jsModelName+'/'+jsFileName+'"/><br/>'
	}
	
	var customizeCss = "";
	if ($.trim(cssModelName) != "" && $.trim(cssFileName)) {
		customizeCss = '		<link rel="stylesheet" type="text/css" href="/design/static/css/'+cssModelName+'/'+cssFileName+'"/><br/>';
	}
	
	var html = jsHtml + cssHtml + customizeJs + customizeCss;
	code = code.replace("{headImport}", html);
	return code;
}

function inintBaseInfo(code) {
	var tagDiv = $("#tabs-2");
	var modelNameCn = $.trim(tagDiv.find("input[name='modelNameCn']").val());
	var modelAction = $.trim(tagDiv.find("input[name='modelAction']").val());
	
	if (modelNameCn != "") {
		code = code.replace("{modelNameCn}", modelNameCn);
	}
	if (modelAction != "") {
		code = code.replace("{modelAction}", modelAction);
	}
	return code;
}

function inintButton(code) {
	var buttonTr = $("table[name='buttonTable'] tr:gt(0)");
	var buttonHtml = "";
	buttonTr.each(function() {
		var buttonPackage = $(this).find("input[name='buttonPackage']").val();
		var buttonIcon = $(this).find("input[name='buttonIcon']").val();
		var buttonFunction = $(this).find("input[name='buttonFunction']").val();
		
		var clickFunction = buttonFunction + '(\'<@s.message "' + buttonPackage + '"/>\')';
		
		buttonHtml += '				<button class="btn btn-sm" type="button" onclick="'+clickFunction+'"><br/>';
		buttonHtml += '					<i class="icon '+buttonIcon+'"></i> <@s.message "'+buttonPackage+'"/><br/>';
		buttonHtml += '				</button><br/>';
	});
	code = code.replace("{buttonImport}", buttonHtml);
	return code;
}

function inintFiledNameCn(code) {
	var pageTr = $("table[name='pageConfigTable'] tr:gt(0)");
	var tr = "						<tr><br/>";
	pageTr.each(function (){
		var fieldNameCn = $(this).find("input[name='fieldNameCn']").val();
		tr += '							<th>' + fieldNameCn + '</th><br/>';
	});
	tr += "						</tr><br/>"
	code = code.replace("{filedNameCn}", tr);
	code = code.replace("{pageTable}", $("input[name='pageTableName']").val());
	return code;
}

function inintCondition(code) {
//	var conditionTr = $("table[name='pageConfigTable'] tr:gt(0)");
//	var tr = "						<tr><br/>";
//	pageTr.each(function (){
//		var fieldNameCn = $(this).find("input[name='fieldNameCn']").val();
//		tr += '							<td>' + fieldNameCn + '</td><br/>';
//	});
//	tr += "						</tr><br/>"
//	code = code.replace("{condition}", tr);
	return code;
}

function replaceCode(code) {
	var tmpCode = code;
	tmpCode = tmpCode.replace(/<br\/>/g, "{br}");
	tmpCode = tmpCode.replace(/\"/g, "&quot;");
	tmpCode = tmpCode.replace(/</g, "&lt;");
	tmpCode = tmpCode.replace(/>/g, "&gt");
	tmpCode = tmpCode.replace(/{br}/g, "<br/>")
	return tmpCode;
}

function parentChecked(obj) {
	var checkbox = $(obj).prev();
	checkbox.prop("checked", !checkbox.is(':checked'));
}

function addButtonConfigRow() {
	var buttonRow = "";
	buttonRow += '<tr>';
	buttonRow += '	<td><input type="text" name="buttonPackage" class="txt"/></td>';
	buttonRow += '	<td><input type="text" name="buttonIcon" class="txt"/></td>';
	buttonRow += '	<td><input type="text" name="buttonFunction" class="txt"/></td>';
	buttonRow += '	<td><button class="btn btn-sm btn-danger" type="button" onclick="removeButtonConfigRow(this)"><i class="icon icon-trash"></i></button></td>';
	buttonRow += '</tr>';
	$("table[name='buttonTable']").append(buttonRow);
}

function addPageConfigRow() {
	var row = "";
	row += '<tr>';
	row += '	<td><input type="text" name="beanField" class="txt"/></td>';
	row += '<td>';
	row += '		<input type="text" name="fieldNameCn" class="txt width_100px"/>';
	row += '	</td>';
	row += '	<td>';
	row += '		<input type="text" name="fieldClase" class="txt width_120px" placeholder="min-width:120px;"/>';
	row += '	</td>';
	row += '	<td>';
	row += '		<select name="beanType" class="sel">';
	row += '			<option value="String">String</option>';
	row += '			<option value="Integer">Integer</option>';
	row += '		</select>';
	row += '	</td>';
	row += '	<td>';
	row += '		<input type="text" name="queryEnum" class="txt width_100px"/>';
	row += '	</td>';
	row += '	<td>';
	row += '		<select name="queryType" class="sel">';
	row += '			<option value="empty">无</option>';
	row += '			<option value="txt">文本框</option>';
	row += '			<option value="date">日期</option>';
	row += '		</select>';
	row += '	</td>';
	row += '	<td>';
	row += '		<input type="text" name="queryClass" class="txt width_100px" value="txt width_100px"/>';
	row += '	</td>';
	row += '	<td><button class="btn btn-sm btn-danger" type="button" onclick="removePageConfigRow(this)"><i class="icon icon-trash"></i></button></td>';
	row += '</tr>';
	
	$("table[name='pageConfigTable']").append(row);
}

function removeButtonConfigRow(obj) {
	$(obj).parent().parent().remove();
}

function removePageConfigRow(obj) {
	$(obj).parent().parent().remove();
}

$(function () {
	$( "#tabs" ).tabs();
});

function reviewCode() {
	var code = "";
	code += '<a href="http:www.baidu.com">baidu</a>';
	code = code.replace(/\"/g, "&quot;");
	code = code.replace(/</g, "&lt;");
	code = code.replace(/>/g, "&gt");
	$("#codeReview").html(code);
}

function replaceCode(code) {
	var tmpCode = code;
	tmpCode = tmpCode.replace(/\"/g, "&quot;");
	tmpCode = tmpCode.replace(/</g, "&lt;");
	tmpCode = tmpCode.replace(/>/g, "&gt");
	return tmpCode;
}
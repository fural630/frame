$(function() {
	$('#userSelect').chosen({
	    disable_search_threshold: 5, // 5 个以下的选择项则不显示检索框
	    search_contains: true,         // 从任意位置开始检索
	    allow_single_deselect : true
	});
});
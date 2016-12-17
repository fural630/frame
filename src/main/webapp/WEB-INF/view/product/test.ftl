<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>xitong</title>
<script type="text/javascript" src="/design/frame/zui/lib/jquery/jquery.js"></script>
<script type="text/javascript" src="/design/frame/zui/js/zui.min.js"></script>
<script type="text/javascript" src="/design/frame/zui/lib/chosen/chosen.min.js"></script>
<link href="/design/frame/zui/css/zui.min.css" rel="stylesheet">
<link href="/design/frame/zui/lib/chosen/chosen.min.css" rel="stylesheet">
<script>
$(function(){
	$('select.chosen-select').chosen({
    no_results_text: '没有找到',    // 当检索时没有找到匹配项时显示的提示文本
    disable_search_threshold: 5, // 10 个以下的选择项则不显示检索框
    search_contains: true         // 从任意位置开始检索
	});
	
	$('#sortableList').sortable();
});
</script>

</head>
<body>
          <select data-placeholder="选择一个宠物..." class="chosen-select form-control" tabindex="2" style="width:120px;">
            <option value=""></option>
            <option value="cat">小猫</option>
            <option value="dog">小狗</option>
            <option value="fish">金鱼</option>
            <option value="dragon">龙</option>
			 <option value=""></option>
            <option value="cat">小猫</option>
            <option value="dog">小狗</option>
            <option value="fish">金鱼</option>
            <option value="dragon">龙</option>
			 <option value=""></option>
            <option value="cat">小猫</option>
            <option value="dog">小狗</option>
            <option value="fish">金鱼</option>
            <option value="dragon">龙</option>
			 <option value=""></option>
            <option value="cat">小猫</option>
            <option value="dog">小狗</option>
            <option value="fish">金鱼</option>
            <option value="dragon">龙</option>
          </select>

<img src="http://www.guphotos.com/images/V/5/V2225/V2225-1-53ce-xCR4.jpg" 
 data-image="http://www.guphotos.com/images/V/5/V2225/V2225-1-53ce-xCR4.jpg" data-caption="" class="img-thumbnail" title="点击放大" width="110">
<a href="http://www.guphotos.com/images/V/5/V2225/V2225-1-53ce-xCR4.jpg" data-toggle="lightbox" class="btn btn-sm"><i class="icon icon-zoom-in"></i></a>


<div class="list-group" id="sortableList">
  <div class="list-group-item"><i class="icon-move"></i> 猫咪</div>
  <div class="list-group-item"><i class="icon-move"></i> 小鸡</div>
  <div class="list-group-item"><i class="icon-move"></i> 大黄</div>
  <div class="list-group-item"><i class="icon-move"></i> 鹅鹅鹅</div>
  <div class="list-group-item"><i class="icon-move"></i> 猪王</div>
</div>

<!--
<nav class="menu" data-toggle="menu" style="width: 200px">
  <button class="btn btn-primary"><i class="icon-edit"></i> CREATE</button>
  <button class="btn"><i class="icon-cloud-upload"></i> UPLOAD</button>
  <ul class="nav nav-primary">
    <li><a href="javascript:;"><i class="icon-th"></i> Dashboard</a></li>
    <li><a href="javascript:;"><i class="icon-user"></i> Me</a></li>
    <li class="nav-parent">
      <a href="javascript:;"><i class="icon-time"></i> Time</a>
      <ul class="nav">
        <li><a href="javascript:;">Today</a></li>
        <li><a href="javascript:;">Tomarrow</a></li>
        <li><a href="javascript:;">Yestorday</a></li>
        <li><a href="javascript:;">This Week</a></li>
      </ul>
    </li>
    <li><a href="javascript:;"><i class="icon-trash"></i> Trash</a></li>
    <li><a href="javascript:;"><i class="icon-list-ul"></i> All</a></li>
    <li class="active show nav-parent">
      <a href="javascript:;"><i class="icon-tasks"></i> Status</a>
      <ul class="nav">
        <li><a href="javascript:;"><i class="icon-circle-blank"></i> Ready</a></li>
        <li class="active"><a href="javascript:;"><i class="icon-play-sign"></i> Ongoing</a></li>
        <li><a href="javascript:;"><i class="icon-ok-sign"></i> Completed</a></li>
      </ul>
    </li>
  </ul>
</nav>
-->

</body>
</html>
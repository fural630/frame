layui.use('table', function() {
	var table = layui.table;
	var $ = layui.$;
	
	table.render({
		elem: '#userManageTable'
		,toolbar: '#userToolbar'
		,url:'/user/getUserTable'
		,request : {
			pageName : 'nowPage',
			limitName : 'pageSize'
		}
		,response : {
			countName : 'totalNum',
			dataName : 'items',
			statusCode : 200
		}
		,cols: [[
		  {type:'checkbox'}
		  ,{field : 'id', width : 80, title : 'ID'}
		  ,{field : 'name', width : 80, title : '姓名'}
		  ,{field : 'account', width : 200, title : '账号'}
		  ,{field : 'phone', width : 140, title : '电话'}
		  ,{field : 'email', width : 180, title : '邮箱'}
		  ,{field : 'sex', width : 80,  title : '性别', sort : true, templet : '#sexTpl'}
		  ,{field : 'birthDay', width : 120, title : '出生日期'}
		  ,{field : 'departmentCid', minWidth : 100, title: '所属部门'}
		  ,{field : 'status', width : 80, title : '状态', sort : true, templet : '#statusTpl'}
		]]
		,page: true
	});
});
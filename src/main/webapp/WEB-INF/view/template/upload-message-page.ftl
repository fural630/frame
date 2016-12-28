<#if outputData["messageOutput"]??>
	<h3>数据上传</h3>
	<#list outputData["messageOutput"]?keys as data>
		 第 ${data!""} 行   数据上传...... ${outputData["messageOutput"][data]}
		<br>		
	</#list>
	<br>
	共${(outputData["countData"]["finalNumber"])!'0'}条  成功: ${(outputData["countData"]["successCounts"])!'0'}条  失败: ${(outputData["countData"]["failureCounts"])!'0'}条
<#else>
	上传失败!
</#if>
<script>
	window.parent.unblock();
</script>

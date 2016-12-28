<#if uploadMessage??>
	${uploadMessage}
</#if>
<#if outputData.get("messageOutput")??>
	<h3>数据上传</h3>
	<#list outputData.get("messageOutput").keySet() as data>
		 第 ${data!""} 行   数据上传...... ${outputData.get("messageOutput").get(data)}
		<br>		
	</#list>
	<br>
	共${(outputData.get("countData").get("finalNumber"))!'0'}条  成功: ${(outputData.get("countData").get("successCounts"))!'0'}条  失败: ${(outputData.get("countData").get("failureCounts"))!'0'}条
<#else>
	上传失败!
</#if>
<script>
	//window.parent.document.getElementById("importData").disabled="";
</script>

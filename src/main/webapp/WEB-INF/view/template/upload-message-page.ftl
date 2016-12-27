<#if sfsd??>
<#if uploadMessage??>
	${uploadMessage}
</#if>
<#if outputData.get("messageOutput")??>
	<h3><@s.text name="data.load"/></h3>
	<#list outputData.get("messageOutput").keySet() as data>
		 ${data!""} 数据上传...... ${outputData.get("messageOutput").get(data)}
		<br>		
	</#list>
	<br>
	共${(outputData.get("countData").get("finalNumber"))!'0'}条  <#--成功: ${(outputData.get("countData").get("successCounts"))!'0'}条 -->  失败: ${(outputData.get("countData").get("failureCounts"))!'0'}条 无交易号的不能导入
	<br><br>
	<#if outputData.get("checkData")?? && ! outputData.get("checkData").isEmpty()>
		<font color="red">${outputData.get("checkData")}</font>
	</#if>
<#else>
	上传失败!
</#if>
<script>
	window.parent.document.getElementById("importData").disabled="";
</script>
</#if>
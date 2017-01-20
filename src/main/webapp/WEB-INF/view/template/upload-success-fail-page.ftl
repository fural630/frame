<#if result??>
	<#if result == 'success'>
		上传成功！
		<#else>
		上传失败！
	</#if>
<#else>
	上传失败!
</#if>
<script>
	window.parent.unblock();
</script>
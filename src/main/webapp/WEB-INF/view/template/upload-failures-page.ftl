<h3><@s.text name="data.load"/></h3>
<#if outputData.get("error")??>
	<font color="red"><@s.text name="import.error"/><br>
		<@s.text name="${outputData.get('error')}"/>
	</font>

<#else>
	<font color="red"><@s.text name="import.error"/><br>
		<@s.text name="please.check.the.contents.of.the.file.for.free.data"/>
	</font>
</#if>
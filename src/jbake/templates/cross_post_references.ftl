<#assign mapAsString = "{"/>
<#assign first = true />
<#list posts as post>
    <#if first = false>
        <#assign mapAsString = mapAsString + ","/>
    </#if>
    <#assign mapAsString = mapAsString + "\"" + post.id + "\":" + "\"" + post.uri + "\""/>
    <#assign first = false/>
</#list>
<#assign mapAsString = mapAsString + "}"/>

<#assign crossRefMap = mapAsString?eval/>
<#-- Note: just to make sure it works
<p><i>crossRefMap size: ${crossRefMap?size}</i></p>
<#assign keys = crossRefMap?keys>
<#list keys as key>
	${key} = ${crossRefMap[key]}
</#list>
<#if !crossRefMap["keynotexist"]??>
	<p><i>key not found</i></p>
<#else>
	<p><i>key found</i></p>
</#if>
-->
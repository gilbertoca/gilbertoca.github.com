<#include "header.ftl">
	
<#include "menu.ftl">
<#include "cross_post_references.ftl">
<article>
    <header>
        <h1>${content.title}</h1>
        <p>by <em>Gilberto C. Andrade</em> on <strong>${content.date?string("dd MMMM yyyy")}</strong></p>
        <p>Tagged as: 
			<#list content.tags as tag>
            <a href="${content.rootpath}tags/${tag}.html">${tag}</a>,
            </#list>
        </p>
    </header>
    <section>
	${content.body}
    </section>
    <#include "disqus.ftl">
</article>
	
<#include "footer.ftl">

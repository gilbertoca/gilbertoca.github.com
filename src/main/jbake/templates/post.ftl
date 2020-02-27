<#include "header.ftl">
	
<#include "menu.ftl">
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
        <section>
            <!-- google-graphic-content -->
            <div id="google-matched-content"></div>
                <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                <!-- google-graphic-content -->
                <ins class="adsbygoogle"
                    style="display:block"
                    data-ad-client="ca-pub-3863943400063116"
                    data-ad-slot="8234899195"
                    data-ad-format="auto"
                    data-full-width-responsive="true"></ins>
                <script>
                    (adsbygoogle = window.adsbygoogle || []).push({});
                </script>
            
        </section>
	${content.body}
    </section>
    <#include "disqus.ftl">
</article>
	
<#include "footer.ftl">

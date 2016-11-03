<#include "header.ftl">
	
<#include "menu.ftl">

<section id="posts">
    <h2>Recent posts</h2>
    <ul>
	<#list posts as post>
        <li>
            <a href="${content.rootpath}${post.uri}">${post.title}</a>
            - <em>${post.date?string("dd MMMM yyyy")}</em> - by <em>Gilberto C. Andrade</em>
        </li>
            <#if post_index = 15>
		<#break/>
            </#if>
        </#list>
    </ul>
    <p><a href="/${config.archive_file}">All posts&hellip;</a></p>
    <h2>Tags</h2>
    <p>
        <#list alltags as tag>
            <a href="tags/${tag}.html">${tag}</a>
        </#list>
    </p>
</section>
<script type="text/javascript">
    /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
    var disqus_shortname = 'blog-gilbertoca-com'; // required: replace example with your forum shortname

    /* * * DON'T EDIT BELOW THIS LINE * * */
    (function () {
        var s = document.createElement('script'); s.async = true;
        s.type = 'text/javascript';
        s.src = '//' + disqus_shortname + '.disqus.com/count.js';
        (document.getElementsByTagName('HEAD')[0] || document.getElementsByTagName('BODY')[0]).appendChild(s);
    }());
</script> 
<#include "footer.ftl">

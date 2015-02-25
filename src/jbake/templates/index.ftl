<#include "header.ftl">
	
	<#include "menu.ftl">

	<section id="posts">
		<h2>Recent posts</h2>
		<ul>
			<#list posts as post>
				<li>
					<a href="${post.uri}">${post.title}</a>
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

<#include "footer.ftl">

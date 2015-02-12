<%include "header.gsp"%>
	
	<%include "menu.gsp"%>
	
	<div class="page-header">
        <div class="row">
            <div class="col-xs-4 col-md-2"><img src="${content.rootpath}img/JustAnOtherDevBlog.png"></div>
            <div class="col-xs-12 col-md-8"><h1>${content.title}</h1></div>
        </div>
	</div>

    <div class="row">

        <div class="col-sm-8" itemscope itemtype="http://schema.org/Blog">

        <p>
            <em>
                <time itemprop="datePublished"
                      datetime="${content.date.format("yyyy-MM-dd")}">
                    ${content.date.format("dd MMMM yyyy")}
                </time>
            </em>
        </p>

        <meta itemprop="name" content="${content.title}"/>

        <div itemprop="author" itemscope itemtype="http://schema.org/Person">
            <meta itemprop="name" content="Yan Bonnel"/>
        </div>
        <meta itemprop="inLanguage" content="fr-FR"/>
        <meta itemprop="url" content="${config.site_host}/${content.uri}"/>
        <meta itemprop="discussionUrl" content="${config.site_host}/${content.uri}#disqus_thread"/>



        <p>Tags :
        <meta itemprop="keywords" content="${content.tags.join(",")}"/>
        <%
            out << content.tags.collect { post_tag ->
                """<a href="${content.rootpath}tags/${post_tag}.html">${post_tag}</a>"""
            } .join(", ")
        %>
        </p>

        <a href="https://twitter.com/share" class="twitter-share-button" data-url="http://blog.gilbertoca.com/${content.uri}" data-via="gilbertoca" data-text="${content.title}" data-lang="fr">Tweeter</a>
        <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
        <div class="g-plusone" data-size="medium" data-href="http://blog.gilbertoca.com/${content.uri}"></div>

        <div itemprop="blogPost">
        <p>${content.body}</p>
        </div>

        <div id="disqus_thread"></div>
        <script type="text/javascript">
            var disqus_shortname = 'gilbertoca';
            var disqus_identifier = '${content.id}';
            (function() {
                var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
                dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
                (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
            })();
        </script>
    </div>

    <div class="col-sm-3 col-sm-offset-1 blog-sidebar">
        <div class="sidebar-module sidebar-module-inset">
            <h4>Yan Bonnel</h4>
            <p>Geek. Technos de prédilections : Java, Android, Git.</p>
            <ul>
                <li><a href="https://twitter.com/gilbertoca">@gilbertoca</a></li>
                <li><a href="https://plus.google.com/110565525210888845228?rel=author">+yanbonnel</a></li>
            </ul>
        </div>

        <div class="sidebar-module">
            <h4>Tags</h4>
            <ol class="list-unstyled" style="margin-left: 0px">
                <%
                    alltags.collect { tag ->
                        [
                                tag,
                                posts.findAll { post ->
                                    post.tags.contains(tag)
                                }.size()
                        ]
                    } .sort { tag ->
                        String.format("%03d%s", 1000 - tag[1], tag[0].toLowerCase())
                    } .each { tagWithCount ->

                %>

                <li><a href="${content.rootpath}tags/${tagWithCount[0]}.html">${tagWithCount[0]}</a> (${tagWithCount[1]})</li>
                <%}%>
            </ol>
        </div>
    </div>
	
<%include "footer.gsp"%>

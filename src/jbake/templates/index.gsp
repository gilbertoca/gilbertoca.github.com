<%include "header.gsp"%>
	
	<%include "menu.gsp"%>

	<div class="page-header">
        <div class="row">
            <div class="col-xs-4 col-md-2"><img src="img/JustAnOtherDevBlog.png"></div>
            <div class="col-xs-12 col-md-8"><h1>JustAnOtherDevBlog</h1></div>
        </div>
	</div>

    <div class="row">

        <div class="col-sm-8">

            <% posts.take(5).each { post -> %>
                <%if (post.status == "published") {%>
                    <div  itemscope itemtype="http://schema.org/Blog">
                        <div itemprop="author" itemscope itemtype="http://schema.org/Person">
                            <meta itemprop="name" content="Yan Bonnel"/>
                        </div>
                        <meta itemprop="inLanguage" content="fr-FR"/>
                        <a itemprop="url" href="${post.uri}">
                            <h1 itemprop="name">${post.title}</h1>
                        </a>
                        <p>
                            <time itemprop="datePublished"
                                  datetime="${post.date.format("yyyy-MM-dd")}">
                                ${post.date.format("dd MMMM yyyy")}
                            </time>
                        </p>

                        <p>Tags :
                            <meta itemprop="keywords" content="${post.tags.join(",")}"/>
                            <%
                                out << post.tags.collect { post_tag ->
                                    """<a href="tags/${post_tag}.html">${post_tag}</a>"""
                                } .join(", ")
                            %>
                        </p>

                        <a href="https://twitter.com/share" class="twitter-share-button" data-url="http://blog.gilbertoca.com/${post.uri}" data-text="${post.title}" data-via="gilbertoca" data-lang="fr">Tweeter</a>
                        <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
                        <div class="g-plusone" data-size="medium" data-href="http://blog.gilbertoca.com/${post.uri}"></div>

                        <div itemprop="blogPost">
                            <p>${post.body}</p>
                        </div>
                        <p><a itemprop="discussionUrl" href="${post.uri}#disqus_thread">Commentaires</a></p>

                    </div>
                <%}%>

            <%}%>

            <hr />

            <p>Billets plus anciens disponibles sur la page <a href="${config.archive_file}">archive</a>.</p>

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
                <a class="twitter-timeline"  href="https://twitter.com/gilbertoca"  data-widget-id="482174196248608769">Tweets de @gilbertoca</a>
                <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
            </div>

            <div class="sidebar-module">
                <h4>Tags</h4>
                <ol class="list-unstyled" style="margin-left: 0px">
                    <%
                        // alltags : list de tags (String)
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
                        <li><a href="tags/${tagWithCount[0]}.html">${tagWithCount[0]}</a> (${tagWithCount[1]})</li>
                    <%}%>
                 </ol>
            </div>
        </div>

    </div>

<%include "footer.gsp"%>

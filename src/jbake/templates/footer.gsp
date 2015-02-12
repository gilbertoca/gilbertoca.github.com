		</div>
		<div id="push"></div>
    </div>
    
    <div id="footer">
      <div class="container">
        <p class="text-muted credit">L'ensemble des posts de ce blog sont publiés sous licence <em>Creative Commons by-nc-sa</em>. <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png"/></a></p>
        <p class="text-muted credit">&copy; 2013 | Mixed with <a href="http://twitter.github.com/bootstrap/">Bootstrap v3.0.2</a> | Baked with <a href="http://jbake.org">JBake ${version}</a></p>
      </div>
    </div>
    
    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <!-- script src="/js/jquery-1.10.2.min.js"></script -->
    <!-- script src="/js/bootstrap.min.js"></script -->
    <script src="<%if (content.rootpath){%>${content.rootpath}<%}else{if (content.type == "tag"){%>../<%}}%>js/run_prettify.js"></script>

    <script src='http://alexgorbatchev.com/pub/sh/3.0.83/scripts/shCore.js' type='text/javascript'></script>
    <script src='http://alexgorbatchev.com/pub/sh/3.0.83/scripts/shBrushCss.js' type='text/javascript'></script>
    <script src='http://alexgorbatchev.com/pub/sh/3.0.83/scripts/shBrushJava.js' type='text/javascript'></script>
    <script src='http://alexgorbatchev.com/pub/sh/3.0.83/scripts/shBrushJScript.js' type='text/javascript'></script>
    <script src='http://alexgorbatchev.com/pub/sh/3.0.83/scripts/shBrushSql.js' type='text/javascript'></script>
    <script src='http://alexgorbatchev.com/pub/sh/3.0.83/scripts/shBrushVb.js' type='text/javascript'></script>
    <script src='http://alexgorbatchev.com/pub/sh/3.0.83/scripts/shBrushXml.js' type='text/javascript'></script>
    <script src='http://alexgorbatchev.com/pub/sh/3.0.83/scripts/shBrushBash.js' type='text/javascript'></script>


    <script language='javascript'>
        SyntaxHighlighter.config.bloggerMode = true;
        SyntaxHighlighter.all();
    </script>


    <script type="text/javascript">
        window.___gcfg = {lang: 'fr'};

        (function() {
            var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
            po.src = 'https://apis.google.com/js/platform.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
        })();
    </script>

    <script>
      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

      ga('create', 'UA-28563381-1', 'blog.gilbertoca.com');
      ga('send', 'pageview');

    </script>
    
  </body>
</html>

<?xml version="1.0"?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
  <channel>
    <title>JustAnOtherDevBlog</title>
    <link>${config.site_host}</link>
    <atom:link href="${config.site_host}/${config.feed_file}" rel="self" type="application/rss+xml" />
    <description>JustAnOtherDevBlog</description>
    <language>en-gb</language>
      <pubDate>${new java.text.SimpleDateFormat("EEE, d MMM yyyy HH:mm:ss Z", Locale.US).format(published_date)}</pubDate>
      <lastBuildDate>${new java.text.SimpleDateFormat("EEE, d MMM yyyy HH:mm:ss Z", Locale.US).format(published_date)}</lastBuildDate>

      <%published_posts.each {post -> %>
      <item>
          <title>${post.title}</title>
          <link>${config.site_host}/${post.uri}</link>
          <pubDate>${new java.text.SimpleDateFormat("EEE, d MMM yyyy HH:mm:ss Z", Locale.US).format(post.date)}</pubDate>
          <guid isPermaLink="false">${config.site_host}/${post.uri}</guid>
          <description>
              ${post.body.replace("&", "&amp;").replace("<","&lt;").replace(">","&gt;").replace("\"", "&quot;").replace("'", "&apos;")}
          </description>
      </item>
      <%}%>

  </channel> 
</rss>

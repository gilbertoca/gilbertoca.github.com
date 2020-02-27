<!DOCTYPE html>
<html lang="pt_BR">
    <head>
        <title></title>
        <meta charset="utf-8"/>
        <title><#if (content.title)??><#escape x as x?xml>${content.title}</#escape><#else>Vivendo e Aprendendo</#if></title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">

        <!--link href="http://fonts.googleapis.com/css?family=Lato:400,900" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Crimson+Text" rel="stylesheet" type="text/css"-->
        <link rel="alternate" type="application/atom+xml" title="Vivendo e Aprendendo (Atom)" href="/feed.xml" />
        <link href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>css/default.css" rel="stylesheet">
        <!--link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/8.6/styles/default.min.css" -->
        <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/8.2/styles/monokai_sublime.min.css">  
        <script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/8.6/highlight.min.js"></script>        
        <script>hljs.initHighlightingOnLoad();</script>
        <!-- Google Analytics -->
        <script>
            (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
            (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
            m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
            })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

            ga('create', 'UA-2586578-2', { 'storage': 'none' });
            ga('set', 'anonymizeIp', true);
            ga('send', 'pageview');
        </script>
        <!-- End Google Analytics -->
        <#include "adsense-auto.ftl">
        <link rel="shortcut icon" href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>favicon.ico">
    </head>
    <body>

title='OpenSuse 10.3 &#8211; pt_BR.UTF8'
date=2009-01-08 16:41:15
type=post
status=published
tags=
,Linux
,opensuse
,Sistema Operacional
~~~~~~
<!-- google_ad_section_start -->

Para resolver de vez os problemas com caracteres estranhos e acentua&#231;&#227;o:

<pre>zypper in bundle-lang-common-pt bundle-lang-gnome-pt bundle-lang-kde-pt
</pre>

Depois, yast->system->language, ajuste o item <span class="guimenu">"Primary Language" para Portugu&#234;s</span>(Brasil).  
Configure tamb&#233;m como as vari&#225;veis "locale" ser&#227;o ajustadas para o usu&#225;rio root atrav&#233;s do bot&#227;o <span class="systemitem"></span>"<span class="guimenu">Details</span>".  
Estes ajustes s&#227;o gravados no arquivo de configura&#231;&#227;o <span class="filename">/etc/sysconfig/language</span>. 

&nbsp;

<!-- google_ad_section_end -->
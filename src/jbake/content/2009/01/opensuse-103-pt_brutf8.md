id=8
title=openSUSE 10.3 - pt_BR.UTF8 
date=2009-01-08 16:41:15
type=post
status=published
tags=Linux, openSUSE, Sistema Operacional
~~~~~~


Para resolver de vez os problemas com caracteres estranhos e acentuação:

<pre>zypper in bundle-lang-common-pt bundle-lang-gnome-pt bundle-lang-kde-pt
</pre>

Depois, yast->system->language, ajuste o item <span class="guimenu">"Primary Language" para Português</span>(Brasil).  
Configure também como as variáveis "locale" serão ajustadas para o usuário root através do botão <span class="systemitem"></span>"<span class="guimenu">Details</span>".  
Estes ajustes são gravados no arquivo de configuração <span class="filename">/etc/sysconfig/language</span>. 

&nbsp;


title=openSuSe 11.0 &#8211; Failed to update system: Authorisation could not be 
obtained'
date=2009-03-02 13:56:32
type=post
status=published
tags=Linux, Objetivo, opensuse, Sistema Operacional
~~~~~~
<!-- google_ad_section_start -->

Resolvi mudar de interface gr&#225;fica no linux. Antes usava o KDE e agora uso o GNOME, apesar de algumas limita&#231;&#245;es da interface n&#227;o tenho muito do que reclamar. Este erro acontece como usu&#225;rio comum, mas como usu&#225;rio administrador (root) funciona sem problemas. Encontrei a solu&#231;&#227;o para esse problema no seguinte <a href="http://linux.derkeiler.com/Mailing-Lists/SuSE/2008-07/msg00999.html" target="_blank">LINK</a>. Reproduzindo: 

<pre>vi /etc/PolicyKit/PolicyKit.conf
</pre>

<config version=&#8221;0.1&#8243;>  
</config>

adicione a seguinte entrada para seu usu&#225;rio: 

<pre>vi /etc/PolicyKit/PolicyKit.conf
</pre>

<config version=&#8221;0.1&#8243;>  
<match user=&#8221;foo&#8221;>  
<return result=&#8221;yes&#8221;>  
</return>  
</match>  
</config>

**<big><big>DESIST&#202;NCIA!<br /> </big></big>**

Ap&#243;s dois dias, confesso que GNOME n&#227;o foi uma experi&#234;ncia agrad&#225;vel. Realmente o KDE3 tr&#225;s o necess&#225;rio para boa produtividade e tranquilidade. Um aplicativo, para mim, determina tudo que uma interface gr&#225;fica pode fornecer: gerenciador de arquivos. Ent&#227;o, o que mais senti falta? <a href="http://konqueror.kde.org/" target="_blank">Konqueror</a>, <a href="http://en.opensuse.org/Konqueror_Tips_and_Tricks" target="_blank">um canivete su&#237;&#231;o</a>! &#201; o primeiro aplicativo que abro para trabalhar e por ele realizo a maioria de minhas atividades. 

**<big><big>KDE4?</p> 

<p>
  </big></big></b> Nem pensar!
</p>

<!-- google_ad_section_end -->
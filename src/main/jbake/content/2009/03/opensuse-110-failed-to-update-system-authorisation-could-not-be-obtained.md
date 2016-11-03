id=7
title=openSUSE 11.0 - Failed to update system: Authorisation could not be obtained
date=2009-03-02 13:56:32
type=post
status=published
tags=Linux, Objetivo, openSUSE, Sistema Operacional
~~~~~~


Resolvi mudar de interface gráfica no linux. Antes usava o KDE e agora uso o GNOME, apesar de algumas limitações da interface não tenho muito do que reclamar. Este erro acontece como usuário comum, mas como usuário administrador (root) funciona sem problemas. Encontrei a solução para esse problema no seguinte <a href="http://linux.derkeiler.com/Mailing-Lists/SuSE/2008-07/msg00999.html" target="_blank">LINK</a>. Reproduzindo: 

<pre>vi /etc/PolicyKit/PolicyKit.conf
</pre>

<config version=”0.1”>  
</config>

adicione a seguinte entrada para seu usuário: 

<pre>vi /etc/PolicyKit/PolicyKit.conf
</pre>

<config version=”0.1”>  
<match user=”foo”>  
<return result=”yes”>  
</return>  
</match>  
</config>

**<big><big>DESISTÊNCIA!<br /> </big></big>**

Após dois dias, confesso que GNOME não foi uma experiência agradável. Realmente o KDE3 trás o necessário para boa produtividade e tranquilidade. Um aplicativo, para mim, determina tudo que uma interface gráfica pode fornecer: gerenciador de arquivos. Então, o que mais senti falta? <a href="http://konqueror.kde.org/" target="_blank">Konqueror</a>, <a href="http://en.openSUSE.org/Konqueror_Tips_and_Tricks" target="_blank">um canivete suíço</a>! É o primeiro aplicativo que abro para trabalhar e por ele realizo a maioria de minhas atividades. 

**<big><big>KDE4?</p> 

<p>
  </big></big></b> Nem pensar!
</p>


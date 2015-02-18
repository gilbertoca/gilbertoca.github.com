id: 14
title: 'Oracle Developer Suite 10g &#8211; [OpenSuSe 10.3]'
author: gilberto_ca
layout: post
guid: http://www.jroller.com/gilbertoca/entry/oracle_developer_suite_10g_opensuse
permalink: /?p=14
categories:
  - Application Server
---
<!-- google_ad_section_start -->

O processo de instala&#231;&#227;o da vers&#227;o 10.1.2.0.2 do DeveloperSuite10g no OpenSuSe 10.3 n&#227;o &#233; certificada. Mas como temos apenas licen&#231;a para o servidor, o jeito &#233; enfrentar os poss&#237;veis problemas com essa instala&#231;&#227;o.

A instala&#231;&#227;o ocorre sem problemas at&#233; a fase de lincagem (ai ai, o portugu&#234;s! Ser&#225; que est&#225; certo?), nesse processo ocorre problemas para lincar as bibliotecas do reports 

<pre>/usr/lib/libXtst.so.6: undefined reference to&#171; __fprintf_chk@GLIBC_2.3.4
/usr/lib/libXtst.so.6: undefined reference to &#171; __stack_chk_fail@GLIBC_2.4
/usr/lib/libXtst.so.6: undefined reference to &#171; __sprintf_chk@GLIBC_2.3.4
</pre>

(enquanto o Universal Installer lhe apresentar com a tela de erro, vc pode aplicar esse contorno para corrigir).

A &#250;nica solu&#231;&#227;o encontrada &#233; a apresentada <a target="_blank" href="http://bytes.com/forum/thread722608.html">nessa</a> discuss&#227;o. A id&#233;ia &#233; substituir a biblioteca atual por uma vers&#227;o que funciona, al&#233;m disso, precisa estar no local apropriado. O pacote sugerido na vers&#227;o &#233; dif&#237;cil de encontra para o OpenSuSe 10.3, ent&#227;o fiz o seguinte (copiei-as do servidor):

<pre>mv /usr/lib/libXtst.so.6.1.0 /usr/lib/libXtst_so_6_1_0
mv /usr/lib/libXtst.so.6 /usr/lib/libXtst_so_6
scp oracle@oasibm:/usr/X11R6/lib/libXtst.so.6.1.0 /usr/X11R6/lib/
scp oracle@oasibm:/usr/X11R6/lib/libXtst.so.6.1 /usr/X11R6/lib/
ln -s /usr/X11R6/lib/libXtst.so.6.1 /usr/lib/libXtst.so
ln -s /usr/X11R6/lib/libXtst.so.6.1 /usr/lib/libXtst.so.6
ln -s /usr/X11R6/lib/libXtst.so.6.1 /usr/lib/libXtst.so.6.1.0
</pre>

Caso contr&#225;rio, voc&#234; n&#227;o conseguir&#225; executar o reports builder. Veja o problema que aparece caso voc&#234; n&#227;o consiga lincar as bibliotecas  
<img style="max-width: 800px;" src="http://www.jroller.com/gilbertoca/resource/rep-3300.png" />

<!-- google_ad_section_end -->
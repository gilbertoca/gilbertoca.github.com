id=14
title=Oracle Developer Suite 10g - [openSUSE 10.3] 
date=2008-05-06 21:10:09
type=post
status=published
tags=Application Server
~~~~~~


O processo de instalação da versão 10.1.2.0.2 do DeveloperSuite10g no openSUSE 10.3 não é certificada. Mas como temos apenas licença para o servidor, o jeito é enfrentar os possíveis problemas com essa instalação.

A instalação ocorre sem problemas até a fase de lincagem (ai ai, o português! Será que está certo?), nesse processo ocorre problemas para lincar as bibliotecas do reports 

<pre>/usr/lib/libXtst.so.6: undefined reference to&#171; __fprintf_chk@GLIBC_2.3.4
/usr/lib/libXtst.so.6: undefined reference to &#171; __stack_chk_fail@GLIBC_2.4
/usr/lib/libXtst.so.6: undefined reference to &#171; __sprintf_chk@GLIBC_2.3.4
</pre>

(enquanto o Universal Installer lhe apresentar com a tela de erro, vc pode aplicar esse contorno para corrigir).

A única solução encontrada é a apresentada <a target="_blank" href="http://bytes.com/forum/thread722608.html">nessa</a> discussão. A idéia é substituir a biblioteca atual por uma versão que funciona, além disso, precisa estar no local apropriado. O pacote sugerido na versão é difícil de encontra para o openSUSE 10.3, então fiz o seguinte (copiei-as do servidor):

<pre>mv /usr/lib/libXtst.so.6.1.0 /usr/lib/libXtst_so_6_1_0
mv /usr/lib/libXtst.so.6 /usr/lib/libXtst_so_6
scp oracle@oasibm:/usr/X11R6/lib/libXtst.so.6.1.0 /usr/X11R6/lib/
scp oracle@oasibm:/usr/X11R6/lib/libXtst.so.6.1 /usr/X11R6/lib/
ln -s /usr/X11R6/lib/libXtst.so.6.1 /usr/lib/libXtst.so
ln -s /usr/X11R6/lib/libXtst.so.6.1 /usr/lib/libXtst.so.6
ln -s /usr/X11R6/lib/libXtst.so.6.1 /usr/lib/libXtst.so.6.1.0
</pre>

Caso contrário, você não conseguirá executar o reports builder. Veja o problema que aparece caso você não consiga lincar as bibliotecas  
<img style="max-width: 800px;" src="http://www.jroller.com/gilbertoca/resource/rep-3300.png" />


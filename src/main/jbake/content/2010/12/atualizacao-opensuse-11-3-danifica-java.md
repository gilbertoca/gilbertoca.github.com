id=461
title=Atualização openSUSE 11.3 danifica Java
date=2010-12-07 22:03:56
type=post
status=published
tags=FireFox,  Java, Linux, openSUSE, Sistema Operacional
~~~~~~


Veja como o [post que menciono o uso do utilitário update-alternatives][1] é importante.  
Recentemente apliquei um patch - atualização de correção - para o 
[openSUSE 11.3][2] e se não houvesse duas [máquinas virtuais java - JRE -][3], 
certamente não conseguiria acessar qualquer site que dependesse do [Java][4]. 

Veja o problema:

<pre>
<code class="bash">
gilberto@dhcppc0:~> firefox -g
Gtk-Message: (for origin information, set GTK_DEBUG): failed to retrieve property GtkTreeView::odd-row-color' of typeGdkColor’ from rc file value “((GString*) 0xb1f11100)” of type GString'
*** nss-shared-helper: Shared database disabled (set NSS_USE_SHARED_DB to enable).
ERROR: Invalid browser function table. Some functionality may be restricted.
/usr/src/packages/BUILD/icedtea6-1.9.2/plugin/icedteanp/IcedTeaNPPlugin.cc:1506: thread 0x8090738: Error: Failed to spawn applet viewer: Falha ao executar processo filho "/etc/alternatives/../../bin/java" (Arquivo ou diretório não encontrado)
*** NSPlugin Wrapper *** ERROR: NP_Initialize() wait for reply: Message timeout
ERROR: Invalid browser function table. Some functionality may be restricted.
/usr/src/packages/BUILD/icedtea6-1.9.2/plugin/icedteanp/IcedTeaNPPlugin.cc:1506: thread 0x8090738: Error: Failed to spawn applet viewer: Falha ao executar processo filho "/etc/alternatives/../../bin/java" (Arquivo ou diretório não encontrado)
gilberto@dhcppc0:~>
</code>    
</pre>
Quando constatei o problema, utilizei o [update-alternatives][5] para alternar 
a versão da máquina virtual java:

<pre>
<code class="bash">
gilberto@dhcppc0:~> su -
Senha:
dhcppc0:~ # update-alternatives –config javaplugin
There are 2 alternatives which provide `javaplugin’.
  Selection    Alternative
-----------------------------------------------
 +        1    /usr/lib/jvm/jre-1.6.0-openjdk/lib/i386/IcedTeaPlugin.so
*         2    /usr/lib/jvm/java-1.6.0-sun-1.6.0/jre/lib/i386/libnpjp2.so

Press enter to keep the default[*], or type selection number: 
dhcppc0:~ #
</code>    
</pre>

Outra solução, caso você só tenha uma versão instalada, se encontra 
[nesta discussão][6], pelo comentário do usuário nwrickert. 

**ATUALIZAÇÃO:** esqueci-me de mencionar que está estação de trabalho é a de 
minha casa e que hoje fazem 60 dias que instalei o openSUSE 11.3. Por que está 
nota? Porque os usuários do Windows XP - minha esposa e meu filho(9 anos) - 
adoraram a mudança!

 [1]: http://blog.gilbertoca.com/?p=383
 [2]: http://www.openSUSE.org/pt-br/
 [3]: http://www.oracle.com/technetwork/java/javase/downloads/index.html
 [4]: http://www.oracle.com/technetwork/java/index.html
 [5]: http://transit.iut2.upmf-grenoble.fr/cgi-bin/man/man2html?8+update-alternatives
 [6]: http://www.dslreports.com/forum/r24716562-suse-update-broke-java
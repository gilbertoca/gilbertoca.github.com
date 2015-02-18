title=Atualização OpenSuSe 11.3 danifica Java
status=published
type=post
tags=
  - Geral
  - Java
  - Linux
tags=
  - FireFox
  - Jornada
  - Linux
  - opensuse
  - Sistema Operacional
~~~~~~
<!-- google_ad_section_start -->

Veja como o [post que menciono o uso do utilitário update-alternatives][1] é importante.  
Recentemente apliquei um patch &#8211; atualização de correção &#8211; para o [OpenSuSe 11.3][2] e se não houvesse duas [máquinas virtuais java &#8211; JRE -][3], certamente não conseguiria acessar qualquer site que dependesse do [Java][4]. 

Veja o problema:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="bash" style="font-family:monospace;">gilberto<span style="color: #000000; font-weight: bold;">@</span>dhcppc0:~<span style="color: #000000; font-weight: bold;">&gt;</span> firefox <span style="color: #660033;">-g</span>
Gtk-Message: <span style="color: #7a0874; font-weight: bold;">&#40;</span><span style="color: #000000; font-weight: bold;">for</span> origin information, <span style="color: #000000; font-weight: bold;">set</span> GTK_DEBUG<span style="color: #7a0874; font-weight: bold;">&#41;</span>: failed to retrieve property <span style="color: #000000; font-weight: bold;">`</span>GtkTreeView::odd-row-color<span style="color: #ff0000;">' of type `GdkColor'</span> from rc <span style="color: #c20cb9; font-weight: bold;">file</span> value <span style="color: #ff0000;">"((GString*) 0xb1f11100)"</span> of <span style="color: #7a0874; font-weight: bold;">type</span> <span style="color: #000000; font-weight: bold;">`</span>GString<span style="color: #ff0000;">'
*** nss-shared-helper: Shared database disabled (set NSS_USE_SHARED_DB to enable).
ERROR: Invalid browser function table. Some functionality may be restricted.
/usr/src/packages/BUILD/icedtea6-1.9.2/plugin/icedteanp/IcedTeaNPPlugin.cc:1506: thread 0x8090738: Error: Failed to spawn applet viewer: Falha ao executar processo filho "/etc/alternatives/../../bin/java" (Arquivo ou diretório não encontrado)
*** NSPlugin Wrapper *** ERROR: NP_Initialize() wait for reply: Message timeout
ERROR: Invalid browser function table. Some functionality may be restricted.
/usr/src/packages/BUILD/icedtea6-1.9.2/plugin/icedteanp/IcedTeaNPPlugin.cc:1506: thread 0x8090738: Error: Failed to spawn applet viewer: Falha ao executar processo filho "/etc/alternatives/../../bin/java" (Arquivo ou diretório não encontrado)
gilberto@dhcppc0:~&gt; firefox -g
Gtk-Message: (for origin information, set GTK_DEBUG): failed to retrieve property `GtkTreeView::odd-row-color'</span> of <span style="color: #7a0874; font-weight: bold;">type</span> <span style="color: #000000; font-weight: bold;">`</span>GdkColor<span style="color: #ff0000;">' from rc file value "((GString*) 0xb1f11100)" of type `GString'</span>
<span style="color: #000000; font-weight: bold;">***</span> nss-shared-helper: Shared database disabled <span style="color: #7a0874; font-weight: bold;">&#40;</span><span style="color: #000000; font-weight: bold;">set</span> NSS_USE_SHARED_DB to <span style="color: #7a0874; font-weight: bold;">enable</span><span style="color: #7a0874; font-weight: bold;">&#41;</span>.
ERROR: Invalid browser <span style="color: #000000; font-weight: bold;">function</span> table. Some functionality may be restricted.
<span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>src<span style="color: #000000; font-weight: bold;">/</span>packages<span style="color: #000000; font-weight: bold;">/</span>BUILD<span style="color: #000000; font-weight: bold;">/</span>icedtea6-1.9.2<span style="color: #000000; font-weight: bold;">/</span>plugin<span style="color: #000000; font-weight: bold;">/</span>icedteanp<span style="color: #000000; font-weight: bold;">/</span>IcedTeaNPPlugin.cc:<span style="color: #000000;">1506</span>: thread 0x8090738: Error: Failed to spawn applet viewer: Falha ao executar processo filho <span style="color: #ff0000;">"/etc/alternatives/../../bin/java"</span> <span style="color: #7a0874; font-weight: bold;">&#40;</span>Arquivo ou diretório não encontrado<span style="color: #7a0874; font-weight: bold;">&#41;</span>
ERROR: Invalid browser <span style="color: #000000; font-weight: bold;">function</span> table. Some functionality may be restricted.
<span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>src<span style="color: #000000; font-weight: bold;">/</span>packages<span style="color: #000000; font-weight: bold;">/</span>BUILD<span style="color: #000000; font-weight: bold;">/</span>icedtea6-1.9.2<span style="color: #000000; font-weight: bold;">/</span>plugin<span style="color: #000000; font-weight: bold;">/</span>icedteanp<span style="color: #000000; font-weight: bold;">/</span>IcedTeaNPPlugin.cc:<span style="color: #000000;">1506</span>: thread 0x8090738: Error: Failed to spawn applet viewer: Falha ao executar processo filho <span style="color: #ff0000;">"/etc/alternatives/../../bin/java"</span> <span style="color: #7a0874; font-weight: bold;">&#40;</span>Arquivo ou diretório não encontrado<span style="color: #7a0874; font-weight: bold;">&#41;</span></pre>
      </td>
    </tr>
  </table>
</div></p> 

Quando constatei o problema, utilizei o [update-alternatives][5] para alternar a versão da máquina virtual java:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="bash" style="font-family:monospace;">gilberto<span style="color: #000000; font-weight: bold;">@</span>dhcppc0:~<span style="color: #000000; font-weight: bold;">&gt;</span> <span style="color: #c20cb9; font-weight: bold;">su</span> -
Senha:
dhcppc0:~ <span style="color: #666666; font-style: italic;"># update-alternatives --config javaplugin</span>
&nbsp;
There are <span style="color: #000000;">2</span> alternatives <span style="color: #c20cb9; font-weight: bold;">which</span> provide <span style="color: #000000; font-weight: bold;">`</span>javaplugin<span style="color: #ff0000;">'.
&nbsp;
  Selection    Alternative
-----------------------------------------------
 +        1    /usr/lib/jvm/jre-1.6.0-openjdk/lib/i386/IcedTeaPlugin.so
*         2    /usr/lib/jvm/java-1.6.0-sun-1.6.0/jre/lib/i386/libnpjp2.so
&nbsp;
Press enter to keep the default[*], or type selection number: 
dhcppc0:~ #</span></pre>
      </td>
    </tr>
  </table>
</div></p> 

Outra solução, caso você só tenha uma versão instalada, se encontra [nesta discussão][6], pelo comentário do usuário nwrickert. 

**ATUALIZAÇÃO:** esqueci-me de mencionar que está estação de trabalho é a de minha casa e que hoje fazem 60 dias que instalei o OpenSuSe 11.3. Por que está nota? Porque os usuários do Windows XP &#8211; minha esposa e meu filho(9 anos) &#8211; adoraram a mudança!

<!-- google_ad_section_end -->

 [1]: http://blog.gilbertoca.com/?p=383
 [2]: http://www.opensuse.org/pt-br/
 [3]: http://www.oracle.com/technetwork/java/javase/downloads/index.html
 [4]: http://www.oracle.com/technetwork/java/index.html
 [5]: http://transit.iut2.upmf-grenoble.fr/cgi-bin/man/man2html?8+update-alternatives
 [6]: http://www.dslreports.com/forum/r24716562-suse-update-broke-java
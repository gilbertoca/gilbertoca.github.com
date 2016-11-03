id=875
title=Alterne entre versões Java facilmente [update-alternatives] parte 2 
date=2012-03-26 18:32:28
type=post
status=published
tags=Banco do Brasil, Chromium,  Internet, Java, Linux, openSUSE, update-alternatives
~~~~~~


A um tempo atrás escrevi sobre o <a href="http://linux.die.net/man/8/update-alternatives" title="update-alternatives" target="_blank">utilitário de sistema update-alternatives</a> e mostrei <a href="http://blog.gilbertoca.com/?p=383" title="Alterne entre versões Java facilmente [update-alternatives]" target="_blank">como alternar entre versões do Java usando o mesmo</a>. Naquele mesmo post mostrei que o Java já havia sido instalado e configurado pelo sistema de gerenciamento de pacotes pre-definido - <a href="http://en.openSUSE.org/YaST_Software_Management" title="Yast" target="_blank">Yast</a>. Como já é de conhecimento de alguns a <a href="http://www.oracle.com" title="oracle" target="_blank">Oracle</a> mudou a <a href="http://www.hardware.com.br/noticias/2011-08/java-licenca-linux.html" title="mudança de licença Java" target="_blank">forma de licenciamento do Java</a> e com isso a maioria das distribuições - senão todas - optaram por retirar o Java distribuído pela Oracle de seus repositórios. Com isso, se você precisar instalar a versão Java da Oracle terá que fazê-la manualmente. 

Antes de começar, quero notificar aos usuários do navegador Chromium que como eles tive dificuldades, no início, para fazê-lo funcionar com Java ao acessar o site do Banco do Brasil. Para confirmar este problema é só fazer uma pesquisa no Google usando a seguinte sentença: <a href="https://www.google.com.br/search?sourceid:chrome&#038;ie=UTF-8&#038;q=chromium+banco+do+brasil" title="chromium banco do brasil" target="_blank">chromium banco do brasil</a>. Então para a felicidade geral nação “chromiumana”, relato que esta maneira manual aqui demonstrada soluciona este pequeno problema. 

Então vamos lá!  
Os passos são esses:

  * Baixe a versão RPM do <a href="http://www.oracle.com/technetwork/java/javase/downloads/index.html" title="oracle java" target="_blank">site da Oracle</a> - baixei a versão jre-7u3-linux-i586.rpm;
  * Instale o jre com yast2, zypper, ou com um duplo clique no rpm pelo dolphin ou nautilus: <div class="wp_syntax">
      <table>
        <tr>
          <td class="code">
            <pre class="bash" style="font-family:monospace;">SUGEP265338:~ <span style="color: #666666; font-style: italic;"># zypper in jre-7u3-linux-i586.rpm</span></pre>
          </td>
        </tr>
      </table>
    </div>

  * Agora precisamos adicionar esta instalação às alternativas já instaladas, de forma a disponibilizá-la como uma opção: <div class="wp_syntax">
      <table>
        <tr>
          <td class="code">
            <pre class="bash" style="font-family:monospace;">SUGEP265338:~ <span style="color: #666666; font-style: italic;"># update-alternatives --install /usr/bin/java java /usr/java/jre1.7.0_03/bin/java 40</span></pre>
          </td>
        </tr>
      </table>
    </div>

  * Faremos o mesmo para o plugin java. Esta opção é muito importante pois estabelece qual versão Java para navegação web estaremos usando: <div class="wp_syntax">
      <table>
        <tr>
          <td class="code">
            <pre class="bash" style="font-family:monospace;">SUGEP265338:~ <span style="color: #666666; font-style: italic;"># update-alternatives --install /usr/lib/browser-plugins/javaplugin.so javaplugin /usr/java/jre1.7.0_03/lib/i386/libnpjp2.so 40</span></pre>
          </td>
        </tr>
      </table>
    </div>

  * Bom, agora vem a parte mais fácil que é, como escrevi no primeiro post, alternar entre tais versões: <div class="wp_syntax">
      <table>
        <tr>
          <td class="code">
            <pre class="bash" style="font-family:monospace;">SUGEP265338:~ <span style="color: #666666; font-style: italic;"># update-alternatives --config java</span>
There are <span style="color: #000000;">2</span> choices <span style="color: #000000; font-weight: bold;">for</span> the alternative java <span style="color: #7a0874; font-weight: bold;">&#40;</span>providing <span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>bin<span style="color: #000000; font-weight: bold;">/</span>java<span style="color: #7a0874; font-weight: bold;">&#41;</span>.
&nbsp;
  Selection    Path                                     Priority   Status
<span style="color: #660033;">------------------------------------------------------------</span>
<span style="color: #000000; font-weight: bold;">*</span> <span style="color: #000000;"></span>            <span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>lib<span style="color: #000000; font-weight: bold;">/</span>jvm<span style="color: #000000; font-weight: bold;">/</span>jre-1.6.0-openjdk<span style="color: #000000; font-weight: bold;">/</span>bin<span style="color: #000000; font-weight: bold;">/</span>java   <span style="color: #000000;">17105</span>     auto mode
  <span style="color: #000000;">1</span>            <span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>java<span style="color: #000000; font-weight: bold;">/</span>jre1.7.0_03<span style="color: #000000; font-weight: bold;">/</span>bin<span style="color: #000000; font-weight: bold;">/</span>java            <span style="color: #000000;">40</span>        manual mode
  <span style="color: #000000;">2</span>            <span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>lib<span style="color: #000000; font-weight: bold;">/</span>jvm<span style="color: #000000; font-weight: bold;">/</span>jre-1.6.0-openjdk<span style="color: #000000; font-weight: bold;">/</span>bin<span style="color: #000000; font-weight: bold;">/</span>java   <span style="color: #000000;">17105</span>     manual mode
&nbsp;
Press enter to keep the current choice<span style="color: #7a0874; font-weight: bold;">&#91;</span><span style="color: #000000; font-weight: bold;">*</span><span style="color: #7a0874; font-weight: bold;">&#93;</span>, or <span style="color: #7a0874; font-weight: bold;">type</span> selection number: <span style="color: #000000;">1</span>
update-alternatives: using <span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>java<span style="color: #000000; font-weight: bold;">/</span>jre1.7.0_03<span style="color: #000000; font-weight: bold;">/</span>bin<span style="color: #000000; font-weight: bold;">/</span>java to provide <span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>bin<span style="color: #000000; font-weight: bold;">/</span>java <span style="color: #7a0874; font-weight: bold;">&#40;</span>java<span style="color: #7a0874; font-weight: bold;">&#41;</span> <span style="color: #000000; font-weight: bold;">in</span> manual mode.
SUGEP265338:~ <span style="color: #666666; font-style: italic;">#</span></pre>
          </td>
        </tr>
      </table>
    </div>

  * E finalmente, o mais importante, o plugin para os navegadores web: <div class="wp_syntax">
      <table>
        <tr>
          <td class="code">
            <pre class="bash" style="font-family:monospace;">SUGEP265338:~ <span style="color: #666666; font-style: italic;"># update-alternatives --config javaplugin</span>
There are <span style="color: #000000;">2</span> choices <span style="color: #000000; font-weight: bold;">for</span> the alternative javaplugin <span style="color: #7a0874; font-weight: bold;">&#40;</span>providing <span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>lib<span style="color: #000000; font-weight: bold;">/</span>browser-plugins<span style="color: #000000; font-weight: bold;">/</span>javaplugin.so<span style="color: #7a0874; font-weight: bold;">&#41;</span>.
&nbsp;
  Selection    Path                                        Priority   Status
<span style="color: #660033;">------------------------------------------------------------</span>
<span style="color: #000000; font-weight: bold;">*</span> <span style="color: #000000;"></span>            <span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>lib<span style="color: #000000; font-weight: bold;">/</span>IcedTeaPlugin.so                    <span style="color: #000000;">17106</span>     auto mode
  <span style="color: #000000;">1</span>            <span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>java<span style="color: #000000; font-weight: bold;">/</span>jre1.7.0_03<span style="color: #000000; font-weight: bold;">/</span>lib<span style="color: #000000; font-weight: bold;">/</span>i386<span style="color: #000000; font-weight: bold;">/</span>libnpjp2.so   <span style="color: #000000;">40</span>        manual mode
  <span style="color: #000000;">2</span>            <span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>lib<span style="color: #000000; font-weight: bold;">/</span>IcedTeaPlugin.so                    <span style="color: #000000;">17106</span>     manual mode
&nbsp;
Press enter to keep the current choice<span style="color: #7a0874; font-weight: bold;">&#91;</span><span style="color: #000000; font-weight: bold;">*</span><span style="color: #7a0874; font-weight: bold;">&#93;</span>, or <span style="color: #7a0874; font-weight: bold;">type</span> selection number: <span style="color: #000000;">1</span>
update-alternatives: using <span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>java<span style="color: #000000; font-weight: bold;">/</span>jre1.7.0_03<span style="color: #000000; font-weight: bold;">/</span>lib<span style="color: #000000; font-weight: bold;">/</span>i386<span style="color: #000000; font-weight: bold;">/</span>libnpjp2.so to provide <span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>lib<span style="color: #000000; font-weight: bold;">/</span>browser-plugins<span style="color: #000000; font-weight: bold;">/</span>javaplugin.so <span style="color: #7a0874; font-weight: bold;">&#40;</span>javaplugin<span style="color: #7a0874; font-weight: bold;">&#41;</span> <span style="color: #000000; font-weight: bold;">in</span> manual mode.
SUGEP265338:~ <span style="color: #666666; font-style: italic;">#</span></pre>
          </td>
        </tr>
      </table>
    </div>

Pronto! Feche o navegador e faça um teste. Até a próxima! 

**Atualização(12/07/2012):** Hoje pela manhã, <a href="https://www.google.com.br/search?q:update-alternatives+for+jdk+7&#038;ie=utf-8&#038;oe=utf-8&#038;aq=t&#038;rls=org.mozilla:pt-BR:official&#038;client=firefox-a" title="script for registering JDK7 to update-alternatives" target="_blank">procurando por mudanças que torne o script</a> update-alternatives compatível com o jdk 1.7, me <a href="http://odoepner.wordpress.com/2011/10/02/install-jdk7-on-openSUSE/" title="Install JDK7 on openSUSE" target="_blank">deparei com uma forma bem mais simples de instalar manualmente o jdk</a> Oracle. Veja:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="bash" style="font-family:monospace;">&nbsp;
zypper <span style="color: #c20cb9; font-weight: bold;">install</span> jdk-<span style="color: #000000;">7</span>-linux-x64.rpm
<span style="color: #7a0874; font-weight: bold;">cd</span> <span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>java<span style="color: #000000; font-weight: bold;">/</span>jdk1.7.0<span style="color: #000000; font-weight: bold;">/</span>bin
<span style="color: #000000; font-weight: bold;">for</span> bin <span style="color: #000000; font-weight: bold;">in</span> <span style="color: #000000; font-weight: bold;">*</span>; <span style="color: #000000; font-weight: bold;">do</span> update-alternatives <span style="color: #660033;">--install</span> <span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>bin<span style="color: #000000; font-weight: bold;">/</span><span style="color: #007800;">$bin</span> <span style="color: #007800;">$bin</span> $<span style="color: #7a0874; font-weight: bold;">&#40;</span><span style="color: #7a0874; font-weight: bold;">pwd</span><span style="color: #7a0874; font-weight: bold;">&#41;</span><span style="color: #000000; font-weight: bold;">/</span><span style="color: #007800;">$bin</span> <span style="color: #000000;">20000</span>; <span style="color: #000000; font-weight: bold;">done</span></pre>
      </td>
    </tr>
  </table>
</div>

Agora o javaplugin para o navegador:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="bash" style="font-family:monospace;">update-alternatives <span style="color: #660033;">--install</span> <span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>lib64<span style="color: #000000; font-weight: bold;">/</span>browser-plugins<span style="color: #000000; font-weight: bold;">/</span>javaplugin.so javaplugin <span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>java<span style="color: #000000; font-weight: bold;">/</span>jdk1.7.0<span style="color: #000000; font-weight: bold;">/</span>jre<span style="color: #000000; font-weight: bold;">/</span>lib<span style="color: #000000; font-weight: bold;">/</span>amd64<span style="color: #000000; font-weight: bold;">/</span>libnpjp2.so <span style="color: #000000;">20000</span></pre>
      </td>
    </tr>
  </table>
</div></p> 

Usei a versão 64bits mas o procedimento vale também para 32bits.


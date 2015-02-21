title=Oracle JDK8 no OpenSUSE
date=2014-07-02 14:31:06
type=post
status=published
tags=Geral, Java, Linux, Sistema Operacional, Unix
~~~~~~
<!-- google_ad_section_start -->

Esta forma de instalação é mais resumida que a do <a href="http://blog.gilbertoca.com/?p:971" title="Instale Oracle JDK7 no openSUSE" target="_blank">post antigo</a> e utiliza o formato comprimido (tar.gz). 

Realize o download a partir deste local: <a href="http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html" title:"Java SE Development Kit 8 Downloads" target="_blank">Java SE Development Kit 8 Downloads</a>, em um diretório de sua escolha &#8211; escolhi: Downloads. 

Depois como super usuário (root) pelo <a href="http://kde.org/applications/system/konsole/" title:"Kconsole" target="_blank">Kconsole</a> faça uso da seguinte sequência:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="bash" style="font-family:monospace;">gilberto.andrade<span style="color: #000000; font-weight: bold;">@</span>A37710:~$ <span style="color: #c20cb9; font-weight: bold;">su</span> -
Senha:
A37710:~ 
A37710:~ <span style="color: #7a0874; font-weight: bold;">cd</span> <span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>java
A37710:~ <span style="color: #c20cb9; font-weight: bold;">tar</span> xvf ~<span style="color: #000000; font-weight: bold;">/</span>Downloads<span style="color: #000000; font-weight: bold;">/</span>jdk-8u5-linux-x64.tar.gz
A37710:~ <span style="color: #c20cb9; font-weight: bold;">chown</span> <span style="color: #660033;">-R</span> root:root jdk1.8.0_05
A37710:~ <span style="color: #c20cb9; font-weight: bold;">rm</span> latest
A37710:~ <span style="color: #c20cb9; font-weight: bold;">ln</span> <span style="color: #660033;">-s</span> <span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>java<span style="color: #000000; font-weight: bold;">/</span>jdk1.8.0_05 <span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>java<span style="color: #000000; font-weight: bold;">/</span>latest
A37710:~ <span style="color: #7a0874; font-weight: bold;">cd</span> latest<span style="color: #000000; font-weight: bold;">/</span>bin
A37710:~ <span style="color: #000000; font-weight: bold;">for</span> bin <span style="color: #000000; font-weight: bold;">in</span> <span style="color: #000000; font-weight: bold;">*</span>; <span style="color: #000000; font-weight: bold;">do</span> update-alternatives <span style="color: #660033;">--install</span> <span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>bin<span style="color: #000000; font-weight: bold;">/</span><span style="color: #007800;">$bin</span> <span style="color: #007800;">$bin</span> $<span style="color: #7a0874; font-weight: bold;">&#40;</span><span style="color: #7a0874; font-weight: bold;">pwd</span><span style="color: #7a0874; font-weight: bold;">&#41;</span><span style="color: #000000; font-weight: bold;">/</span><span style="color: #007800;">$bin</span> <span style="color: #000000;">1</span>; <span style="color: #000000; font-weight: bold;">done</span>
A37710:~ <span style="color: #7a0874; font-weight: bold;">cd</span> ..
A37710:~ <span style="color: #7a0874; font-weight: bold;">cd</span> latest<span style="color: #000000; font-weight: bold;">/</span>jre<span style="color: #000000; font-weight: bold;">/</span>bin
A37710:~ <span style="color: #000000; font-weight: bold;">for</span> bin <span style="color: #000000; font-weight: bold;">in</span> <span style="color: #000000; font-weight: bold;">*</span>; <span style="color: #000000; font-weight: bold;">do</span> update-alternatives <span style="color: #660033;">--install</span> <span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>bin<span style="color: #000000; font-weight: bold;">/</span><span style="color: #007800;">$bin</span> <span style="color: #007800;">$bin</span> $<span style="color: #7a0874; font-weight: bold;">&#40;</span><span style="color: #7a0874; font-weight: bold;">pwd</span><span style="color: #7a0874; font-weight: bold;">&#41;</span><span style="color: #000000; font-weight: bold;">/</span><span style="color: #007800;">$bin</span> <span style="color: #000000;">1</span>; <span style="color: #000000; font-weight: bold;">done</span>
A37710:~ <span style="color: #7a0874; font-weight: bold;">cd</span> ..
A37710:~ <span style="color: #7a0874; font-weight: bold;">cd</span> ..
A37710:~ update-alternatives <span style="color: #660033;">--install</span> <span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>lib64<span style="color: #000000; font-weight: bold;">/</span>browser-plugins<span style="color: #000000; font-weight: bold;">/</span>javaplugin.so javaplugin <span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>java<span style="color: #000000; font-weight: bold;">/</span>latest<span style="color: #000000; font-weight: bold;">/</span>jre<span style="color: #000000; font-weight: bold;">/</span>lib<span style="color: #000000; font-weight: bold;">/</span>amd64<span style="color: #000000; font-weight: bold;">/</span>libnpjp2.so <span style="color: #000000;">1</span>
A37710:~ update-alternatives <span style="color: #660033;">--config</span> java
A37710:~ update-alternatives <span style="color: #660033;">--config</span> javac
A37710:~ update-alternatives <span style="color: #660033;">--config</span> javaplugin
A37710:~</pre>
      </td>
    </tr>
  </table>
</div>

<!-- google_ad_section_end -->
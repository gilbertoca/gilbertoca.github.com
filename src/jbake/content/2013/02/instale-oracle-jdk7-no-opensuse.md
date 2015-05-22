id=971
title=Instale Oracle JDK7 no openSUSE
date=2013-02-21 15:49:09
type=post
status=published
tags= Java, Linux, openSUSE
~~~~~~


Realize o download a partir deste local: <a href="http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html" title="Java SE Development Kit 7 Downloads" target="_blank">Java SE Development Kit 7 Downloads</a>, em um diretório de sua escolha - escolhi: /Softwares_usados/Tools/java/jdk/ . 

Depois como super usuário (root) utilize <a href="http://doc.openSUSE.org/documentation/html/openSUSE/openSUSE-startup/cha.sw_cl.html" title="Ferramenta de Gerenciamento de Software - Zypper" target="_blank">a Ferramente de Gerencimanto de Software - Zypper -</a> para instalar o pacote (arquivo RPM):

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="bash" style="font-family:monospace;">gilberto.andrade<span style="color: #000000; font-weight: bold;">@</span>A37710:~$ <span style="color: #c20cb9; font-weight: bold;">su</span> -
Senha:
A37710:~ <span style="color: #666666; font-style: italic;"># cd /dados/D/Softwares_usados/Tools/java/jdk/</span>
A37710:<span style="color: #000000; font-weight: bold;">/</span>dados<span style="color: #000000; font-weight: bold;">/</span>D<span style="color: #000000; font-weight: bold;">/</span>Softwares_usados<span style="color: #000000; font-weight: bold;">/</span>Tools<span style="color: #000000; font-weight: bold;">/</span>java<span style="color: #000000; font-weight: bold;">/</span>jdk <span style="color: #666666; font-style: italic;"># ll</span>
total <span style="color: #000000;">439208</span>
<span style="color: #660033;">-rw-r-----</span> <span style="color: #000000;">1</span> gilberto.andrade <span style="color: #c20cb9; font-weight: bold;">users</span>   <span style="color: #000000;">8405307</span> Feb <span style="color: #000000;">11</span> <span style="color: #000000;">20</span>:<span style="color: #000000;">14</span> javafx-<span style="color: #000000;">2</span>_2_7-apidocs.zip
<span style="color: #660033;">-rw-r--r--</span> <span style="color: #000000;">1</span> gilberto.andrade <span style="color: #c20cb9; font-weight: bold;">users</span>  <span style="color: #000000;">54426218</span> Oct <span style="color: #000000;">11</span> <span style="color: #000000;">15</span>:<span style="color: #000000;">12</span> javafx_scenebuilder-<span style="color: #000000;">1</span>_1-beta-linux-x64.tar.gz
<span style="color: #660033;">-rw-r--r--</span> <span style="color: #000000;">1</span> gilberto.andrade <span style="color: #c20cb9; font-weight: bold;">users</span> <span style="color: #000000;">216263278</span> Jun <span style="color: #000000;">13</span>  <span style="color: #000000;">2012</span> javatutorials.zip
<span style="color: #660033;">-rw-r-----</span> <span style="color: #000000;">1</span> gilberto.andrade <span style="color: #c20cb9; font-weight: bold;">users</span>  <span style="color: #000000;">60768483</span> Feb <span style="color: #000000;">11</span> <span style="color: #000000;">18</span>:<span style="color: #000000;">10</span> jdk-7u15-apidocs.zip
<span style="color: #660033;">-rw-r-----</span> <span style="color: #000000;">1</span> gilberto.andrade <span style="color: #c20cb9; font-weight: bold;">users</span> <span style="color: #000000;">109860709</span> Feb <span style="color: #000000;">16</span> 04:08 jdk-7u15-linux-x64.rpm
&nbsp;
A37710:<span style="color: #000000; font-weight: bold;">/</span>dados<span style="color: #000000; font-weight: bold;">/</span>D<span style="color: #000000; font-weight: bold;">/</span>Softwares_usados<span style="color: #000000; font-weight: bold;">/</span>Tools<span style="color: #000000; font-weight: bold;">/</span>java<span style="color: #000000; font-weight: bold;">/</span>jdk <span style="color: #666666; font-style: italic;"># zypper install jdk-7u15-linux-x64.rpm</span></pre>
      </td>
    </tr>
  </table>
</div></p> 

Vamos “avisar” o mecanismo do sistema que é responsável por estes serviços - <a href="http://blog.gilbertoca.com/?p:875" title="Alterne entre versões Java facilmente [update-alternatives] parte 2" target="_blank">update-alternatives</a>- que existe uma nova versão do jdk instalada. O diretório (melhor dizendo, link) **/usr/java/latest** representa a versão mais recente instalada e irá apontar para última e mais nova versão:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="bash" style="font-family:monospace;">A37710:<span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>java <span style="color: #666666; font-style: italic;"># ll</span>
total <span style="color: #000000;">12</span>
lrwxrwxrwx <span style="color: #000000;">1</span> root root   <span style="color: #000000;">16</span> Feb <span style="color: #000000;">15</span> <span style="color: #000000;">16</span>:09 default -<span style="color: #000000; font-weight: bold;">&gt;</span> <span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>java<span style="color: #000000; font-weight: bold;">/</span>latest
drwxr-xr-x <span style="color: #000000;">4</span> root root <span style="color: #000000;">4096</span> Feb <span style="color: #000000;">15</span> <span style="color: #000000;">15</span>:<span style="color: #000000;">13</span> jdk1.7.0_07
drwxr-xr-x <span style="color: #000000;">3</span> root root <span style="color: #000000;">4096</span> Feb <span style="color: #000000;">21</span> <span style="color: #000000;">14</span>:<span style="color: #000000;">36</span> jdk1.7.0_13
drwxr-xr-x <span style="color: #000000;">8</span> root root <span style="color: #000000;">4096</span> Feb <span style="color: #000000;">21</span> <span style="color: #000000;">14</span>:<span style="color: #000000;">36</span> jdk1.7.0_15
lrwxrwxrwx <span style="color: #000000;">1</span> root root   <span style="color: #000000;">21</span> Feb <span style="color: #000000;">21</span> <span style="color: #000000;">14</span>:<span style="color: #000000;">36</span> latest -<span style="color: #000000; font-weight: bold;">&gt;</span> <span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>java<span style="color: #000000; font-weight: bold;">/</span>jdk1.7.0_15</pre>
      </td>
    </tr>
  </table>
</div></p> 

A partir do diretório **latest/bin** e **latest/jre/bin** realize as seguintes modificações:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="bash" style="font-family:monospace;">A37710:<span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>java <span style="color: #666666; font-style: italic;"># cd latest/bin/</span>
A37710:<span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>java<span style="color: #000000; font-weight: bold;">/</span>latest<span style="color: #000000; font-weight: bold;">/</span>bin <span style="color: #666666; font-style: italic;"># for bin in *; do update-alternatives --install /usr/bin/$bin $bin $(pwd)/$bin 20000; done</span>
A37710:<span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>java<span style="color: #000000; font-weight: bold;">/</span>latest<span style="color: #000000; font-weight: bold;">/</span>bin <span style="color: #666666; font-style: italic;"># cd ..</span>
A37710:<span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>java<span style="color: #000000; font-weight: bold;">/</span>latest <span style="color: #666666; font-style: italic;"># cd jre/bin/</span>
A37710:<span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>java<span style="color: #000000; font-weight: bold;">/</span>latest<span style="color: #000000; font-weight: bold;">/</span>jre<span style="color: #000000; font-weight: bold;">/</span>bin <span style="color: #666666; font-style: italic;"># for bin in *; do update-alternatives --install /usr/bin/$bin $bin $(pwd)/$bin 20000; done</span>
A37710:<span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>java<span style="color: #000000; font-weight: bold;">/</span>latest<span style="color: #000000; font-weight: bold;">/</span>jre<span style="color: #000000; font-weight: bold;">/</span>bin <span style="color: #666666; font-style: italic;">#</span></pre>
      </td>
    </tr>
  </table>
</div></p> 

Por fim, atualizaremos o **plugin java - javaplugin.so -** para os navegadores instalados no sistema:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="bash" style="font-family:monospace;">update-alternatives <span style="color: #660033;">--install</span> <span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>lib64<span style="color: #000000; font-weight: bold;">/</span>browser-plugins<span style="color: #000000; font-weight: bold;">/</span>javaplugin.so javaplugin <span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>java<span style="color: #000000; font-weight: bold;">/</span>latest<span style="color: #000000; font-weight: bold;">/</span>jre<span style="color: #000000; font-weight: bold;">/</span>lib<span style="color: #000000; font-weight: bold;">/</span>amd64<span style="color: #000000; font-weight: bold;">/</span>libnpjp2.so <span style="color: #000000;">20000</span></pre>
      </td>
    </tr>
  </table>
</div>

Olhe com atenção pois utilizamos como referência para atualizar o update-alternatives o caminho base **/usr/java/latest**.  
**Por quê? Você sabe explicar?**


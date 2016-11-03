id=971
title=Instale Oracle JDK7 no openSUSE
date=2013-02-21 15:49:09
type=post
status=published
tags= Java, Linux, openSUSE
~~~~~~


Realize o download a partir deste local: <a href="http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html" title="Java SE Development Kit 7 Downloads" target="_blank">Java SE Development Kit 7 Downloads</a>, em um diretório de sua escolha - escolhi: /Softwares_usados/Tools/java/jdk/ . 

Depois como super usuário (root) utilize <a href="http://doc.openSUSE.org/documentation/html/openSUSE/openSUSE-startup/cha.sw_cl.html" title="Ferramenta de Gerenciamento de Software - Zypper" target="_blank">a Ferramente de Gerencimanto de Software - Zypper -</a> para instalar o pacote (arquivo RPM):

```Shell
gilberto.andrade@A37710:~$ su - Senha
A37710:~ # cd /dados/D/Softwares_usados/Tools/java/jdk/ 
A37710:/dados/D/Softwares_usados/Tools/java/jdk # ll 
total 439208 
-rw-r----- 1 gilberto.andrade users 8405307 Feb 11 20:14 javafx-2_2_7-apidocs.zip 
-rw-r--r-- 1 gilberto.andrade users 54426218 Oct 11 15:12 javafx_scenebuilder-1_1-beta-linux-x64.tar.gz 
-rw-r--r-- 1 gilberto.andrade users 216263278 Jun 13 2012 javatutorials.zip 
-rw-r----- 1 gilberto.andrade users 60768483 Feb 11 18:10 jdk-7u15-apidocs.zip 
-rw-r----- 1 gilberto.andrade users 109860709 Feb 16 04:08 jdk-7u15-linux-x64.rpm   
A37710:/dados/D/Softwares_usados/Tools/java/jdk # zypper install jdk-7u15-linux-x64.rpm
```
Vamos “avisar” o mecanismo do sistema que é responsável por estes serviços - <a href="/2012/03/alterne-entre-versoes-java-facilmente-update-alternatives-parte-2.html" title="Alterne entre versões Java facilmente [update-alternatives] parte 2" target="_blank">update-alternatives</a>- que existe uma nova versão do jdk instalada. O diretório (melhor dizendo, link) **/usr/java/latest** representa a versão mais recente instalada e irá apontar para última e mais nova versão:

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


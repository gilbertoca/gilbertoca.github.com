id=383
title=Alterne entre versões Java facilmente [update-alternatives] 
date=2010-06-08 14:50:18
type=post
status=published
tags=console,  Java, Linux, openSUSE, Sistema Operacional, Tocantins
~~~~~~


Com o surgimento de versões e atualizações da máquina virtual java, preciso verificar a compatibilidade da mesma com o [sistema de gestão de pessoal][1] sendo implantado [aqui na secretária][2]. 

> Atualizado em: 01/12/2005 16:10 - CONSAD
> 
> Tocantins faz sua apresentação em TI
> 
> As experiências inovadoras que o Tocantins tem desenvolvido em Tecnologia da Informação (TI) foram apresentadas na manhã deste primeiro dia do LX Fórum do Conselho Nacional de Secretários de Estado de Administração (Consad). O representante da superintendência de Informática do Estado, Marcos Tiago, foi o responsável pela apresentação. Nela, ele demonstrou aos presentes as redes digitais de todo o Estado, incluindo as que circundam a sede do Governo (Palácio Araguaia), e das secretarias da Administração, Fazenda e Segurança Pública.
> 
> Em relação à Secad – Secretaria da Administração, Marcos Tiago apresentou o sistema de interligação de Recursos Humanos (Ergon) que está sendo implantado; citou ainda a experiência de Educação à Distância voltada para os servidores do Estado, onde o governo acaba de capacitar mais de 28 mil servidores no curso de Excelência no Atendimento e nas Relações de Trabalho.
> 
> Fonte: Shirley Cruz / Secad 

Longo tempo hein? Pois é, nossa administração pública! Mas o Estado, nestes dois últimos anos, ficou politicamente conturbado ([Tocantins chega à maioridade em clima de convulsão e indefinição política][3]). Felizmente esta faze está passando e os projetos, aos poucos, retornam a sua normalidade. 

O sistema usa como base a tecnologia [Forms da empresa Oracle][4], que usa applet no cliente.  
Bom, primeiro precisamos instalar as versões que desejamos. Para facilitar adicione os seguintes repositórios ao [Yast][5]:

<table>
  <tr>
    <td>
      Nome
    </td>
    
    <td>
      Repositório
    </td>
    
    <tr>
      <tr>
        <td>
          Java:sun:Factory
        </td>
        
        <td>
          <a href="http://download.openSUSE.org/repositories/Java:/sun:/Factory/openSUSE_11.2/">http://download.openSUSE.org/repositories/Java:/sun:/Factory/openSUSE_11.2/</a>
        </td>
        
        <tr>
          <tr>
            <td>
              JPackages
            </td>
            
            <td>
              <a href="http://download.openSUSE.org/repositories/Java:/packages/openSUSE_11.2/">http://download.openSUSE.org/repositories/Java:/packages/openSUSE_11.2</a>
            </td>
            
            <tr>
              </table> 
              
              <p>
                Veja o que tenho em meu ambiente:<br /> <a href="yast_java_instalado.png"><img src:"yast_java_instalado.png" alt="Ambiente Java Instalado" title="yast_java_instalado" width="808" height="627" class="alignleft size-full wp-image-405" /></a>
              </p>
              
              <p>
                Agora, como alternar entre as versões sem ter que manualmente mexer em variáveis de ambiente?<br /> Qual versão estou usando?
              </p>
              
              <div class="wp_syntax">
                <table>
                  <tr>
                    <td class="code">
                      <pre class="bash" style="font-family:monospace;">gilberto<span style="color: #000000; font-weight: bold;">@</span>SUGEP-DMASI:~<span style="color: #000000; font-weight: bold;">&gt;</span> java <span style="color: #660033;">-version</span>
java version <span style="color: #ff0000;">"1.5.0_22"</span>
Java<span style="color: #7a0874; font-weight: bold;">&#40;</span>TM<span style="color: #7a0874; font-weight: bold;">&#41;</span> <span style="color: #000000;">2</span> Runtime Environment, Standard Edition <span style="color: #7a0874; font-weight: bold;">&#40;</span>build 1.5.0_22-b03<span style="color: #7a0874; font-weight: bold;">&#41;</span>
Java HotSpot<span style="color: #7a0874; font-weight: bold;">&#40;</span>TM<span style="color: #7a0874; font-weight: bold;">&#41;</span> Server VM <span style="color: #7a0874; font-weight: bold;">&#40;</span>build 1.5.0_22-b03, mixed mode<span style="color: #7a0874; font-weight: bold;">&#41;</span>
gilberto<span style="color: #000000; font-weight: bold;">@</span>SUGEP-DMASI:~<span style="color: #000000; font-weight: bold;">&gt;</span></pre>
                    </td>
                  </tr>
                </table>
              </div>
              
              <p>
                Para verificar de forma geral como o ambiente está, além da figura acima, vamos abrir um terminal como usuário root e checar através do comando <code>update-alternatives</code>:
              </p>
              
              <div class="wp_syntax">
                <table>
                  <tr>
                    <td class="code">
                      <pre class="bash" style="font-family:monospace;">gilberto<span style="color: #000000; font-weight: bold;">@</span>SUGEP-DMASI:~<span style="color: #000000; font-weight: bold;">&gt;</span> <span style="color: #c20cb9; font-weight: bold;">su</span> -
Password: 
SUGEP-DMASI:~ <span style="color: #666666; font-style: italic;"># update-alternatives --list java</span>
<span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>lib<span style="color: #000000; font-weight: bold;">/</span>jvm<span style="color: #000000; font-weight: bold;">/</span>jre-1.6.0-openjdk<span style="color: #000000; font-weight: bold;">/</span>bin<span style="color: #000000; font-weight: bold;">/</span>java
<span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>lib<span style="color: #000000; font-weight: bold;">/</span>jvm<span style="color: #000000; font-weight: bold;">/</span>jre-1.5.0-gcj<span style="color: #000000; font-weight: bold;">/</span>bin<span style="color: #000000; font-weight: bold;">/</span>java
<span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>lib<span style="color: #000000; font-weight: bold;">/</span>jvm<span style="color: #000000; font-weight: bold;">/</span>jre-1.6.0-sun<span style="color: #000000; font-weight: bold;">/</span>bin<span style="color: #000000; font-weight: bold;">/</span>java
<span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>lib<span style="color: #000000; font-weight: bold;">/</span>jvm<span style="color: #000000; font-weight: bold;">/</span>jre-1.5.0-sun<span style="color: #000000; font-weight: bold;">/</span>bin<span style="color: #000000; font-weight: bold;">/</span>java
SUGEP-DMASI:~ <span style="color: #666666; font-style: italic;"># update-alternatives --list javac</span>
<span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>lib<span style="color: #000000; font-weight: bold;">/</span>jvm<span style="color: #000000; font-weight: bold;">/</span>java-1.5.0-gcj<span style="color: #000000; font-weight: bold;">/</span>bin<span style="color: #000000; font-weight: bold;">/</span>javac
<span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>lib<span style="color: #000000; font-weight: bold;">/</span>jvm<span style="color: #000000; font-weight: bold;">/</span>java-1.6.0-openjdk<span style="color: #000000; font-weight: bold;">/</span>bin<span style="color: #000000; font-weight: bold;">/</span>javac
<span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>lib<span style="color: #000000; font-weight: bold;">/</span>jvm<span style="color: #000000; font-weight: bold;">/</span>java-1.6.0-sun<span style="color: #000000; font-weight: bold;">/</span>bin<span style="color: #000000; font-weight: bold;">/</span>javac
<span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>lib<span style="color: #000000; font-weight: bold;">/</span>jvm<span style="color: #000000; font-weight: bold;">/</span>java-1.5.0-sun<span style="color: #000000; font-weight: bold;">/</span>bin<span style="color: #000000; font-weight: bold;">/</span>javac
SUGEP-DMASI:~ <span style="color: #666666; font-style: italic;"># update-alternatives --list javapluging</span>
No alternatives <span style="color: #000000; font-weight: bold;">for</span> javapluging.
SUGEP-DMASI:~ <span style="color: #666666; font-style: italic;"># update-alternatives --list javaplugin</span>
<span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>lib<span style="color: #000000; font-weight: bold;">/</span>jvm<span style="color: #000000; font-weight: bold;">/</span>jre-1.6.0-openjdk<span style="color: #000000; font-weight: bold;">/</span>lib<span style="color: #000000; font-weight: bold;">/</span>i386<span style="color: #000000; font-weight: bold;">/</span>IcedTeaNPPlugin.so
<span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>lib<span style="color: #000000; font-weight: bold;">/</span>jvm<span style="color: #000000; font-weight: bold;">/</span>java-1.6.0-sun-1.6.0<span style="color: #000000; font-weight: bold;">/</span>jre<span style="color: #000000; font-weight: bold;">/</span>lib<span style="color: #000000; font-weight: bold;">/</span>i386<span style="color: #000000; font-weight: bold;">/</span>libnpjp2.so
<span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>lib<span style="color: #000000; font-weight: bold;">/</span>jvm<span style="color: #000000; font-weight: bold;">/</span>java-1.5.0-sun-1.5.0<span style="color: #000000; font-weight: bold;">/</span>jre<span style="color: #000000; font-weight: bold;">/</span>plugin<span style="color: #000000; font-weight: bold;">/</span>i386<span style="color: #000000; font-weight: bold;">/</span>ns7<span style="color: #000000; font-weight: bold;">/</span>libjavaplugin_oji.so
SUGEP-DMASI:~ <span style="color: #666666; font-style: italic;">#</span></pre>
                    </td>
                  </tr>
                </table>
              </div></p> 
              
              <p>
                Para saber mais sobre este comando digite:
              </p>
              
              <div class="wp_syntax">
                <table>
                  <tr>
                    <td class="code">
                      <pre class="bash" style="font-family:monospace;"><span style="color: #c20cb9; font-weight: bold;">man</span> update-alternatives</pre>
                    </td>
                  </tr>
                </table>
              </div>
              
              <p>
                Agora vamos usá-lo para alternar entre as versões. Note nas opções acima que podemos alternar não somente a máquina virtual, mas também o plugin para navegadores de internet. Então mãos a obra! Para alternar usaremos a opção <code>--config</code>:
              </p>
              
              <div class="wp_syntax">
                <table>
                  <tr>
                    <td class="code">
                      <pre class="bash" style="font-family:monospace;">SUGEP-DMASI:~ <span style="color: #666666; font-style: italic;"># update-alternatives --config java</span>
&nbsp;
There are <span style="color: #000000;">4</span> alternatives <span style="color: #c20cb9; font-weight: bold;">which</span> provide <span style="color: #000000; font-weight: bold;">`</span>java<span style="color: #ff0000;">'.
&nbsp;
  Selection    Alternative
-----------------------------------------------
 +        1    /usr/lib/jvm/jre-1.6.0-openjdk/bin/java
          2    /usr/lib/jvm/jre-1.5.0-gcj/bin/java
          3    /usr/lib/jvm/jre-1.6.0-sun/bin/java
*         4    /usr/lib/jvm/jre-1.5.0-sun/bin/java
&nbsp;
Press enter to keep the default[*], or type selection number: 3
Using '</span><span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>lib<span style="color: #000000; font-weight: bold;">/</span>jvm<span style="color: #000000; font-weight: bold;">/</span>jre-1.6.0-sun<span style="color: #000000; font-weight: bold;">/</span>bin<span style="color: #000000; font-weight: bold;">/</span>java<span style="color: #ff0000;">' to provide '</span>java<span style="color: #ff0000;">'.
SUGEP-DMASI:~ #</span></pre>
                    </td>
                  </tr>
                </table>
              </div>
              
              <p>
                Abra um novo terminal e verifique a versão atual:
              </p>
              
              <div class="wp_syntax">
                <table>
                  <tr>
                    <td class="code">
                      <pre class="bash" style="font-family:monospace;">gilberto<span style="color: #000000; font-weight: bold;">@</span>SUGEP-DMASI:~<span style="color: #000000; font-weight: bold;">&gt;</span> java <span style="color: #660033;">-version</span>
java version <span style="color: #ff0000;">"1.6.0_20"</span>
Java<span style="color: #7a0874; font-weight: bold;">&#40;</span>TM<span style="color: #7a0874; font-weight: bold;">&#41;</span> SE Runtime Environment <span style="color: #7a0874; font-weight: bold;">&#40;</span>build 1.6.0_20-b02<span style="color: #7a0874; font-weight: bold;">&#41;</span>
Java HotSpot<span style="color: #7a0874; font-weight: bold;">&#40;</span>TM<span style="color: #7a0874; font-weight: bold;">&#41;</span> Server VM <span style="color: #7a0874; font-weight: bold;">&#40;</span>build <span style="color: #000000;">16.3</span>-b01, mixed mode<span style="color: #7a0874; font-weight: bold;">&#41;</span>
You have mail <span style="color: #000000; font-weight: bold;">in</span> <span style="color: #000000; font-weight: bold;">/</span>var<span style="color: #000000; font-weight: bold;">/</span>spool<span style="color: #000000; font-weight: bold;">/</span>mail<span style="color: #000000; font-weight: bold;">/</span>gilberto
gilberto<span style="color: #000000; font-weight: bold;">@</span>SUGEP-DMASI:~<span style="color: #000000; font-weight: bold;">&gt;</span></pre>
                    </td>
                  </tr>
                </table>
              </div></p> 
              
              <p>
                Podemos usar o utilitário <code>update-alternatives</code> para gerenciar outros links no sistema, mas o post já ficou extenso. Na próxima podemos mostrar como gerenciar links manualmente.
              </p>
              
              

 [1]: http://www.techne.com.br/produtos/produtos.asp?id=4
 [2]: http://www.secad.to.gov.br
 [3]: http://www.portalct.com.br/n/61036301f280e5de0acb74eeebc8e948/to-chega-a-maioridade-em-clima-de-convulsao-e-inde/
 [4]: www.oracle.com/technology/products/forms
 [5]: http://en.openSUSE.org/Yast
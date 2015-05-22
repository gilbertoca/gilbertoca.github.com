id=424
title=Renomear um projeto[SUBVERSION] 
date=2010-07-19 12:55:31
type=post
status=published
tags=controle de versões, desenvolvimento,  Java, Linux, Sistema Operacional, subversion
~~~~~~


Em nossa área de tecnologia da informação é comum o desgaste em discussões para nomear objetos, recursos, projetos, etc, sem falar em nossa imaginação para o assunto. Devo confessar, somos ímpares nesse quesito! <img src="http://blog.gilbertoca.com/wp-includes/images/smilies/icon_smile.gif" alt=":)" class="wp-smiley" /> 

Hoje, por uma necessidade tive que renomear um “projeto” (antigo módulo em cvs) em um repositório svn hospedado no Google Project Hosting. Para fazer a mudança você necessita fazer o chekout do “projeto” - coloco entre aspas, pois o mesmo é considerado como um diretório - em uma área de trabalho primeiro. Veja como é o procedimento:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="bash" style="font-family:monospace;"><span style="color: #7a0874; font-weight: bold;">cd</span> gilberto<span style="color: #000000; font-weight: bold;">@</span>SUGEP-DMASI:~<span style="color: #000000; font-weight: bold;">/</span>dev<span style="color: #000000; font-weight: bold;">/</span>netbeans-config<span style="color: #000000; font-weight: bold;">/</span>click-jpa-integration
<span style="color: #c20cb9; font-weight: bold;">svn rename</span> https:<span style="color: #000000; font-weight: bold;">//</span>osu.googlecode.com<span style="color: #000000; font-weight: bold;">/</span>svn<span style="color: #000000; font-weight: bold;">/</span>trunk<span style="color: #000000; font-weight: bold;">/</span>click-jpa-integration https:<span style="color: #000000; font-weight: bold;">//</span>osu.googlecode.com<span style="color: #000000; font-weight: bold;">/</span>svn<span style="color: #000000; font-weight: bold;">/</span>trunk<span style="color: #000000; font-weight: bold;">/</span>click-orm-integration
<span style="color: #7a0874; font-weight: bold;">cd</span> ..
<span style="color: #c20cb9; font-weight: bold;">rm</span> <span style="color: #660033;">-rf</span> click-jpa-integration
<span style="color: #c20cb9; font-weight: bold;">svn checkout</span> http:<span style="color: #000000; font-weight: bold;">//</span>osu.googlecode.com<span style="color: #000000; font-weight: bold;">/</span>svn<span style="color: #000000; font-weight: bold;">/</span>trunk<span style="color: #000000; font-weight: bold;">/</span>click-orm-integration coi
<span style="color: #7a0874; font-weight: bold;">cd</span> coi</pre>
      </td>
    </tr>
  </table>
</div></p> 

> **Atualização(07/03/2012):**  
> Uma correção, com este comando (rename=move) temos a opção de mover e/ou renomear alguma coisa em uma área de trabalho local ou no próprio repositório(remoto por uma URL).  
> Veja como ficaria comando usando URL:
> 
> <div class="wp_syntax">
>   <table>
>     <tr>
>       <td class="code">
>         <pre class="bash" style="font-family:monospace;"><span style="color: #c20cb9; font-weight: bold;">svn move</span> http:<span style="color: #000000; font-weight: bold;">//</span>10.121.0.5<span style="color: #000000; font-weight: bold;">/</span>svn<span style="color: #000000; font-weight: bold;">/</span>gcs http:<span style="color: #000000; font-weight: bold;">//</span>10.121.0.5<span style="color: #000000; font-weight: bold;">/</span>svn<span style="color: #000000; font-weight: bold;">/</span>opencms</pre>
>       </td>
>     </tr>
>   </table>
> </div>


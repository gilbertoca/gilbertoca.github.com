id=712
title=Herança de Projeto vs Agregação de Projeto
date=2011-06-15 17:52:47
type=post
status=published
tags=Java, maven
~~~~~~


**[Requisito][1]:** The packaging type required to be pom for parent and aggregation (multi-module) projects.  
**Tradução: **para que você possa criar ou transformar um projeto em um que seja pai (PARENT) ou agregação (AGGREGATION), necessita-se definir seu empacotamento (PACKING) para pom, [assim][2]:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="xml" style="font-family:monospace;">    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;modelVersion<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>4.0.0<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/modelVersion<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;groupId<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>com.google.constructor<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/groupId<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;artifactId<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>park-samples<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/artifactId<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
    <span style="color: #808080; font-style: italic;">&lt;!--The packaging type required to be pom for parent and aggregation (multi-module) projects.--&gt;</span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;packaging<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>pom<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/packaging<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;version<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>1.0-SNAPSHOT<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/version<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;name<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>Apache Click Park Samples Project<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/name<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;url<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>http://code.google.com/p/construtor<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/url<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;description<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
        A parent POM used for all the projects
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/description<span style="color: #000000; font-weight: bold;">&gt;</span></span></span></pre>
      </td>
    </tr>
  </table>
</div></p> 

Criei um [projeto hospedado no google][3] para armazenar códigos java - base de aprendizado na linguagem java, especialmente nas especificações Servlet e JPA.  
Entre estes códigos, em especial, quero destacar o park-samples. [Este é estruturado utilizando tanto herança quanto agregação][4]:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="bash" style="font-family:monospace;">gilberto<span style="color: #000000; font-weight: bold;">@</span>dhcppc0:~<span style="color: #000000; font-weight: bold;">/</span>dev<span style="color: #000000; font-weight: bold;">/</span>netbeans-config<span style="color: #000000; font-weight: bold;">/</span>park-samples<span style="color: #000000; font-weight: bold;">&gt;</span> <span style="color: #c20cb9; font-weight: bold;">tree</span> <span style="color: #660033;">--dirsfirst</span> <span style="color: #660033;">-L</span> <span style="color: #000000;">3</span>
.
<span style="color: #000000; font-weight: bold;">|</span>-- docs
<span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">|</span>-- evolus.pencil
<span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">|</span>-- EditLegalEntity.ep
<span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">`</span>-- EditNaturalPerson.ep
<span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">|</span>-- power.architect
<span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">|</span>-- park.architect
<span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">`</span>-- park-er.pdf
<span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">|</span>-- 03000001.png
<span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">`</span>-- 03000003_en.png
<span style="color: #000000; font-weight: bold;">|</span>-- park-cayenne
<span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">|</span>-- src
<span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">|</span>-- main
<span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">`</span>-- <span style="color: #7a0874; font-weight: bold;">test</span>
<span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">|</span>-- nbactions.xml
<span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">|</span>-- nb-configuration.xml
<span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">`</span>-- pom.xml
<span style="color: #000000; font-weight: bold;">|</span>-- park-jpa
<span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">|</span>-- src
<span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">|</span>-- main
<span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">`</span>-- <span style="color: #7a0874; font-weight: bold;">test</span>
<span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">|</span>-- LICENSE.txt
<span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">|</span>-- nbactions.xml
<span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">|</span>-- nb-configuration.xml
<span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">|</span>-- pom.xml
<span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">`</span>-- README.txt
<span style="color: #000000; font-weight: bold;">|</span>-- park-multi-module
<span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">|</span>-- core
<span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">|</span>-- src
<span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">|</span>-- nbactions.xml
<span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">|</span>-- nb-configuration.xml
<span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">|</span>-- pom.xml
<span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">`</span>-- README.txt
<span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">|</span>-- web
<span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">|</span>-- src
<span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">`</span>-- pom.xml
<span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">|</span>-- LICENSE.txt
<span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">|</span>-- pom.xml
<span style="color: #000000; font-weight: bold;">|</span>   <span style="color: #000000; font-weight: bold;">`</span>-- README.txt
<span style="color: #000000; font-weight: bold;">|</span>-- LICENSE.txt
<span style="color: #000000; font-weight: bold;">|</span>-- pom.xml
<span style="color: #000000; font-weight: bold;">`</span>-- README.txt</pre>
      </td>
    </tr>
  </table>
</div></p> 

Veja que marquei o pom do diretório raiz como pai(PARENT), mudando o tipo de empacotamento. Mas você pode perguntar: o que difere um do outro?  
Bom, primeiro devo dizer que usamos herança em arquivos maven para compartilhar configurações, dependências e até recursos - dê uma boa olhada [neste pom][2] e você verá ajustes que teria de repetir em praticamente todos os sub-projetos. Já a agregação, usamos para agrupar (óbvio né! :)) projetos que precisam ser construídos juntos - quando executar mvn clean (ou outro comando) no pai, ocorrerá o mesmo nos filhos, tipo efeito cascata. 

Para a herança funcionar precisamos adicionar uma seção (tag parent) no pom do sub-projeto:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="xml" style="font-family:monospace;">    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;modelVersion<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>4.0.0<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/modelVersion<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;parent<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;groupId<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>com.google.constructor<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/groupId<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;artifactId<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>park-samples<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/artifactId<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;version<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>1.0-SNAPSHOT<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/version<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/parent<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;artifactId<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>park-jpa<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/artifactId<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;packaging<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>war<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/packaging<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;name<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>Parking Control[JPA]<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/name<span style="color: #000000; font-weight: bold;">&gt;</span></span></span></pre>
      </td>
    </tr>
  </table>
</div></p> 

Quando quero agregar projetos, tenho que configurar **o projeto que será o agregador **através da seção módulos (modules):

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="xml" style="font-family:monospace;">    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;parent<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;groupId<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>com.google.constructor<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/groupId<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;artifactId<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>park-samples<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/artifactId<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;version<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>1.0-SNAPSHOT<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/version<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/parent<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>    
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;artifactId<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>park-multi-module<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/artifactId<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;packaging<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>pom<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/packaging<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;name<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>Parking Control[MULTI-MODULE]<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/name<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;description<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
        A mult-module project using maven aggregation
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/description<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
&nbsp;
...
&nbsp;
   <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;modules<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;module<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>core<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/module<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;module<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>web<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/module<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/modules<span style="color: #000000; font-weight: bold;">&gt;</span></span></span></pre>
      </td>
    </tr>
  </table>
</div>

Repare que neste sub-projeto usei os dois conceitos: herança (herdando as configurações do pai) e agregação (este pom agrupa dois outros projetos). 

Para os sub-projetos do projeto park-multi-module, poderia adicionar a seção parent como fiz com os outros(apontando para park-samples), mas perderia o benefício da herança. Então o fiz apontando para o próprio park-multi-module, pois este já herda do raiz. Legal, né! <img src="http://blog.gilbertoca.com/wp-includes/images/smilies/icon_smile.gif" alt=":)" class="wp-smiley" />



 [1]: http://maven.apache.org/pom.html#Inheritance
 [2]: http://code.google.com/p/construtor/source/browse/trunk/park-samples/pom.xml
 [3]: http://code.google.com/p/construtor/
 [4]: http://code.google.com/p/construtor/source/browse/trunk/park-samples/README.txt
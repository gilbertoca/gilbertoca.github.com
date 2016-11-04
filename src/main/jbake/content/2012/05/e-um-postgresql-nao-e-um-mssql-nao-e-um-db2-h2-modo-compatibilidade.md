id=891
title=É um PostgreSQL! Não, é um MSSql! Não, é um DB2! [h2 modo compatibilidade] 
date=2012-05-18 11:55:54
type=post
status=published
tags=Database,  Java, maven
~~~~~~


Calma pessoal, é apenas o banco <a href="http://www.h2database.com/html/features.html#compatibility" target="_blank">H2 em modo compatibilidade</a>! Imagine  
que você acabou levando trabalho pra casa (Novidade!!!) mas se  
esqueceu que em casa vc não possui o ambiente - banco de dados -  
desenvolvimento semelhante ao do trabalho. Em meu caso um servidor de  
banco de dados PostgreSQL. 

O que isso tem haver com <a href="http://www.h2database.com/html/main.html" target="_blank">o banco de dados H2</a>? Diferentemente de um  
Postgresql, um MS Sql ou Oracle o H2 é um banco de dados leve e de  
fácil instalação, podendo até executá-lo sem a necessidade de uma  
instalação propriamente dita.

## Mas como isso funciona?</p> 

Há dua formas de se beneficiar desta característia. A primeira é  
utilizar o driver jdbc do próprio H2, utilizando o parâmetro MODE na  
URL de conexão:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="bash" style="font-family:monospace;">jdbc:h2:file:data<span style="color: #000000; font-weight: bold;">/</span>teste;<span style="color: #007800;">create</span>=<span style="color: #c20cb9; font-weight: bold;">true</span>;<span style="color: #007800;">MODE</span>=PostgreSQL;<span style="color: #007800;">DB_CLOSE_DELAY</span>=-<span style="color: #000000;">1</span></pre>
      </td>
    </tr>
  </table>
</div>

Assim você poderia recriar as estruturas do banco por script ou  
ativando a criação das entidades no provedor de persistência - caso  
utilize JPA. Veja que as estruturas - tabelas, views, sequências, etc  
- não teriam que ser ajustadas por estar utilizando o H2. O banco H2  
entende o dialeto, por assim dizer, do banco a ser “emulado” pelo  
parâmetro MODE. 

A segunda maneira, por sinal mais interessante, é não fazer nada!  
Como assim? Você provavelmente se questiona! É verdade, você não  
mexe em nada do seu projeto - que é um banco específico, no meu caso o  
PostgreSQL. Você continua utlizando o driver, a URL do seu banco e  
deixa o H2 fazer o resto. Vamos ver?  
Suponha que sua forma de conexão seja a seguinte:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="xml" style="font-family:monospace;"><span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;dependencies<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
	<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;dependency<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
		<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;groupId<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>postgresql<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/groupId<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
		<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;artifactId<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>postgresql<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/artifactId<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
		<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;version<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>8.1-408.jdbc3<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/version<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
	<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/dependency<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/dependencies<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;properties<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
	<span style="color: #808080; font-style: italic;">&lt;!-- Default Database Connection--&gt;</span>
	<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;jdbc.url<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>jdbc:postgresql://localhost:5435/teste<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/jdbc.url<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
	<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;jdbc.driverClassName<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>org.postgresql.Driver<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/jdbc.driverClassName<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
	<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;jdbc.username<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>teste<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/jdbc.username<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
	<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;jdbc.password<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>teste<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/jdbc.password<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/properties<span style="color: #000000; font-weight: bold;">&gt;</span></span></span></pre>
      </td>
    </tr>
  </table>
</div></p> 

Para funcionar precisamos ter um servidor PostreSQL rodando  
localmente, certo? Pois bem, vamos iniciar e estabelecer um servidor  
PostgreSQL através do H2. Para facilitar as coisas, vamos criar <a href="http://www.manydesigns.com/documentation/tutorials/using-maven-profiles-and-resource-filtering.html" target="_blank">um<br /> profile</a> que nos auxiliará nesta tarefa:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="xml" style="font-family:monospace;"><span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;profiles<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;profile<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
	<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;id<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>h2<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/id<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
	<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;activation<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
		<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;activeByDefault<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>false<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/activeByDefault<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
	<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/activation<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
	<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;dependencies<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
		<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;dependency<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
			<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;groupId<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>postgresql<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/groupId<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
			<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;artifactId<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>postgresql<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/artifactId<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
			<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;version<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>8.1-408.jdbc3<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/version<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
		<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/dependency<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
		<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;dependency<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
			<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;groupId<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>com.h2database<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/groupId<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
			<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;artifactId<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>h2<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/artifactId<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
			<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;version<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>1.3.166<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/version<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
		<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/dependency<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
	<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/dependencies<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/profile<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/profiles<span style="color: #000000; font-weight: bold;">&gt;</span></span></span></pre>
      </td>
    </tr>
  </table>
</div>

Agora a “grande sacada” do H2, abra dois terminais: um para rodar o  
servidor e a outra para você trabalhar normalmente com o maven. Em uma  
delas iremos iniciar o servidor:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="bash" style="font-family:monospace;">mvn <span style="color: #660033;">-P</span> h2 exec:java -Dexec.mainClass=<span style="color: #ff0000;">"org.h2.tools.Server"</span> -Dexec.args=<span style="color: #ff0000;">"-properties data -baseDir data"</span></pre>
      </td>
    </tr>
  </table>
</div></p> 

Após este comando, você terá a sua disposição uma interface - via  
navegador - a qual lhe permitirá escolher em qual MODE rodar o  
servidor.  


<div id="attachment_899" style="width: 557px" class="wp-caption alignleft">
  <a href="H2_admin_interface.png"><img src:"H2_admin_interface.png" alt="" title="H2_admin_interface" width="547" height="675" class="size-full wp-image-899" /></a>
  
  <p class="wp-caption-text">
    H2 Admin Interface
  </p>
</div>

  
Ao conectar àquela configuração definida incialmente, teremos outra  
interface de administração. Aqui poderemos administrar nosso “banco  
PostgreSQL”

<div id="attachment_903" style="width: 835px" class="wp-caption alignleft">
  <a href="H2_admin_interface_PG_MODE.png"><img src:"H2_admin_interface_PG_MODE.png" alt="" title="H2_admin_interface_PG_MODE" width="825" height="831" class="size-full wp-image-903" /></a>
  
  <p class="wp-caption-text">
    H2 Admin Console
  </p>
</div>

  
Acesse este banco por sua aplicação ou por qualquer outro cliente  
jdbc - por exemplo o squirrel. Lembre-se você estará acessando um  
banco PostgreSQL!


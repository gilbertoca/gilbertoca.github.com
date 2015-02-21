title=Indo um pouco além &#8230; 
date=2009-03-23 17:20:46
type=post
status=published
tags=Java
~~~~~~
<!-- google_ad_section_start -->

Estou aprendendo um pouco sobre programa&#231;&#227;o orientada a objeto em java e com o pouco que li resolvi implementar uma pequena api que abstrai as regras de acesso e recupera&#231;&#227;o de dados &minus; acesso a banco de dados. Gosto muito dessa (<a href="http://orbroker.sourceforge.net/" target="_blank">OrBroker</a>) api de persist&#234;ncia com isso elaborei um contrato que acho o m&#237;nimo necess&#225;rio para o acesso a dados, o qual poder&#225; utilizar a api OrBroker &#8211; espero n&#227;o somente essa api, mas outras (desacoplamento). 

IService: Interface (contrato) geral para uso com o mescanimo de persist&#234;ncia OrBroker. Estabelece assinaturas de m&#233;todos essenciais para opera&#231;&#245;es de acesso a banco de dados.  
Assinaturas: 

<pre><span style="color: #000000;">   </span><span style="font-weight: bold;color: #000000;">public</span><span style="color: #000000;"> </span><span style="font-weight: bold;color: #0095ff;">Collection</span><span style="color: #000000;">&lt;T&gt; </span><span style="color: #000080;">getAll</span><span style="color: #000000;">();</span>
<span style="color: #000000;">   </span><span style="font-weight: bold;color: #000000;">public</span><span style="color: #000000;"> </span><span style="color: #800000;">boolean</span><span style="color: #000000;"> </span><span style="color: #000080;">find</span><span style="color: #000000;">(T entity);</span>
<span style="color: #000000;">   </span><span style="font-weight: bold;color: #000000;">public</span><span style="color: #000000;"> </span><span style="color: #800000;">void</span><span style="color: #000000;"> </span><span style="color: #000080;">insert</span><span style="color: #000000;">(T entity);</span>
<span style="color: #000000;">   </span><span style="font-weight: bold;color: #000000;">public</span><span style="color: #000000;"> </span><span style="color: #800000;">void</span><span style="color: #000000;"> </span><span style="color: #000080;">update</span><span style="color: #000000;">(T entity);</span>
<span style="color: #000000;">   </span><span style="font-weight: bold;color: #000000;">public</span><span style="color: #000000;"> </span><span style="color: #800000;">void</span><span style="color: #000000;"> </span><span style="color: #000080;">delete</span><span style="color: #000000;">(T entity);</span>
<span style="color: #000000;">   </span><span style="font-weight: bold;color: #000000;">public</span><span style="color: #000000;"> </span><span style="font-weight: bold;color: #0095ff;">Collection</span><span style="color: #000000;">&lt;T&gt; </span><span style="color: #000080;">findByNamedQuery</span><span style="color: #000000;">(</span><span style="font-weight: bold;color: #0095ff;">String</span><span style="color: #000000;"> queryName);</span>
<span style="color: #000000;">   </span><span style="font-weight: bold;color: #000000;">public</span><span style="color: #000000;"> </span><span style="font-weight: bold;color: #0095ff;">Collection</span><span style="color: #000000;">&lt;T&gt; </span><span style="color: #000080;">findLike</span><span style="color: #000000;">(</span><span style="font-weight: bold;color: #0095ff;">String</span><span style="color: #000000;"> likeColumn, </span><span style="font-weight: bold;color: #0095ff;">String</span><span style="color: #000000;"> likeValue);</span>
</pre>

Voc&#234;s podem notar o uso do ingl&#234;s para nomear classes, metodos e at&#233; atributos. Acho isso um v&#237;cio ou uma maneira de reduzir os nomes, pois em portugu&#234;s ficam enormes. Outra coisa, alguns podem comentar que o nome certo seria sufixar ou prefixar tal interface com o termo DAO, para expressar um padr&#227;o de projeto muito conhecido e utilizado para, tamb&#233;m, abstrair essas atividades de banco de dados. Acontece que essa minha pequena implementa&#231;&#227;o n&#227;o exigir&#225; tamanha desacoplagem e acho tamb&#233;m que um programa que grava e ler dados, n&#227;o faz somente isso, faz isso e um pouco mais &#8211; regras de neg&#243;cio. Assim, optei por, inicialmente, colocar as assinaturas necess&#225;rias ao acesso a dados e deixar para uma outra interface acrescentar as assinaturas de contrato espec&#237;ficas: 

<pre><span style="font-weight: bold;color: #000000;">public</span><span style="color: #000000;"> </span><span style="font-weight: bold;color: #000000;">interface</span><span style="color: #000000;"> ICategoriaService </span><span style="font-weight: bold;color: #000000;">extends</span><span style="color: #000000;"> IService&lt;categoria, integer&gt; {</span>
<span style="color: #000000;">	</span><span style="font-weight: bold;color: #000000;">public</span><span style="color: #000000;"> Categoria </span><span style="color: #000080;">find</span><span style="color: #000000;">(</span><span style="font-weight: bold;color: #0095ff;">Integer</span><span style="color: #000000;"> primaryKey);</span>
<span style="color: #000000;">	</span><span style="font-weight: bold;color: #000000;">public</span><span style="color: #000000;"> </span><span style="color: #800000;">void</span><span style="color: #000000;"> </span><span style="color: #000080;">Classificar</span><span style="color: #000000;">();</span>
<span style="color: #000000;">	}</span>
</pre>

Na implementa&#231;&#227;o ocorre um fato interessante quando a entidade sendo trabalhada n&#227;o exigir contratos al&#233;m dos j&#225; fornecidos. Notei essa caracter&#237;stica quando da implementa&#231;&#227;o dos m&#233;todos por uma classe a ser utilizada como base de implementa&#231;&#227;o, ou seja, as classes mais espec&#237;ficas &minus; a exemplo da ICategoriaService &minus; herdar&#227;o dessa classe base e implementar&#227;o seus contratos espec&#237;ficos. Um exemplo de uso dessa classe base: 

<pre><span style="font-weight: bold;color: #000000;">public</span><span style="color: #000000;"> </span><span style="font-weight: bold;color: #000000;">class</span><span style="color: #000000;"> CategoriaBaseServiceTest {</span>
<span style="color: #000000;">	</span><span style="font-weight: bold;color: #000000;">private</span><span style="color: #000000;"> BaseService&lt;categoria, integer&gt; cS = </span><span style="font-weight: bold;color: #000000;">new</span><span style="color: #000000;"> BaseService&lt;categoria,integer&gt;(Categoria.</span><span style="color: #000080;">class</span><span style="color: #000000;">,Constants.</span><span style="color: #000080;">ORBROKER_INVENTARIO</span><span style="color: #000000;">);	</span>
<span style="color: #000000;">	</span>
<span style="color: #000000;">	@Test</span>
<span style="color: #000000;">	</span><span style="font-weight: bold;color: #000000;">public</span><span style="color: #000000;"> </span><span style="color: #800000;">void</span><span style="color: #000000;"> </span><span style="color: #000080;">testGetAll</span><span style="color: #000000;">() {</span>
<span style="color: #000000;">	</span><span style="font-weight: bold;color: #0095ff;">Collection</span><span style="color: #000000;">&lt;categoria&gt; result = cS.</span><span style="color: #000080;">getAll</span><span style="color: #000000;">();</span>
<span style="color: #000000;">		</span><span style="font-weight: bold;color: #0095ff;">System</span><span style="color: #000000;">.</span><span style="color: #000080;">out</span><span style="color: #000000;">.</span><span style="color: #000080;">println</span><span style="color: #000000;">(result);</span>
<span style="color: #000000;">		</span><span style="color: #000080;">assertFalse</span><span style="color: #000000;">(result.</span><span style="color: #000080;">isEmpty</span><span style="color: #000000;">());</span>
<span style="color: #000000;">	}</span>
<span style="color: #000000;">}</span>
</pre>

Ent&#227;o ficou da seguinte maneira essa pequena api:  
</>

<pre><span style="color: #000000;">Interface	Implementa&#231;&#227;o</span>
<span style="color: #000000;">IService ----------&gt; BaseService</span>
<span style="color: #000000;">:                     :</span>
<span style="color: #000000;">:                     :</span>
<span style="color: #000000;">ICategoriaService -&gt; CategoriaService	</span>
</pre>

<!-- google_ad_section_end -->
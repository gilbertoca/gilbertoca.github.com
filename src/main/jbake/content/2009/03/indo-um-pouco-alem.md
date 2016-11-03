id=4
title=Indo um pouco além &#8230; 
date=2009-03-23 17:20:46
type=post
status=published
tags=Java
~~~~~~


Estou aprendendo um pouco sobre programação orientada a objeto em java e com o pouco que li resolvi implementar uma pequena api que abstrai as regras de acesso e recuperação de dados &minus; acesso a banco de dados. Gosto muito dessa (<a href="http://orbroker.sourceforge.net/" target="_blank">OrBroker</a>) api de persistência com isso elaborei um contrato que acho o mínimo necessário para o acesso a dados, o qual poderá utilizar a api OrBroker - espero não somente essa api, mas outras (desacoplamento). 

IService: Interface (contrato) geral para uso com o mescanimo de persistência OrBroker. Estabelece assinaturas de métodos essenciais para operações de acesso a banco de dados.  
Assinaturas: 

<pre><span style="color: #000000;">   </span><span style="font-weight: bold;color: #000000;">public</span><span style="color: #000000;"> </span><span style="font-weight: bold;color: #0095ff;">Collection</span><span style="color: #000000;">&lt;T&gt; </span><span style="color: #000080;">getAll</span><span style="color: #000000;">();</span>
<span style="color: #000000;">   </span><span style="font-weight: bold;color: #000000;">public</span><span style="color: #000000;"> </span><span style="color: #800000;">boolean</span><span style="color: #000000;"> </span><span style="color: #000080;">find</span><span style="color: #000000;">(T entity);</span>
<span style="color: #000000;">   </span><span style="font-weight: bold;color: #000000;">public</span><span style="color: #000000;"> </span><span style="color: #800000;">void</span><span style="color: #000000;"> </span><span style="color: #000080;">insert</span><span style="color: #000000;">(T entity);</span>
<span style="color: #000000;">   </span><span style="font-weight: bold;color: #000000;">public</span><span style="color: #000000;"> </span><span style="color: #800000;">void</span><span style="color: #000000;"> </span><span style="color: #000080;">update</span><span style="color: #000000;">(T entity);</span>
<span style="color: #000000;">   </span><span style="font-weight: bold;color: #000000;">public</span><span style="color: #000000;"> </span><span style="color: #800000;">void</span><span style="color: #000000;"> </span><span style="color: #000080;">delete</span><span style="color: #000000;">(T entity);</span>
<span style="color: #000000;">   </span><span style="font-weight: bold;color: #000000;">public</span><span style="color: #000000;"> </span><span style="font-weight: bold;color: #0095ff;">Collection</span><span style="color: #000000;">&lt;T&gt; </span><span style="color: #000080;">findByNamedQuery</span><span style="color: #000000;">(</span><span style="font-weight: bold;color: #0095ff;">String</span><span style="color: #000000;"> queryName);</span>
<span style="color: #000000;">   </span><span style="font-weight: bold;color: #000000;">public</span><span style="color: #000000;"> </span><span style="font-weight: bold;color: #0095ff;">Collection</span><span style="color: #000000;">&lt;T&gt; </span><span style="color: #000080;">findLike</span><span style="color: #000000;">(</span><span style="font-weight: bold;color: #0095ff;">String</span><span style="color: #000000;"> likeColumn, </span><span style="font-weight: bold;color: #0095ff;">String</span><span style="color: #000000;"> likeValue);</span>
</pre>

Vocês podem notar o uso do inglês para nomear classes, metodos e até atributos. Acho isso um vício ou uma maneira de reduzir os nomes, pois em português ficam enormes. Outra coisa, alguns podem comentar que o nome certo seria sufixar ou prefixar tal interface com o termo DAO, para expressar um padrão de projeto muito conhecido e utilizado para, também, abstrair essas atividades de banco de dados. Acontece que essa minha pequena implementação não exigirá tamanha desacoplagem e acho também que um programa que grava e ler dados, não faz somente isso, faz isso e um pouco mais - regras de negócio. Assim, optei por, inicialmente, colocar as assinaturas necessárias ao acesso a dados e deixar para uma outra interface acrescentar as assinaturas de contrato específicas: 

<pre><span style="font-weight: bold;color: #000000;">public</span><span style="color: #000000;"> </span><span style="font-weight: bold;color: #000000;">interface</span><span style="color: #000000;"> ICategoriaService </span><span style="font-weight: bold;color: #000000;">extends</span><span style="color: #000000;"> IService&lt;categoria, integer&gt; {</span>
<span style="color: #000000;">	</span><span style="font-weight: bold;color: #000000;">public</span><span style="color: #000000;"> Categoria </span><span style="color: #000080;">find</span><span style="color: #000000;">(</span><span style="font-weight: bold;color: #0095ff;">Integer</span><span style="color: #000000;"> primaryKey);</span>
<span style="color: #000000;">	</span><span style="font-weight: bold;color: #000000;">public</span><span style="color: #000000;"> </span><span style="color: #800000;">void</span><span style="color: #000000;"> </span><span style="color: #000080;">Classificar</span><span style="color: #000000;">();</span>
<span style="color: #000000;">	}</span>
</pre>

Na implementação ocorre um fato interessante quando a entidade sendo trabalhada não exigir contratos além dos já fornecidos. Notei essa característica quando da implementação dos métodos por uma classe a ser utilizada como base de implementação, ou seja, as classes mais específicas &minus; a exemplo da ICategoriaService &minus; herdarão dessa classe base e implementarão seus contratos específicos. Um exemplo de uso dessa classe base: 

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

Então ficou da seguinte maneira essa pequena api:  
</>

<pre><span style="color: #000000;">Interface	Implementação</span>
<span style="color: #000000;">IService ----------&gt; BaseService</span>
<span style="color: #000000;">:                     :</span>
<span style="color: #000000;">:                     :</span>
<span style="color: #000000;">ICategoriaService -&gt; CategoriaService	</span>
</pre>


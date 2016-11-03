id=626
title=Apache Shiro Parte 1 - básico 
date=2011-04-07 18:04:51
type=post
status=published
tags=Apache Shiro, Application Server, Autenticação, Autorização, Java, maven, Proteção, Recursos de Segurança, Traduções
~~~~~~


** 

Este post é uma tradução livre do artigo “<a href="http://meri-stuff.blogspot.com/2011/03/apache-shiro-part-1-basics.html" target="_blank"> Apache Shiro Part 1 - Basics </a>“, publicado por Meri em 27 de março 2011 

</strong>  
**ATUALIZAÇÃO: duas novas seções adicionadas - tratamento de erros e hashing de senhas.**

<A href="http://shiro.apache.org/index.html" target="_blank"> Apache Shiro</A>, inicialmente chamado JSecurity, é um framework de segurança desenvolvido em java. Foi aceito e tornou-se um projeto Apache de nível superior em 2010. Tem como objetivo ser poderoso e fácil de usar. 

O projeto está em constante desenvolvimento e com listas de e-mails ativas para usuários e desenvolvedores. Áreas mais importantes estão <a href="http://shiro.apache.org/documentation.html" target="_blank"> documentadas em sua página web</a>. No entanto, existem algumas lacunas na documentação. Não é possível aprender a usar o máximo dos recursos do Shiro somente com a documentação. Felizmente, o código é bem documentado e onde o testei, ela foi de fácil leitura. 

Principais recursos do projeto Shiro são:  


  


  * autenticação,
  


  * autorização,
  


  * criptografia,
  


  * gerenciamento de sessão.
  


Neste artigo tentaremos demonstrar vários recursos do Shiro. Vamos começar com uma simples aplicação sem segurança e então adicionaremos recursos de segurança. Todo código está disponível no projeto <A href="https://github.com/SomMeri/SimpleShiroSecuredApplication" target="_blank"> SimpleShiroSecuredApplication</A> hospedado no <a href="https://github.com/" target="_blank"> Github</a>. 

#### Aplicação sem Segurança

O código da aplicação sem segurança está localizado no ramo(branch) <A href="https://github.com/SomMeri/SimpleShiroSecuredApplication/tree/unsecured_application" target="_blank"> unsecured_application</A>.  
A aplicação representa um sistema interno para uma companhia fictícia. A companhia tem quatro departamentos:  


  


  * administradores(administrators),
  


  * reparadores(repairmen),
  


  * cientistas(scientists),
  


  * vendedores(sales).
  


Cada departamento tem sua própria página. Cada página contém botões que serão usados por usuários em sua atividade. Quando o usuário pressiona o botão, o trabalho é realizado. Por exemplo, qualquer reparador pode acessar a página reparadores(repairmen) e pressionar o botão “Reparar Refrigerador(Repair Refrigerator)”. O botão repara refrigerador e mostra mensagem de sucesso. 

Cada usuário tem sua própria página de gerenciamento de conta. Esta página de gerenciamento contém informações privadas do usuário. Como a aplicação sem segurança não tem usuários ainda, a página de gerenciamento de conta não faz nada. Adicionalmente, há uma página que contém todas funções da aplicação. Tudo que alguém pode fazer é possível ser feito nesta página. 

Qualquer pessoa pode fazer qualquer coisa e ver todas as páginas. A aplicação exemplo é executada na classe de teste <A href="https://github.com/SomMeri/SimpleShiroSecuredApplication/blob/unsecured_application/src/test/java/org/meri/simpleshirosecuredapplication/RunWaitTest.java" target="_blank"> RunWaitTest</A>. Não é uma boa prática usar teste de unidade desta forma, mas isso não é importante agora. Se você executar a classe a aplicação estará disponível no endereço (url) http://localhost:9180/simpleshirosecuredapplication/. 

#### Adicionando Autenticação

Primeiro, temos que verificar a identidade do usuário. A mais fácil e padronizada forma de autenticação é feita por senha e nome usuário. Usuário preenche o seu nome de usuário e senha e o sistema verifica se os valores fornecidos combinam com alguma conta de usuário. 

Para aplicações mais simples, é suficiente armazenar nome e senha de usuários em arquivos de texto puro. Em um cenário mais realista, o nome e senha são armazenados em um mecanismo de persistente or a verificação é feita por outro sistema como ldap ou active directory. Shiro suporta todos os métodos de autenticação mencionados. Se os recursos de autenticação pré-existentes não são suficientes, é possível estender o framework com sua própria implementação de verificação. 

Neste capítulo, iremos adicionar autenticação baseada em nome de usuário e senha na aplicação. Nome de usuário e senha serão armazenados no arquivo de inicialização do Shiro, o qual é texto e estático. 

**Novos requisitos:**  
É possível a entrada e saída de usuários(log in/out). A aplicação será acessível somente para usuários registrados. Usuário com autenticação sem erros é redirecionado para sua própria página de gerenciamento de conta. Todas as páginas e funções da aplicação serão acessíveis para qualquer usuário autenticado.  
Passos necessários:  


  


  * adicionar Apache Shiro,
  


  * criar página de autenticação(log in),
  


  * configurar usuários e senhas,
  


  * criar página de saída(log out).
  


##### Adicionar Apache Shiro

Shiro é integrado à aplicação web através de <a href="http://download.oracle.com/javaee/5/api/javax/servlet/Filter.html" target="_blank"> filtros servlet</a>. Um filtro intercepta requisições e respostas antes do servlet e executa todas as tarefas necessárias (como a identificação do usuário atualmente autenticado, anexar o usuário ao thread corrente, &#8230;). Filtros Shiro pré-definidos fornecem recursos de segurança básicos, como:  


  


  * força a autenticação do usuário(log in),
  


  * força ssl,
  


  * verificação dos direitos de acesso à página.
  


Se você quiser aprender mais sobre filtros Shiro pré-definidos, um bom lugar para começar é a enumeração <A href="http://shiro.apache.org/static/current/apidocs/org/apache/shiro/web/filter/mgt/DefaultFilter.html" target="_blank"> DefaultFilter</A>. Ela lista todos os filtros Shiro pré-definidos disponíveis. Se estes não forem suficientes para suas necessidades, você pode criar um personalizado. 

Usaremos o filtro altamente configurável <A href="http://shiro.apache.org/static/current/apidocs/org/apache/shiro/web/servlet/IniShiroFilter.html" target="_blank"> IniShiroFilter</A>. Ele lê a configuração Shiro a partir do arquivo ini e inicializa o framework de segurança. Ele não executa qualquer verificação de segurança. Verificação de segurança, autenticação de usuário, verificação de protocolo, etc. são todos transferidos(delegados) tanto para o filtro Shiro pré-definido quanto para o filtro personalizado(outra implementação). O filtro IniShiroFilter apenas os inicializa. 

A configuração ini é descrita na <A href="http://shiro.apache.org/configuration.html" target="_blank"> documentação</A> e no <A href="http://shiro.apache.org/static/current/apidocs/org/apache/shiro/web/servlet/IniShiroFilter.html" target="_blank"> javadoc</A>. O arquivo de configuração ini tem quatro seções:  


  


  * Seção [main] contém a inicialização do Shiro. Filtros e objetos personalizados são configurados aqui. 
  


  * Seção [users] define usuários, senhas e perfis de usuário(roles). 
  


  * Seção [roles] associa perfis(roles) com permissões.
  


  * Seção [urls] especifica direitos de acesso às páginas da aplicação (urls). É feito ligando filtro tanto pré-definido quanto personalizado às urls
  


Adicione Apache Shiro como dependência ao arquivo pom.xml:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="xml" style="font-family:monospace;"><span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;properties<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;shiro.version<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>1.1.0<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/shiro.version<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/properties<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;dependencies<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;dependency<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;groupId<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>org.apache.shiro<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/groupId<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;artifactId<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>shiro-core<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/artifactId<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;version<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>${shiro.version}<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/version<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/dependency<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;dependency<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;groupId<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>org.apache.shiro<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/groupId<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;artifactId<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>shiro-web<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/artifactId<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;version<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>${shiro.version}<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/version<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/dependency<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/dependencies<span style="color: #000000; font-weight: bold;">&gt;</span></span></span></pre>
      </td>
    </tr>
  </table>
</div></p> 

Crie o arquivo Shiro.ini e o coloque no classpath. Configure o arquivo web.xml para chamar o filtro IniShiroFilter antes de cada requisição:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="xml" style="font-family:monospace;"><span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;filter<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;filter-name<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>ShiroFilter<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/filter-name<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;filter-class<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>org.apache.shiro.web.servlet.IniShiroFilter<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/filter-class<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;init-param<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;param-name<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>configPath<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/param-name<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;param-value<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>classpath:Shiro.ini<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/param-value<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/init-param<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/filter<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;filter-mapping<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;filter-name<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>ShiroFilter<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/filter-name<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;url-pattern<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>/*<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/url-pattern<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/filter-mapping<span style="color: #000000; font-weight: bold;">&gt;</span></span></span></pre>
      </td>
    </tr>
  </table>
</div></p> 

##### Criar Página de Autenticação(Log in)

A página de autenticação é uma simples página html contendo um botão submissão, nome de usuário e senha. A funcionalidade de autenticação é tratada pelo filtro Shiro authc pré-definido. O filtro autch permite acesso à página (url) somente a usuários autenticados. Se o usuário não está autenticado, o filtro o redirecionará para a página de autenticação (log in). 

Crie a página login.jsp:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="xml" style="font-family:monospace;"><span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;form</span> <span style="color: #000066;">name</span>=<span style="color: #ff0000;">"loginform"</span> <span style="color: #000066;">action</span>=<span style="color: #ff0000;">""</span> <span style="color: #000066;">method</span>=<span style="color: #ff0000;">"post"</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;table</span> <span style="color: #000066;">align</span>=<span style="color: #ff0000;">"left"</span> <span style="color: #000066;">border</span>=<span style="color: #ff0000;">"0"</span> <span style="color: #000066;">cellspacing</span>=<span style="color: #ff0000;">"0"</span> <span style="color: #000066;">cellpadding</span>=<span style="color: #ff0000;">"3"</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;tr<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;td<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>Username:<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/td<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;td<span style="color: #000000; font-weight: bold;">&gt;</span></span><span style="color: #000000; font-weight: bold;">&lt;input</span> <span style="color: #000066;">type</span>=<span style="color: #ff0000;">"text"</span> <span style="color: #000066;">name</span>=<span style="color: #ff0000;">"user"</span> <span style="color: #000066;">maxlength</span>=<span style="color: #ff0000;">"30"</span><span style="color: #000000; font-weight: bold;">&gt;</span><span style="color: #000000; font-weight: bold;">&lt;/td<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/tr<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;tr<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;td<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>Password:<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/td<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;td<span style="color: #000000; font-weight: bold;">&gt;</span></span><span style="color: #000000; font-weight: bold;">&lt;input</span> <span style="color: #000066;">type</span>=<span style="color: #ff0000;">"password"</span> <span style="color: #000066;">name</span>=<span style="color: #ff0000;">"pass"</span> <span style="color: #000066;">maxlength</span>=<span style="color: #ff0000;">"30"</span><span style="color: #000000; font-weight: bold;">&gt;</span><span style="color: #000000; font-weight: bold;">&lt;/td<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/tr<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;tr<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;td</span> <span style="color: #000066;">colspan</span>=<span style="color: #ff0000;">"2"</span> <span style="color: #000066;">align</span>=<span style="color: #ff0000;">"left"</span><span style="color: #000000; font-weight: bold;">&gt;</span><span style="color: #000000; font-weight: bold;">&lt;input</span> <span style="color: #000066;">type</span>=<span style="color: #ff0000;">"checkbox"</span> <span style="color: #000066;">name</span>=<span style="color: #ff0000;">"remember"</span><span style="color: #000000; font-weight: bold;">&gt;</span><span style="color: #000000; font-weight: bold;">&lt;font</span> <span style="color: #000066;">size</span>=<span style="color: #ff0000;">"2"</span><span style="color: #000000; font-weight: bold;">&gt;</span></span>Remember Me<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/font<span style="color: #000000; font-weight: bold;">&gt;</span></span><span style="color: #000000; font-weight: bold;">&lt;/td<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/tr<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;tr<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
            <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;td</span> <span style="color: #000066;">colspan</span>=<span style="color: #ff0000;">"2"</span> <span style="color: #000066;">align</span>=<span style="color: #ff0000;">"right"</span><span style="color: #000000; font-weight: bold;">&gt;</span><span style="color: #000000; font-weight: bold;">&lt;input</span> <span style="color: #000066;">type</span>=<span style="color: #ff0000;">"submit"</span> <span style="color: #000066;">name</span>=<span style="color: #ff0000;">"submit"</span> <span style="color: #000066;">value</span>=<span style="color: #ff0000;">"Login"</span><span style="color: #000000; font-weight: bold;">&gt;</span><span style="color: #000000; font-weight: bold;">&lt;/td<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
        <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/tr<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
    <span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/table<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/form<span style="color: #000000; font-weight: bold;">&gt;</span></span></span></pre>
      </td>
    </tr>
  </table>
</div></p> 

Habilite o filtro authc para todas as páginas da aplicação:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="vim" style="font-family:monospace;"><span style="color: #000000;">&#91;</span>main<span style="color: #000000;">&#93;</span> 
# specify login page
authc<span style="color: #000000;">.</span>loginUrl = <span style="color: #000000;">/</span>simpleshirosecuredapplication<span style="color: #000000;">/</span>account<span style="color: #000000;">/</span>login<span style="color: #000000;">.</span>jsp
&nbsp;
# name of request parameter with username; <span style="color: #804040;">if</span> not present <span style="color: #25BB4D;">filter</span> assumes <span style="color: #C5A22D;">'username'</span>
authc<span style="color: #000000;">.</span>usernameParam = <span style="color: #804040;">user</span>
# name of request parameter with password; <span style="color: #804040;">if</span> not present <span style="color: #25BB4D;">filter</span> assumes <span style="color: #C5A22D;">'password'</span>
authc<span style="color: #000000;">.</span>passwordParam = pass
# does the <span style="color: #804040;">user</span> wish <span style="color: #668080;">to</span> be remembered<span style="color: #000000;">?</span>; <span style="color: #804040;">if</span> not present <span style="color: #25BB4D;">filter</span> assumes <span style="color: #C5A22D;">'rememberMe'</span>
authc<span style="color: #000000;">.</span>rememberMeParam = remember
&nbsp;
# redirect after successful login
authc<span style="color: #000000;">.</span>successUrl  = <span style="color: #000000;">/</span>simpleshirosecuredapplication<span style="color: #000000;">/</span>account<span style="color: #000000;">/</span>personalaccountpage<span style="color: #000000;">.</span>jsp
&nbsp;
<span style="color: #000000;">&#91;</span>urls<span style="color: #000000;">&#93;</span>
# enable authc <span style="color: #25BB4D;">filter</span> <span style="color: #804040;">for</span> all application pages
<span style="color: #000000;">/</span>simpleshirosecuredapplication<span style="color: #000000;">/**</span>=authc</pre>
      </td>
    </tr>
  </table>
</div>

**Atualização:** Shiro automaticamente executa a equiparação(comparação) de caminho(path matching) relativa ao contexto. Como a aplicação SimpleShiroSecuredApplication não tem o caminho do contexto definido, caminhos completos no arquivo Shiro.ini são necessários. No entanto, se o contexto da aplicação fosse definido para /simpleshirosecuredapplication, então os caminhos poderiam ser relativos, por exemplo, /**=authc ou /account/personalaccountpage.jsp. 

Como não é seguro enviar nome de usuário e senha pela rede, devemos forçar autenticações com o protocolo ssl. O filtro ssl faz exatamente isso. Ele tem um parâmetro opcional: número da porta ssl. Se o parâmetro porta(port) for omitido, ele usa a porta ssl pré-definida 443. 

Antes de configurar o protocolo ssl no Shiro, precisamos habilitá-lo no servidor web. Como fazer isso, depende do servidor web. Iremos demonstrar como habilitá-lo no <a href="http://jetty.codehaus.org/jetty/" target="_blank"> Jetty</a>. Primeiro, crie um keystore com o certificado auto assinado:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="bash" style="font-family:monospace;">keytool <span style="color: #660033;">-genkey</span> <span style="color: #660033;">-keyalg</span> RSA <span style="color: #660033;">-alias</span> jetty <span style="color: #660033;">-keystore</span> keystore <span style="color: #660033;">-storepass</span> secret <span style="color: #660033;">-validity</span> <span style="color: #000000;">360</span> <span style="color: #660033;">-keysize</span> <span style="color: #000000;">2048</span></pre>
      </td>
    </tr>
  </table>
</div>

Responda todas questões e no final pressione ENTER, assim o keystore senha e a chave senha serão o mesmo. 

Segundo, adicione o keystore ao projeto e configure <a href="http://jetty.codehaus.org/jetty/" target="_blank"> o servidor Jetty</a> para usar o protocolo ssl. O código java está disponível na classe<A href="https://github.com/SomMeri/SimpleShiroSecuredApplication/blob/static_authentication_and_authorization/src/test/java/org/meri/simpleshirosecuredapplication/test/AbstractContainerTest.java" target="_blank"> AbstractContainerTest</A>. 

Agora é possível configurar o filtro ssl no arquivo Shiro.ini:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="vim" style="font-family:monospace;"><span style="color: #000000;">&#91;</span>urls<span style="color: #000000;">&#93;</span>
# force <span style="color: #668080;">ssl</span> <span style="color: #804040;">for</span> login page
<span style="color: #000000;">/</span>simpleshirosecuredapplication<span style="color: #000000;">/</span>account<span style="color: #000000;">/</span>login<span style="color: #000000;">.</span>jsp=<span style="color: #668080;">ssl</span><span style="color: #000000;">&#91;</span><span style="color: #000000; font-weight:bold;">8443</span><span style="color: #000000;">&#93;</span>,authc
# enable authc <span style="color: #25BB4D;">filter</span> <span style="color: #804040;">for</span> the all application pages; as Shiro reads urls from up <span style="color: #668080;">to</span> down, must be last
<span style="color: #000000;">/</span>simpleshirosecuredapplication<span style="color: #000000;">/**</span>=authc</pre>
      </td>
    </tr>
  </table>
</div></p> 

##### Configurar Usuários e Senhas

A aplicação SimpleShiroSecuredApplication estará agora disponível somente para usuários autenticados. Assim, é necessário adicionar alguns usuários de forma que algumas pessoas tenham acesso à aplicação.  
A configuração é feita na seção [users] do arquivo Shiro.ini. O formato das entradas da seção é:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="vim" style="font-family:monospace;">username = password, roleName1, roleName2, <span style="color: #000000;">...</span>, roleNameN</pre>
      </td>
    </tr>
  </table>
</div>

A seguinte seção cria sete usuários, todos com a mesma senha &#8216;heslo&#8217;:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="vim" style="font-family:monospace;"><span style="color: #000000;">&#91;</span>users<span style="color: #000000;">&#93;</span>
administrator=heslo,Administrator
friendlyrepairmen=heslo,repairmen
unfriendlyrepairmen=heslo,repairmen
mathematician=heslo,scientist
physicien=heslo,scientist
productsales=heslo,sales
servicessales=heslo,sales</pre>
      </td>
    </tr>
  </table>
</div></p> 

Agora é possível ser autenticado e ter acesso à aplicação. No entanto, nenhuma mensagem de erro razoável é mostrada se o usuário comete um erro. Além disso, as senhas são armazenadas em arquivo texto. 

##### Tratamento de Erro

Se o usuário comete um erro ao fazer a autenticação (log in), o Shiro o redireciona de volta para a página de login. A página parece exatamente a mesma de antes, o que pode confundir o usuário. 

**Novo requerimento:**  
Mostrar mensagem de erro após cada tentativa de autenticação(log in) sem êxito. 

Toda vez que ocorrer um erro de autenticação, uma exceção é lançada. Por definição, o filtro de autenticação captura a exceção e armazena nome da classe (exceção) em um parâmentro da requisição (request). Como desejamos personalizar os dados enviados à página, teremos que estender o filtro pré-definido <a href="http://shiro.apache.org/static/current/apidocs/org/apache/shiro/web/filter/authc/FormAuthenticationFilter.html" target="_blank">FormAuthenticationFilter</a> e sobrescrever o método <a href="https://github.com/SomMeri/SimpleShiroSecuredApplication/blob/static_authentication_and_authorization/src/main/java/org/meri/simpleshirosecuredapplication/servlet/VerboseFormAuthenticationFilter.java" target="_blank">setFailureAttribute</a>: 

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="java" style="font-family:monospace;">@Override
<span style="color: #000000; font-weight: bold;">protected</span> <span style="color: #000066; font-weight: bold;">void</span> setFailureAttribute<span style="color: #009900;">&#40;</span>ServletRequest request, <span style="color: #003399;">AuthenticationException</span> ae<span style="color: #009900;">&#41;</span> <span style="color: #009900;">&#123;</span>
  <span style="color: #003399;">String</span> message <span style="color: #339933;">=</span> ae.<span style="color: #006633;">getMessage</span><span style="color: #009900;">&#40;</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
  request.<span style="color: #006633;">setAttribute</span><span style="color: #009900;">&#40;</span>getFailureKeyAttribute<span style="color: #009900;">&#40;</span><span style="color: #009900;">&#41;</span>, message<span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
<span style="color: #009900;">&#125;</span></pre>
      </td>
    </tr>
  </table>
</div>

Substitua o filtro pré-definido FormAuthenticationFilter por [VerboseFormAuthenticationFilter][1] e o configure para usar o atributo de requisição (request) &#8216;simpleShiroApplicationLoginFailure&#8217; para armazenar a informação do erro: 

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="vim" style="font-family:monospace;"><span style="color: #000000;">&#91;</span>main<span style="color: #000000;">&#93;</span>
# replace form authentication <span style="color: #25BB4D;">filter</span> with <span style="color: #668080;">verbose</span> <span style="color: #25BB4D;">filter</span>
authc = org<span style="color: #000000;">.</span>meri<span style="color: #000000;">.</span>simpleshirosecuredapplication<span style="color: #000000;">.</span>servlet<span style="color: #000000;">.</span>VerboseFormAuthenticationFilter
# request parameter with login error information; <span style="color: #804040;">if</span> not present <span style="color: #25BB4D;">filter</span> assumes <span style="color: #C5A22D;">'shiroLoginFailure'</span>
authc<span style="color: #000000;">.</span>failureKeyAttribute=simpleShiroApplicationLoginFailure</pre>
      </td>
    </tr>
  </table>
</div>

Mostrar o erro na página login.jsp: 

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="java" style="font-family:monospace;"><span style="color: #339933;">&lt;%</span>
  <span style="color: #003399;">String</span> errorDescription <span style="color: #339933;">=</span> <span style="color: #009900;">&#40;</span><span style="color: #003399;">String</span><span style="color: #009900;">&#41;</span> request.<span style="color: #006633;">getAttribute</span><span style="color: #009900;">&#40;</span><span style="color: #0000ff;">"simpleShiroApplicationLoginFailure"</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
  <span style="color: #000000; font-weight: bold;">if</span> <span style="color: #009900;">&#40;</span>errorDescription<span style="color: #339933;">!=</span><span style="color: #000066; font-weight: bold;">null</span><span style="color: #009900;">&#41;</span> <span style="color: #009900;">&#123;</span>
<span style="color: #339933;">%&gt;</span>
Login attempt was unsuccessful<span style="color: #339933;">:</span> <span style="color: #339933;">&lt;%=</span>errorDescription<span style="color: #339933;">%&gt;</span>
<span style="color: #339933;">&lt;%</span>
  <span style="color: #009900;">&#125;</span>
<span style="color: #339933;">%&gt;</span></pre>
      </td>
    </tr>
  </table>
</div>

Cuidado: uma aplicação real não deve apresentar muitas informações de erro de autenticação. Uma mensagem como “tentativa de logon sem sucesso.”, com nenhuma informação adicional é geralmente suficiente. 

##### Hashing de Senhas

Na versão atual da aplicação, todas as senhas estão, ainda, em texto puro. É melhor armazenar e comparar somente o hashing da senha. 

Objetos responsáveis por autenticação são chamados de <A href="http://shiro.apache.org/realm.html" target="_blank"> realms</A>. Por padrão, Shiro usa o <A href="http://shiro.apache.org/static/current/apidocs/org/apache/shiro/realm/text/IniRealm.html" target="_blank"> IniRealm</A> com comparador de senha plugável para comparar senhas. Iremos substituir as senhas no ini por suas correspondentes hasheadas com SHA-256 e configurar o IniRealm para usar este comparador de senhas. 

Gerar o hash SHA-256 da senha:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="java" style="font-family:monospace;"><span style="color: #000000; font-weight: bold;">import</span> <span style="color: #006699;">org.apache.shiro.crypto.hash.Sha256Hash</span><span style="color: #339933;">;</span>
&nbsp;
<span style="color: #000000; font-weight: bold;">public</span> <span style="color: #000000; font-weight: bold;">static</span> <span style="color: #000066; font-weight: bold;">void</span> main<span style="color: #009900;">&#40;</span><span style="color: #003399;">String</span><span style="color: #009900;">&#91;</span><span style="color: #009900;">&#93;</span> args<span style="color: #009900;">&#41;</span> <span style="color: #009900;">&#123;</span>
    Sha256Hash sha256Hash <span style="color: #339933;">=</span> <span style="color: #000000; font-weight: bold;">new</span> Sha256Hash<span style="color: #009900;">&#40;</span><span style="color: #0000ff;">"heslo"</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    <span style="color: #003399;">System</span>.<span style="color: #006633;">out</span>.<span style="color: #006633;">println</span><span style="color: #009900;">&#40;</span>sha256Hash.<span style="color: #006633;">toHex</span><span style="color: #009900;">&#40;</span><span style="color: #009900;">&#41;</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
<span style="color: #009900;">&#125;</span></pre>
      </td>
    </tr>
  </table>
</div></p> 

Configurar o Shiro para comparar senha trasnformada(hashing) ao invés da própria senha:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="vim" style="font-family:monospace;"><span style="color: #000000;">&#91;</span>main<span style="color: #000000;">&#93;</span> 
# <span style="color: #668080;">define</span> matcher matching hashes instead of passwords
sha256Matcher = org<span style="color: #000000;">.</span>apache<span style="color: #000000;">.</span>shiro<span style="color: #000000;">.</span>authc<span style="color: #000000;">.</span>credential<span style="color: #000000;">.</span>HashedCredentialsMatcher
sha256Matcher<span style="color: #000000;">.</span>hashAlgorithmName=SHA<span style="color: #000000;">-</span><span style="color: #000000; font-weight:bold;">256</span>
&nbsp;
# enable matcher <span style="color: #804040;">in</span> iniRealm <span style="color: #000000;">&#40;</span>object responsible <span style="color: #804040;">for</span> authentication<span style="color: #000000;">&#41;</span>
iniRealm<span style="color: #000000;">.</span>credentialsMatcher = <span style="color: #000000;">$</span>sha256Matcher</pre>
      </td>
    </tr>
  </table>
</div></p> 

Substituir as senhas dos usuários por senhas trasnformadas(hashing):

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="vim" style="font-family:monospace;"><span style="color: #000000;">&#91;</span>users<span style="color: #000000;">&#93;</span>
administrator=56b1db8133d9eb398aabd376f07bf8ab5fc584ea0b8bd6a1770200cb613ca005, Administrator
friendlyrepairmen=56b1db8133d9eb398aabd376f07bf8ab5fc584ea0b8bd6a1770200cb613ca005, repairmen
unfriendlyrepairmen=56b1db8133d9eb398aabd376f07bf8ab5fc584ea0b8bd6a1770200cb613ca005, repairmen
mathematician=56b1db8133d9eb398aabd376f07bf8ab5fc584ea0b8bd6a1770200cb613ca005, scientist
physicien=56b1db8133d9eb398aabd376f07bf8ab5fc584ea0b8bd6a1770200cb613ca005,  scientist
productsales=56b1db8133d9eb398aabd376f07bf8ab5fc584ea0b8bd6a1770200cb613ca005,        sales
servicessales=56b1db8133d9eb398aabd376f07bf8ab5fc584ea0b8bd6a1770200cb613ca005,  sales</pre>
      </td>
    </tr>
  </table>
</div>

Nota: não é possível especificar SALT no arquivo de configuração ini. 

##### Criar Página de Saída(Log out)

Qualque aplicação que tenha recursos de autenticação deveria também ter o recurso de saída. Terminar uma sessão corrente com Shiro é fácil, use o comando:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="java" style="font-family:monospace;"><span style="color: #666666; font-style: italic;">//acquire currently logged user and log him out</span>
SecurityUtils.<span style="color: #006633;">getSubject</span><span style="color: #009900;">&#40;</span><span style="color: #009900;">&#41;</span>.<span style="color: #006633;">logout</span><span style="color: #009900;">&#40;</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span></pre>
      </td>
    </tr>
  </table>
</div>

A página de saída(Log out) então fica assim:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="xml" style="font-family:monospace;"><span style="color: #009900;">&lt;%@ page <span style="color: #000066;">import</span>=<span style="color: #ff0000;">"org.apache.shiro.SecurityUtils"</span> %<span style="color: #000000; font-weight: bold;">&gt;</span></span>
<span style="color: #009900;">&lt;% SecurityUtils.getSubject<span style="color: #66cc66;">&#40;</span><span style="color: #66cc66;">&#41;</span>.logout<span style="color: #66cc66;">&#40;</span><span style="color: #66cc66;">&#41;</span>;%<span style="color: #000000; font-weight: bold;">&gt;</span></span>
You have succesfully logged out.</pre>
      </td>
    </tr>
  </table>
</div></p> 

#### Adicionar Autorização

Concluiremos esta primeira parte adicionando autorização à aplicação. Começamos limitando o acesso às páginas aos usuários. Nenhum usuário deveria ser capaz de ver páginas de outros departamentos. Fornecendo assim, somente segurança parcial ao projeto, pois o usuário ainda é capaz de usar a página com “todas as funções da aplicação” ou editar o endereço (url) no navegador para realizar qualquer ação. Nós a chamaremos de autorização em nível de página. 

Então, limitaremos a habilidade dos usuários para realizar ações próprias. Mesmo que abra a página com “todas as funções da aplicação” ou edite o endereço (url) no navegador, ele poderá realizar somente funções específicas de seu departamento. Nós a chamaremos de autorização em nível de função. 

**Novos requisitos:** o usuário não é capaz de ver páginas de departamentos que não pertence. O usuário é capaz de realizar somente funções de seu departamento. Uma exceção a essa regra é o administrador, que pode realizar funções administrativas e de reparação. 

##### Página de Autorização

Autorização em nível de página é feita com filtro de perfis(roles).  
Parâmetro parte do filtro pode conter qualquer número de perfis. Usuário autenticado pode acessar a página somente se ele tem todas os perfis fornecidos. 

Como de costume, o filtro de perfis(roles) é configurado no arquivo Shiro.ini:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="vim" style="font-family:monospace;"><span style="color: #000000;">&#91;</span>urls<span style="color: #000000;">&#93;</span>
# force <span style="color: #668080;">ssl</span> <span style="color: #804040;">for</span> login page
<span style="color: #000000;">/</span>simpleshirosecuredapplication<span style="color: #000000;">/</span>account<span style="color: #000000;">/</span>login<span style="color: #000000;">.</span>jsp=<span style="color: #668080;">ssl</span><span style="color: #000000;">&#91;</span><span style="color: #000000; font-weight:bold;">8443</span><span style="color: #000000;">&#93;</span>,authc
&nbsp;
# only users with some roles are allowed <span style="color: #668080;">to</span> use role<span style="color: #000000;">-</span>specific pages 
<span style="color: #000000;">/</span>simpleshirosecuredapplication<span style="color: #000000;">/</span>repairmen<span style="color: #000000;">/**</span>=authc, roles<span style="color: #000000;">&#91;</span>repairman<span style="color: #000000;">&#93;</span>
<span style="color: #000000;">/</span>simpleshirosecuredapplication<span style="color: #000000;">/</span>sales<span style="color: #000000;">/**</span>=authc, roles<span style="color: #000000;">&#91;</span>sales<span style="color: #000000;">&#93;</span>
<span style="color: #000000;">/</span>simpleshirosecuredapplication<span style="color: #000000;">/</span>scientists<span style="color: #000000;">/**</span>=authc, roles<span style="color: #000000;">&#91;</span>scientist<span style="color: #000000;">&#93;</span>
<span style="color: #000000;">/</span>simpleshirosecuredapplication<span style="color: #000000;">/</span>adminarea<span style="color: #000000;">/**</span>=authc, roles<span style="color: #000000;">&#91;</span>Administrator<span style="color: #000000;">&#93;</span>
&nbsp;
# enable authc <span style="color: #25BB4D;">filter</span> <span style="color: #804040;">for</span> the all application pages; as Shiro reads urls from up <span style="color: #668080;">to</span> down, must be last
<span style="color: #000000;">/</span>simpleshirosecuredapplication<span style="color: #000000;">/**</span>=authc</pre>
      </td>
    </tr>
  </table>
</div>

Teste se a segurança funciona: entre como um usuário de vendas, clique home, clique no link &#8216;repairmen page&#8217;. Você verá um erro feio. 

Nós terminamos a página de autorização e substituimos o erro redirecionando-o para uma página de erro. Os filtros pré-definidos do Shiro possuem a propriedade unauthorizedUrl. Em caso de acesso não autorizado, o filtro redirecionará o usuário para um endereço (url) específico.

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="vim" style="font-family:monospace;"><span style="color: #000000;">&#91;</span>main<span style="color: #000000;">&#93;</span>
# redirect <span style="color: #668080;">to</span> an error page <span style="color: #804040;">if</span> <span style="color: #804040;">user</span> does not have access rights
roles<span style="color: #000000;">.</span>unauthorizedUrl = <span style="color: #000000;">/</span>simpleshirosecuredapplication<span style="color: #000000;">/</span>account<span style="color: #000000;">/</span>accessdenied<span style="color: #000000;">.</span>jsp</pre>
      </td>
    </tr>
  </table>
</div></p> 

accessdenied.jsp: 

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="xml" style="font-family:monospace;"><span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;body<span style="color: #000000; font-weight: bold;">&gt;</span></span></span>
Sorry, you do not have access rights to that area.
<span style="color: #009900;"><span style="color: #000000; font-weight: bold;">&lt;/body<span style="color: #000000; font-weight: bold;">&gt;</span></span></span></pre>
      </td>
    </tr>
  </table>
</div></p> 

##### Autorização de Funções

Todas as páginas departamentais estão protegidas agora. No entanto, qualquer usuário pode ainda realizar qualquer função na página com “todas as funções da aplicação”. Além disso, qualquer usuário autenticado pode editar endereço (url) e assim fazer qualquer ação. Por exemplo, se você entrar como vendedor e colocar  
https://localhost:8443/simpleshirosecuredapplication/masterservlet?action=MANAGE_REPAIRMEN na url, a aplicação irá realizar a função gerenciar reparadores também (e então irá dispará a exceção: null point, mas a violação de segurança já foi feita).  
Atribuimos uma úncia <A href="http://shiro.apache.org/permissions.html" target="_blank"> permissão</A> para cada função. Elas estão divididas em grupos:  


  


  * todas as permissões estão no grupo “functions”,
  


  * todas as permissões administrativas estão no grupo “manage”,
  


  * todas as permissões reparação estão no grupo “repair”,
  


  * todas as permissões venda estão no grupo “sale”, 
  


  * todas as permissões ciência estão no grupo “science”.
  


Shiro suporta permissões de múltiplos níveis representadas como strings. Níveis são separados com o símbolo &#8216;:&#8217;. p.e. “functions:manage:repairmen” tem três níveis: “functions”, “manage” e “repairman”. Permissões de múltiplos níveis permitem facilmente o agrupamento de permissões. Por exemplo, o grupo science pertence ao grupo functions e contém três permissões:  


  


  * functions:science:research,
  


  * functions:science:writearticle,
  


  * functions:science:preparetalk.
  


  
A classe <A href="https://github.com/SomMeri/SimpleShiroSecuredApplication/blob/static_authentication_and_authorization/src/main/java/org/meri/simpleshirosecuredapplication/actions/Actions.java" target="_blank"> Ações</A> verifica as permissões do usuário autenticado(log in) antes de fazer seu trabalho:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="java" style="font-family:monospace;"><span style="color: #000000; font-weight: bold;">public</span> <span style="color: #003399;">String</span> doIt<span style="color: #009900;">&#40;</span><span style="color: #009900;">&#41;</span> <span style="color: #009900;">&#123;</span>
    <span style="color: #003399;">String</span> neededPermission <span style="color: #339933;">=</span> getNeededPermission<span style="color: #009900;">&#40;</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    <span style="color: #666666; font-style: italic;">// acquire logged user and check permission</span>
    <span style="color: #000000; font-weight: bold;">if</span> <span style="color: #009900;">&#40;</span>SecurityUtils.<span style="color: #006633;">getSubject</span><span style="color: #009900;">&#40;</span><span style="color: #009900;">&#41;</span>.<span style="color: #006633;">isPermitted</span><span style="color: #009900;">&#40;</span>neededPermission<span style="color: #009900;">&#41;</span><span style="color: #009900;">&#41;</span>
        <span style="color: #000000; font-weight: bold;">return</span> <span style="color: #0000ff;">"Function "</span> <span style="color: #339933;">+</span> getName<span style="color: #009900;">&#40;</span><span style="color: #009900;">&#41;</span> <span style="color: #339933;">+</span> <span style="color: #0000ff;">" run succesfully."</span><span style="color: #339933;">;</span>
&nbsp;
    <span style="color: #000000; font-weight: bold;">throw</span> <span style="color: #000000; font-weight: bold;">new</span> UnauthorizedException<span style="color: #009900;">&#40;</span><span style="color: #0000ff;">"Logged user does not have "</span> <span style="color: #339933;">+</span> neededPermission <span style="color: #339933;">+</span> <span style="color: #0000ff;">" permission"</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
<span style="color: #009900;">&#125;</span></pre>
      </td>
    </tr>
  </table>
</div>

NOTA: Outro modo de se alcançar o mesmo objetivo é através de anotações. 

O servlet <A href="https://github.com/SomMeri/SimpleShiroSecuredApplication/blob/static_authentication_and_authorization/src/main/java/org/meri/simpleshirosecuredapplication/servlet/PerformFunctionAndGoBackServlet.java" target="_blank"> PerformFunctionAndGoBackServlet</A> captura exceções de autorização e as converte em mensagem de erro:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="java" style="font-family:monospace;"><span style="color: #000000; font-weight: bold;">private</span> <span style="color: #003399;">String</span> performAction<span style="color: #009900;">&#40;</span><span style="color: #003399;">String</span> actionName<span style="color: #009900;">&#41;</span> <span style="color: #009900;">&#123;</span>
    <span style="color: #000000; font-weight: bold;">try</span> <span style="color: #009900;">&#123;</span>
        Actions action <span style="color: #339933;">=</span> findAction<span style="color: #009900;">&#40;</span>actionName<span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
        <span style="color: #003399;">String</span> result <span style="color: #339933;">=</span> action <span style="color: #339933;">==</span> <span style="color: #000066; font-weight: bold;">null</span> <span style="color: #339933;">?</span> <span style="color: #000066; font-weight: bold;">null</span> <span style="color: #339933;">:</span> action.<span style="color: #006633;">doIt</span><span style="color: #009900;">&#40;</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
        log.<span style="color: #006633;">debug</span><span style="color: #009900;">&#40;</span><span style="color: #0000ff;">"Performed function with result: "</span> <span style="color: #339933;">+</span> result<span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
        <span style="color: #000000; font-weight: bold;">return</span> result<span style="color: #339933;">;</span>
    <span style="color: #009900;">&#125;</span> <span style="color: #000000; font-weight: bold;">catch</span> <span style="color: #009900;">&#40;</span>ShiroException ex<span style="color: #009900;">&#41;</span> <span style="color: #009900;">&#123;</span>
        log.<span style="color: #006633;">debug</span><span style="color: #009900;">&#40;</span><span style="color: #0000ff;">"Function failed with "</span> <span style="color: #339933;">+</span> ex.<span style="color: #006633;">getMessage</span><span style="color: #009900;">&#40;</span><span style="color: #009900;">&#41;</span> <span style="color: #339933;">+</span> <span style="color: #0000ff;">" message."</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
        <span style="color: #000000; font-weight: bold;">return</span> <span style="color: #0000ff;">"Error: "</span> <span style="color: #339933;">+</span> ex.<span style="color: #006633;">getMessage</span><span style="color: #009900;">&#40;</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    <span style="color: #009900;">&#125;</span>
<span style="color: #009900;">&#125;</span></pre>
      </td>
    </tr>
  </table>
</div></p> 

Finalmente, precisamos configurar as permissões para os perfis no arquivo Shiro.ini. Shiro suporta curingas para permissões de múltiplo nível. Assim, não temos que especificar cada permissão departamental em separado:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="vim" style="font-family:monospace;"><span style="color: #000000;">&#91;</span>roles<span style="color: #000000;">&#93;</span>
# members of departments should be able <span style="color: #668080;">to</span> perform all departmental functions
sales=functions<span style="color: #000000;">:</span>sale<span style="color: #000000;">:*</span>
scientist=functions<span style="color: #000000;">:</span>science<span style="color: #000000;">:*</span>
repairman=functions<span style="color: #000000;">:</span>repair<span style="color: #000000;">:*</span>
&nbsp;
# administrators are able <span style="color: #668080;">to</span> do all management functions and repair functions
Administrator=functions<span style="color: #000000;">:</span>manage<span style="color: #000000;">:*</span>,functions<span style="color: #000000;">:</span>repair<span style="color: #000000;">:*</span></pre>
      </td>
    </tr>
  </table>
</div></p> 

Você pode agora acessar a página “todas as funções da aplicação” e testar as funções.  
Se um usuário autenticado não tiver a permissão requerida, uma mensagem de erro aparecerá no topo da página. Além disso, se você fizer a autenticação (log in) como vendedor e tentar hackear  
https://localhost:8443/simpleshirosecuredapplication/masterservlet?action=MANAGE_REPAIRMEN, você verá uma mensagem de erro no console (em vez de uma mensagem de sucesso). 

#### Fim

A aplicação final está disponível no ramo(branch) <A href="https://github.com/SomMeri/SimpleShiroSecuredApplication/tree/static_authentication_and_authorization" target="_blank"> &#8216;static_authentication_and_authorization&#8217;</A> hospedado no Github. 

Na segunda parte iremos criar um <A href="http://shiro.apache.org/realm.html" target="_blank"> realm</A> personalizado e mover usuários, senhas, perfis(roles) e permissões do arquivo ini para um banco de dados.



 [1]: https://github.com/SomMeri/SimpleShiroSecuredApplication/blob/static_authentication_and_authorization/src/main/java/org/meri/simpleshirosecuredapplication/servlet/VerboseFormAuthenticationFilter.java
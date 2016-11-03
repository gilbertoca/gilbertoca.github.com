id=275
title=Alterando o group principal/efetivo do usuário - newgrp e sg 
date=2010-02-22 17:24:31
type=post
status=published
tags=Application Server, Database, Linux, openSUSE, Sistema Operacional
~~~~~~


Para ter um ambiente semelhante ao de produção, neste caso para as aplicações
que rodam em forms e para a instalação do banco, acabei por instalar o mesmo 
sistema operacional (SLES9), os mesmos softwares (OracleAs 10g, Oracle Database
10g e Oracle DevSuit 10g) no meu desktop. Com isso, toda vez que preciso usar 
qualquer um destes softwares eu tem que assumir o usuario de instalação dos 
mesmos que neste caso usei o default oracle. Veja a labuta que tem de fazer:

<pre>
<code class="bash">
    $ xhost +
    $ sux – oracle
    $ source .oracleDB #ou oracleDS ou oracleAS
</code>    
</pre>

Dos scripts de mudança de ambiente não tenho como escapar mas para facilitar
minha vida, acabei adicionando os grupos DBA e oinstall para minha lista 
de grupos. Dessa forma não preciso usar o su para mudança de usuario. Ai tem um 
porém, meu grupo padrão é users. Nessa, quando tento compilar um forms ou 
iniciar o servidor de aplicações, acontece vários erros de permissões. Isso 
porque meu grupo principal/efetivo, como já disse, não é o oinstall nem DBA.
Para contornar este problema usei o utilitário de sistema newgrp. O comando
newgrp é usado para alterar o grupo efetivo do usuário para o grupo solicitado
em uma nova sessão de login:

<pre>
<code class="bash">
    $ groups
    users disk uucp dialout audio video oinstall dba
    $ newgrp oinstall
    $ groups
    oinstall disk uucp dialout audio video dba users
    $ exit
    $ groups
    users disk uucp dialout audio video oinstall dba
</code>
</pre>

Desta forma meu grupo principal torna-se oinstall, me possibilitando trabalhar 
com a compilação dos forms. Legal hein! O outro utilitario de sistema que 
podemos usar é o sg. O sg é mais usando que vc so precisa executar um comando, 
mas usando o grupo o qual vc necessita:

<pre>
<code class="bash">
    sg oinstall -c rm *.err
</code>    
</pre>

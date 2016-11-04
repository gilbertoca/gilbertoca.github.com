id=338
title=Transportado schema de um banco para outro [exp e imp] 
date=2010-04-08 15:16:58
type=post
status=published
tags=Database,Linux,oracle
~~~~~~

Fazer exportação e importação de schemas de usuários de um banco para outro com 
os [utilitários exp e imp][1] não coisa fácil, principalmente se você nunca fez 
essa tarefa! Mas há sempre uma primeira vez para quase tudo, não é mesmo? 

O nosso banco está iniciando e não tem muitos dados, aproximadamente 6GB de 
tamanho físico. Só a exportação demorou aproximadamente seis horas.  
Bom, o passo inicial foi criar um novo banco - isso porque estamos passando 
da [versão 10gR1 intel][2] para [10gR2 ppc][3] - com opções mínimas. O segundo 
foi realizar o exp no banco original somente dos usuários (schemas) necessários:

<pre>
<code class="bash">
    exp userid=system@desenv file=producao.dmp log=export_producao.log buffer=65535000 consistent=y recordlength=65535 grants=y compress=n statistics=none owner=(login,hades,c_hades,ergon,c_ergon,gilberto,kira, epj,rafael,sic)
</code>
</pre>

O terceiro parecia simples, fazer a importação no novo banco.

<pre>
<code class="bash">
    #Importando os dados sem as constraints
    imp '/ AS SYSDBA' file=producao.dmp full=y grants=n constraints=n
    #Importando sem os dados com as constraints
    imp '/ AS SYSDBA' file=producao.dmp full=y grants=n constraints=y rows=n
</code>
</pre>

Doce ilusão! Isso não funcionou porque não tínhamos criado os usuários nesse 
novo banco. Incrível, se é um export e import, por que não tem essa característica 
por padrão? Já existe a definição de todos os objetos, inclusive dos usuários no 
dump do exp. 

Bom, a solução inicial foi extrair do dump gerado pelo exp, a definição dos 
schemas dos usuários. Para isso utilizamos o utilitário de sistema [strings][4]:

<pre>
<code class="bash">
    strings producao.dmp | grep -i "CREATE USER" > create_user.sql  strings producao.dmp | grep -i "GRANT " > grants.sql
</code>    
</pre>

Que dureza! Veja que isso não ajudou muito porque o arquivo gerado - grants.sql - 
não faz distinção através do schema. Não entendeu? Vou mostrar:

<pre>
<code class="bash">
    oracle@oracleserver:~/backup/scripts> head grants.sql
    GRANT ALTER ON "ACIDENTES_SEQ" TO "HADES" WITH GRANT OPTION
    GRANT SELECT ON "ACIDENTES_SEQ" TO "HADES" WITH GRANT OPTION
    GRANT ALTER ON "ACIDENTES_SEQ" TO "C_HADES" WITH GRANT OPTION
    GRANT SELECT ON "ACIDENTES_SEQ" TO "C_HADES" WITH GRANT OPTION
    GRANT ALTER ON "ACIDENTES_SEQ" TO "C_ERGON" WITH GRANT OPTION
    GRANT SELECT ON "ACIDENTES_SEQ" TO "C_ERGON" WITH GRANT OPTION
    GRANT ALTER ON "AVERB_SEQ" TO "HADES" WITH GRANT OPTION
    GRANT SELECT ON "AVERB_SEQ" TO "HADES" WITH GRANT OPTION
    GRANT ALTER ON "AVERB_SEQ" TO "C_HADES" WITH GRANT OPTION
    GRANT SELECT ON "AVERB_SEQ" TO "C_HADES" WITH GRANT OPTION
    oracle@oracleserver:~/backup/scripts>
</code>
</pre>

Veja que não há definição a qual usuário o objeto pertence. A solução foi 
realizar o exp para cada usuário separadamente e extrair os grants:

<pre>
<code class="bash">
    exp '/ AS SYSDBA' file=login_grants.dmp log=export_archon.log buffer=65535000 consistent=y recordlength=65535 grants=y compress=n statistics=none owner=(login) 
    exp '/ AS SYSDBA' file=ergon_grants.dmp log=export_archon.log buffer=65535000 consistent=y recordlength=65535 grants=y compress=n statistics=none owner=(ergon) 
    exp '/ AS SYSDBA' file=c_ergon_grants.dmp log=export_archon.log buffer=65535000 consistent=y recordlength=65535 grants=y compress=n statistics=none owner=(c_ergon) 
    exp '/ AS SYSDBA' file=hades_grants.dmp log=export_archon.log buffer=65535000 consistent=y recordlength=65535 grants=y compress=n statistics=none owner=(hades) 
    exp '/ AS SYSDBA' file=c_hades_grants.dmp log=export_archon.log buffer=65535000 consistent=y recordlength=65535 grants=y compress=n statistics=none owner=(c_hades) 
    exp '/ AS SYSDBA' file=sys_grants.dmp log=export_archon.log buffer=65535000 consistent=y recordlength=65535 grants=y compress=n statistics=none owner=(sys)     
    strings ergon_grants.dmp | grep "GRANT " > ergon_grants.sql strings c_ergon_grants.dmp | grep "GRANT " > c_ergon_grants.sql strings login_grants.dmp | grep "GRANT " > login_grants.sql
    . . . 
</code>
</pre>

Tem um ditado que acho verdadeiro no nosso mundo TI: 

> Se eu posso complicar porque vou simplificar!


Você ri não é? Mas você precisava ver a cara do meu chefe depois de 3 dias nessa tarefa.  
Depois de tudo isso, tem a caçada dos objetos inválidos que nem o script [utlrp.sql][5] resolve. 

Ai você diz: “Mas que cara burro! Existe outra maneira de resolver isso muito 
mais simples.”.  
Pois é! Não é burrice não, é inesperiência mesmo! Sem contar na pressão que vc 
mesmo exerce sobre si para realizar a tarefa. Vc precisa demonstrar que é capaz. 

Bom o resultado final é que depois de toda essa luta, encontrei outra maneira 
fácil de resolver esse problema - extrair a definição de determinados usuários e 
seus grants -. 
Muito fácil mesmo. :)

<pre>
<p>definição</p>
<code class="sql">
    SET pages 9999
    SET LINES 180
    SET hea off
    spool create_users_to_move.SQL
    SELECT 'create user '||username||' identified by '||password||
    ' default tablespace '||default_tablespace||
    ' temporary tablespace '||temporary_tablespace||';'
    FROM dba_users
    WHERE username NOT IN ('DBSNMP','OUTLN','SYS','SYSTEM')
    ORDER BY username;
    spool off    
</code>    
</pre>

<pre>
<p>grants</p>
<code class="sql">
    SET pages 9999
    SET LINES 180
    SET hea off
    spool grants_for_users_to_move.SQL
    SELECT 'grant '||granted_role||' to '||grantee||';'
    FROM dba_role_privs
    WHERE grantee NOT IN ('DBSNMP','OUTLN','SYS','SYSTEM')
    ORDER BY grantee;
    /*
    select 'grant '||privilege||' on '||owner||'.'||table_name||
    ' to '||grantee||';'
    from dba_tab_privs
    where grantee not in ('DBSNMP','OUTLN','SYS','SYSTEM')
    and owner not in ('SYS','SYSTEM','DBSNMP','OUTLN')
    order by grantee;
    */
    spool off
</code>    
</pre>
Lembre-se que este script é útil quando há a possibilidade de acessar o banco de 
origem. Caso contrário, você terá que usar outro método para criar os usuários 
no banco de destino.

 [1]: http://download.oracle.com/docs/cd/B19306_01/server.102/b14215/exp_imp.htm#i1023560
 [2]: http://download.oracle.com/docs/cd/B19306_01/relnotes.102/b15659/toc.htm
 [3]: http://download.oracle.com/docs/cd/B19306_01/relnotes.102/b19074/toc.htm
 [4]: http://linux.die.net/man/1/strings
 [5]: http://download.oracle.com/docs/cd/B19306_01/install.102/b15660/post_inst_task.htm#i1036714
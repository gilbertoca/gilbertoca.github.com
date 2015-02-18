id: 338
title: 'Transportado schema de um banco para outro [exp e imp]'
author: gilberto_ca
layout: post
guid: http://blog.gilbertoca.com/?p=338
permalink: /?p=338
dsq_thread_id:
  - 3503808835
categories:
  - Database
  - Linux
tags:
  - backup
  - banco de dados
  - oracle
---
<!-- google_ad_section_start -->

Fazer exportação e importação de schemas de usuários de um banco para outro com os [utilitários exp e imp][1] não coisa fácil, principalmente se você nunca fez essa tarefa! Mas há sempre uma primeira vez para quase tudo, não é mesmo? 

O nosso banco está iniciando e não tem muitos dados, aproximadamente 6GB de tamanho físico. Só a exportação demorou aproximadamente seis horas.  
Bom, o passo inicial foi criar um novo banco &#8211; isso porque estamos passando da [versão 10gR1 intel][2] para [10gR2 ppc][3] &#8211; com opções mínimas. O segundo foi realizar o exp no banco original somente dos usuários (schemas) necessários:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="bash" style="font-family:monospace;"> exp <span style="color: #007800;">userid</span>=system<span style="color: #000000; font-weight: bold;">@</span>desenv <span style="color: #007800;">file</span>=producao.dmp <span style="color: #007800;">log</span>=export_producao.log <span style="color: #007800;">buffer</span>=<span style="color: #000000;">65535000</span> <span style="color: #007800;">consistent</span>=y <span style="color: #007800;">recordlength</span>=<span style="color: #000000;">65535</span> <span style="color: #007800;">grants</span>=y <span style="color: #007800;">compress</span>=n <span style="color: #007800;">statistics</span>=none <span style="color: #007800;">owner</span>=<span style="color: #7a0874; font-weight: bold;">&#40;</span><span style="color: #c20cb9; font-weight: bold;">login</span>,hades,c_hades,ergon,c_ergon,gilberto,kira, epj,rafael,sic<span style="color: #7a0874; font-weight: bold;">&#41;</span></pre>
      </td>
    </tr>
  </table>
</div></p> 

O terceiro parecia simples, fazer a importação no novo banco.

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="bash" style="font-family:monospace;"><span style="color: #666666; font-style: italic;">#Importando os dados sem as constraints</span>
 imp  <span style="color: #ff0000;">'/ AS SYSDBA'</span> <span style="color: #007800;">file</span>=producao.dmp <span style="color: #007800;">full</span>=y <span style="color: #007800;">grants</span>=n <span style="color: #007800;">constraints</span>=n
&nbsp;
&nbsp;
<span style="color: #666666; font-style: italic;">#Importando sem os dados com as constraints</span>
 imp  <span style="color: #ff0000;">'/ AS SYSDBA'</span> <span style="color: #007800;">file</span>=producao.dmp <span style="color: #007800;">full</span>=y <span style="color: #007800;">grants</span>=n <span style="color: #007800;">constraints</span>=y <span style="color: #007800;">rows</span>=n</pre>
      </td>
    </tr>
  </table>
</div></p> 

Doce ilusão! Isso não funcionou porque não tínhamos criado os usuários nesse novo banco. Incrível, se é um export e import, por que não tem essa característica por padrão? Já existe a definição de todos os objetos, inclusive dos usuários no dump do exp. 

Bom, a solução inicial foi extrair do dump gerado pelo exp, a definição dos schemas dos usuários. Para isso utilizamos o utilitário de sistema [strings][4]:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="bash" style="font-family:monospace;"> <span style="color: #c20cb9; font-weight: bold;">strings</span> producao.dmp <span style="color: #000000; font-weight: bold;">|</span> <span style="color: #c20cb9; font-weight: bold;">grep</span> <span style="color: #660033;">-i</span> <span style="color: #ff0000;">"CREATE USER"</span> <span style="color: #000000; font-weight: bold;">&gt;</span> create_user.sql
 <span style="color: #c20cb9; font-weight: bold;">strings</span> producao.dmp <span style="color: #000000; font-weight: bold;">|</span> <span style="color: #c20cb9; font-weight: bold;">grep</span> <span style="color: #660033;">-i</span> <span style="color: #ff0000;">"GRANT "</span> <span style="color: #000000; font-weight: bold;">&gt;</span> grants.sql</pre>
      </td>
    </tr>
  </table>
</div></p> 

Que dureza! Veja que isso não ajudou muito porque o arquivo gerado &#8211; grants.sql &#8211; não faz distinção através do schema. Não entendeu? Vou mostrar:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="bash" style="font-family:monospace;">oracle<span style="color: #000000; font-weight: bold;">@</span>oracleserver:~<span style="color: #000000; font-weight: bold;">/</span>backup<span style="color: #000000; font-weight: bold;">/</span>scripts<span style="color: #000000; font-weight: bold;">&gt;</span> <span style="color: #c20cb9; font-weight: bold;">head</span> grants.sql
GRANT ALTER ON <span style="color: #ff0000;">"ACIDENTES_SEQ"</span> TO <span style="color: #ff0000;">"HADES"</span> WITH GRANT OPTION
GRANT SELECT ON <span style="color: #ff0000;">"ACIDENTES_SEQ"</span> TO <span style="color: #ff0000;">"HADES"</span> WITH GRANT OPTION
GRANT ALTER ON <span style="color: #ff0000;">"ACIDENTES_SEQ"</span> TO <span style="color: #ff0000;">"C_HADES"</span> WITH GRANT OPTION
GRANT SELECT ON <span style="color: #ff0000;">"ACIDENTES_SEQ"</span> TO <span style="color: #ff0000;">"C_HADES"</span> WITH GRANT OPTION
GRANT ALTER ON <span style="color: #ff0000;">"ACIDENTES_SEQ"</span> TO <span style="color: #ff0000;">"C_ERGON"</span> WITH GRANT OPTION
GRANT SELECT ON <span style="color: #ff0000;">"ACIDENTES_SEQ"</span> TO <span style="color: #ff0000;">"C_ERGON"</span> WITH GRANT OPTION
GRANT ALTER ON <span style="color: #ff0000;">"AVERB_SEQ"</span> TO <span style="color: #ff0000;">"HADES"</span> WITH GRANT OPTION
GRANT SELECT ON <span style="color: #ff0000;">"AVERB_SEQ"</span> TO <span style="color: #ff0000;">"HADES"</span> WITH GRANT OPTION
GRANT ALTER ON <span style="color: #ff0000;">"AVERB_SEQ"</span> TO <span style="color: #ff0000;">"C_HADES"</span> WITH GRANT OPTION
GRANT SELECT ON <span style="color: #ff0000;">"AVERB_SEQ"</span> TO <span style="color: #ff0000;">"C_HADES"</span> WITH GRANT OPTION
oracle<span style="color: #000000; font-weight: bold;">@</span>oracleserver:~<span style="color: #000000; font-weight: bold;">/</span>backup<span style="color: #000000; font-weight: bold;">/</span>scripts<span style="color: #000000; font-weight: bold;">&gt;</span></pre>
      </td>
    </tr>
  </table>
</div>

Veja que não há definição a qual usuário o objeto pertence. A solução foi realizar o exp para cada usuário separadamente e extrair os grants:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="bash" style="font-family:monospace;"> exp <span style="color: #ff0000;">'/ AS SYSDBA'</span> <span style="color: #007800;">file</span>=login_grants.dmp <span style="color: #007800;">log</span>=export_archon.log <span style="color: #007800;">buffer</span>=<span style="color: #000000;">65535000</span> <span style="color: #007800;">consistent</span>=y <span style="color: #007800;">recordlength</span>=<span style="color: #000000;">65535</span> <span style="color: #007800;">grants</span>=y <span style="color: #007800;">compress</span>=n <span style="color: #007800;">statistics</span>=none <span style="color: #007800;">owner</span>=<span style="color: #7a0874; font-weight: bold;">&#40;</span><span style="color: #c20cb9; font-weight: bold;">login</span><span style="color: #7a0874; font-weight: bold;">&#41;</span>
exp <span style="color: #ff0000;">'/ AS SYSDBA'</span> <span style="color: #007800;">file</span>=ergon_grants.dmp <span style="color: #007800;">log</span>=export_archon.log <span style="color: #007800;">buffer</span>=<span style="color: #000000;">65535000</span> <span style="color: #007800;">consistent</span>=y <span style="color: #007800;">recordlength</span>=<span style="color: #000000;">65535</span> <span style="color: #007800;">grants</span>=y <span style="color: #007800;">compress</span>=n <span style="color: #007800;">statistics</span>=none <span style="color: #007800;">owner</span>=<span style="color: #7a0874; font-weight: bold;">&#40;</span>ergon<span style="color: #7a0874; font-weight: bold;">&#41;</span>
exp <span style="color: #ff0000;">'/ AS SYSDBA'</span> <span style="color: #007800;">file</span>=c_ergon_grants.dmp <span style="color: #007800;">log</span>=export_archon.log <span style="color: #007800;">buffer</span>=<span style="color: #000000;">65535000</span> <span style="color: #007800;">consistent</span>=y <span style="color: #007800;">recordlength</span>=<span style="color: #000000;">65535</span> <span style="color: #007800;">grants</span>=y <span style="color: #007800;">compress</span>=n <span style="color: #007800;">statistics</span>=none <span style="color: #007800;">owner</span>=<span style="color: #7a0874; font-weight: bold;">&#40;</span>c_ergon<span style="color: #7a0874; font-weight: bold;">&#41;</span>
exp <span style="color: #ff0000;">'/ AS SYSDBA'</span> <span style="color: #007800;">file</span>=hades_grants.dmp <span style="color: #007800;">log</span>=export_archon.log <span style="color: #007800;">buffer</span>=<span style="color: #000000;">65535000</span> <span style="color: #007800;">consistent</span>=y <span style="color: #007800;">recordlength</span>=<span style="color: #000000;">65535</span> <span style="color: #007800;">grants</span>=y <span style="color: #007800;">compress</span>=n <span style="color: #007800;">statistics</span>=none <span style="color: #007800;">owner</span>=<span style="color: #7a0874; font-weight: bold;">&#40;</span>hades<span style="color: #7a0874; font-weight: bold;">&#41;</span>
exp <span style="color: #ff0000;">'/ AS SYSDBA'</span> <span style="color: #007800;">file</span>=c_hades_grants.dmp <span style="color: #007800;">log</span>=export_archon.log <span style="color: #007800;">buffer</span>=<span style="color: #000000;">65535000</span> <span style="color: #007800;">consistent</span>=y <span style="color: #007800;">recordlength</span>=<span style="color: #000000;">65535</span> <span style="color: #007800;">grants</span>=y <span style="color: #007800;">compress</span>=n <span style="color: #007800;">statistics</span>=none <span style="color: #007800;">owner</span>=<span style="color: #7a0874; font-weight: bold;">&#40;</span>c_hades<span style="color: #7a0874; font-weight: bold;">&#41;</span>
exp <span style="color: #ff0000;">'/ AS SYSDBA'</span> <span style="color: #007800;">file</span>=sys_grants.dmp <span style="color: #007800;">log</span>=export_archon.log <span style="color: #007800;">buffer</span>=<span style="color: #000000;">65535000</span> <span style="color: #007800;">consistent</span>=y <span style="color: #007800;">recordlength</span>=<span style="color: #000000;">65535</span> <span style="color: #007800;">grants</span>=y <span style="color: #007800;">compress</span>=n <span style="color: #007800;">statistics</span>=none <span style="color: #007800;">owner</span>=<span style="color: #7a0874; font-weight: bold;">&#40;</span>sys<span style="color: #7a0874; font-weight: bold;">&#41;</span>
&nbsp;
&nbsp;
<span style="color: #c20cb9; font-weight: bold;">strings</span> ergon_grants.dmp <span style="color: #000000; font-weight: bold;">|</span> <span style="color: #c20cb9; font-weight: bold;">grep</span> <span style="color: #ff0000;">"GRANT "</span> <span style="color: #000000; font-weight: bold;">&gt;</span> ergon_grants.sql
<span style="color: #c20cb9; font-weight: bold;">strings</span> c_ergon_grants.dmp <span style="color: #000000; font-weight: bold;">|</span> <span style="color: #c20cb9; font-weight: bold;">grep</span> <span style="color: #ff0000;">"GRANT "</span> <span style="color: #000000; font-weight: bold;">&gt;</span> c_ergon_grants.sql
<span style="color: #c20cb9; font-weight: bold;">strings</span> login_grants.dmp <span style="color: #000000; font-weight: bold;">|</span> <span style="color: #c20cb9; font-weight: bold;">grep</span> <span style="color: #ff0000;">"GRANT "</span> <span style="color: #000000; font-weight: bold;">&gt;</span> login_grants.sql
.
.
.</pre>
      </td>
    </tr>
  </table>
</div></p> 

Tem um ditado que acho verdadeiro no nosso mundo TI: 

> &#8220;Se eu posso complicar porque vou simplificar!&#8221;

. Você ri não é? Mas você precisava ver a cara do meu chefe depois de 3 dias nessa tarefa.  
Depois de tudo isso, tem a caçada dos objetos inválidos que nem o script [utlrp.sql][5] resolve. 

Ai você diz: &#8220;Mas que cara burro! Existe outra maneira de resolver isso muito mais simples.&#8221;.  
Pois é! Não é burrice não, é inesperiência mesmo! Sem contar na pressão que vc mesmo exerce sobre si para realizar a tarefa. Vc precisa demonstrar que é capaz. 

Bom o resultado final é que depois de toda essa luta, encontrei outra maneira fácil de resolver esse problema &#8211; extrair a definição de determinados usuários e seus grants -. Muito fácil mesmo. <img src="http://blog.gilbertoca.com/wp-includes/images/smilies/icon_smile.gif" alt=":)" class="wp-smiley" /> 

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="sql" style="font-family:monospace;"><span style="color: #993333; font-weight: bold;">SET</span> pages <span style="color: #cc66cc;">9999</span>
<span style="color: #993333; font-weight: bold;">SET</span> <span style="color: #993333; font-weight: bold;">LINES</span> <span style="color: #cc66cc;">180</span>
<span style="color: #993333; font-weight: bold;">SET</span> hea off
spool create_users_to_move<span style="color: #66cc66;">.</span><span style="color: #993333; font-weight: bold;">SQL</span>
<span style="color: #993333; font-weight: bold;">SELECT</span> <span style="color: #ff0000;">'create user '</span><span style="color: #66cc66;">||</span>username<span style="color: #66cc66;">||</span><span style="color: #ff0000;">' identified by '</span><span style="color: #66cc66;">||</span>password<span style="color: #66cc66;">||</span>
<span style="color: #ff0000;">' default tablespace '</span><span style="color: #66cc66;">||</span>default_tablespace<span style="color: #66cc66;">||</span>
<span style="color: #ff0000;">' temporary tablespace '</span><span style="color: #66cc66;">||</span>temporary_tablespace<span style="color: #66cc66;">||</span><span style="color: #ff0000;">';'</span>
<span style="color: #993333; font-weight: bold;">FROM</span> dba_users
<span style="color: #993333; font-weight: bold;">WHERE</span> username <span style="color: #993333; font-weight: bold;">NOT</span> <span style="color: #993333; font-weight: bold;">IN</span> <span style="color: #66cc66;">&#40;</span><span style="color: #ff0000;">'DBSNMP'</span><span style="color: #66cc66;">,</span><span style="color: #ff0000;">'OUTLN'</span><span style="color: #66cc66;">,</span><span style="color: #ff0000;">'SYS'</span><span style="color: #66cc66;">,</span><span style="color: #ff0000;">'SYSTEM'</span><span style="color: #66cc66;">&#41;</span>
<span style="color: #993333; font-weight: bold;">ORDER</span> <span style="color: #993333; font-weight: bold;">BY</span> username;
spool off
<span style="color: #808080; font-style: italic;">--end of script</span></pre>
      </td>
    </tr>
  </table>
</div>

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="sql" style="font-family:monospace;"><span style="color: #993333; font-weight: bold;">SET</span> pages <span style="color: #cc66cc;">9999</span>
<span style="color: #993333; font-weight: bold;">SET</span> <span style="color: #993333; font-weight: bold;">LINES</span> <span style="color: #cc66cc;">180</span>
<span style="color: #993333; font-weight: bold;">SET</span> hea off
spool grants_for_users_to_move<span style="color: #66cc66;">.</span><span style="color: #993333; font-weight: bold;">SQL</span>
<span style="color: #993333; font-weight: bold;">SELECT</span> <span style="color: #ff0000;">'grant '</span><span style="color: #66cc66;">||</span>granted_role<span style="color: #66cc66;">||</span><span style="color: #ff0000;">' to '</span><span style="color: #66cc66;">||</span>grantee<span style="color: #66cc66;">||</span><span style="color: #ff0000;">';'</span>
<span style="color: #993333; font-weight: bold;">FROM</span> dba_role_privs
<span style="color: #993333; font-weight: bold;">WHERE</span> grantee <span style="color: #993333; font-weight: bold;">NOT</span> <span style="color: #993333; font-weight: bold;">IN</span> <span style="color: #66cc66;">&#40;</span><span style="color: #ff0000;">'DBSNMP'</span><span style="color: #66cc66;">,</span><span style="color: #ff0000;">'OUTLN'</span><span style="color: #66cc66;">,</span><span style="color: #ff0000;">'SYS'</span><span style="color: #66cc66;">,</span><span style="color: #ff0000;">'SYSTEM'</span><span style="color: #66cc66;">&#41;</span>
<span style="color: #993333; font-weight: bold;">ORDER</span> <span style="color: #993333; font-weight: bold;">BY</span> grantee;
<span style="color: #808080; font-style: italic;">/*
select 'grant '||privilege||' on '||owner||'.'||table_name||
' to '||grantee||';'
from dba_tab_privs
where grantee not in ('DBSNMP','OUTLN','SYS','SYSTEM')
and owner not in ('SYS','SYSTEM','DBSNMP','OUTLN')
order by grantee;
*/</span>
spool off</pre>
      </td>
    </tr>
  </table>
</div>

Lembre-se que este script é útil quando há a possibilidade de acessar o banco de origem. Caso contrário, você terá que usar outro método para criar os usuários no banco de destino.

<!-- google_ad_section_end -->

 [1]: http://download.oracle.com/docs/cd/B19306_01/server.102/b14215/exp_imp.htm#i1023560
 [2]: http://download.oracle.com/docs/cd/B19306_01/relnotes.102/b15659/toc.htm
 [3]: http://download.oracle.com/docs/cd/B19306_01/relnotes.102/b19074/toc.htm
 [4]: http://linux.die.net/man/1/strings
 [5]: http://download.oracle.com/docs/cd/B19306_01/install.102/b15660/post_inst_task.htm#i1036714
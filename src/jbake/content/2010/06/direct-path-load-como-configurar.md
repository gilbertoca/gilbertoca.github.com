id=370
title=Direct Path Load - Como configurar 
date=2010-06-01 14:20:55
type=post
status=published
tags=Database, Linux, oracle
~~~~~~


> Verificando posts de [meu antigo blog][1] notei que alguns não foram importados ou foram importados com defeitos em seu conteúdo. Então resolvi realizar um trabalho de revisão e o **[terceiro][2]** começa hoje: 

Para que se possa usar a opção de [carga direta usando o SQL Load][3], você precisa primeiro configurar o banco de dados para tal atividade.  
A configuração é simples, basta você executar o script catldr.sql, localizado na instalação do produto, $ORACLE_HOME/rdbms/admin.  
Depois é só utilizar a opção direct=true na linha de comando.

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="bash" style="font-family:monospace;">oracle<span style="color: #000000; font-weight: bold;">@</span>SUGEP-DMASI:~<span style="color: #000000; font-weight: bold;">&gt;</span> sqlplus <span style="color: #000000; font-weight: bold;">/</span> <span style="color: #c20cb9; font-weight: bold;">as</span> sysdba
SQL<span style="color: #000000; font-weight: bold;">*</span>Plus: Release 10.2.0.1.0 - Production on Ter Jun <span style="color: #000000;">1</span> <span style="color: #000000;">17</span>:04:<span style="color: #000000;">20</span> <span style="color: #000000;">2010</span>
Copyright <span style="color: #7a0874; font-weight: bold;">&#40;</span>c<span style="color: #7a0874; font-weight: bold;">&#41;</span> <span style="color: #000000;">1982</span>, <span style="color: #000000;">2005</span>, Oracle.  All rights reserved.
Connected to:
Oracle Database 10g Enterprise Edition Release 10.2.0.1.0 - Production
With the Partitioning, OLAP and Data Mining options
SQL<span style="color: #000000; font-weight: bold;">&gt;</span> <span style="color: #000000; font-weight: bold;">!</span><span style="color: #c20cb9; font-weight: bold;">ls</span> <span style="color: #007800;">$ORACLE_HOME</span><span style="color: #000000; font-weight: bold;">/</span>rdbms<span style="color: #000000; font-weight: bold;">/</span>admin<span style="color: #000000; font-weight: bold;">/</span>catl<span style="color: #000000; font-weight: bold;">*</span>
<span style="color: #000000; font-weight: bold;">/</span>opt<span style="color: #000000; font-weight: bold;">/</span>oracle<span style="color: #000000; font-weight: bold;">/</span>db<span style="color: #000000; font-weight: bold;">/</span><span style="color: #000000;">10.2</span><span style="color: #000000; font-weight: bold;">/</span>server<span style="color: #000000; font-weight: bold;">/</span>rdbms<span style="color: #000000; font-weight: bold;">/</span>admin<span style="color: #000000; font-weight: bold;">/</span>catldap.sql  <span style="color: #000000; font-weight: bold;">/</span>opt<span style="color: #000000; font-weight: bold;">/</span>oracle<span style="color: #000000; font-weight: bold;">/</span>db<span style="color: #000000; font-weight: bold;">/</span><span style="color: #000000;">10.2</span><span style="color: #000000; font-weight: bold;">/</span>server<span style="color: #000000; font-weight: bold;">/</span>rdbms<span style="color: #000000; font-weight: bold;">/</span>admin<span style="color: #000000; font-weight: bold;">/</span>catlibc.sql
<span style="color: #000000; font-weight: bold;">/</span>opt<span style="color: #000000; font-weight: bold;">/</span>oracle<span style="color: #000000; font-weight: bold;">/</span>db<span style="color: #000000; font-weight: bold;">/</span><span style="color: #000000;">10.2</span><span style="color: #000000; font-weight: bold;">/</span>server<span style="color: #000000; font-weight: bold;">/</span>rdbms<span style="color: #000000; font-weight: bold;">/</span>admin<span style="color: #000000; font-weight: bold;">/</span>catldr.sql   <span style="color: #000000; font-weight: bold;">/</span>opt<span style="color: #000000; font-weight: bold;">/</span>oracle<span style="color: #000000; font-weight: bold;">/</span>db<span style="color: #000000; font-weight: bold;">/</span><span style="color: #000000;">10.2</span><span style="color: #000000; font-weight: bold;">/</span>server<span style="color: #000000; font-weight: bold;">/</span>rdbms<span style="color: #000000; font-weight: bold;">/</span>admin<span style="color: #000000; font-weight: bold;">/</span>catlsby.sql
&nbsp;
SQL<span style="color: #000000; font-weight: bold;">&gt;</span> <span style="color: #000000; font-weight: bold;">@/</span>opt<span style="color: #000000; font-weight: bold;">/</span>oracle<span style="color: #000000; font-weight: bold;">/</span>db<span style="color: #000000; font-weight: bold;">/</span><span style="color: #000000;">10.2</span><span style="color: #000000; font-weight: bold;">/</span>server<span style="color: #000000; font-weight: bold;">/</span>rdbms<span style="color: #000000; font-weight: bold;">/</span>admin<span style="color: #000000; font-weight: bold;">/</span>catldr.sql
.
.
View created.
Synonym created.
Grant succeeded.
&nbsp;
SQL<span style="color: #000000; font-weight: bold;">&gt;</span></pre>
      </td>
    </tr>
  </table>
</div></p> 



 [1]: http://www.jroller.com/gilbertoca
 [2]: http://www.jroller.com/gilbertoca/entry/direct_path_load_como_configurar
 [3]: http://download.oracle.com/docs/cd/B19306_01/server.102/b14215/ldr_modes.htm#i1007669
id=332
title=DBCA não encontra o banco de dados
date=2010-04-07 17:45:28
type=post
status=published
tags=Database,Linux,oracle
~~~~~~


Após fazer alguns exercícios de clonagem de banco(através do dbconsole, dbca e manualmente), procurei fazer uma limpeza dos mesmos. Para minha surpresa, o DBCA não lista algumas instâncias clonadas manualmente para que eu possa removê-las. 

Isso ocorre porque o DBCA procura por instâncias através do arquivo oratab, encontrado no diretório /etc/oratab. Então, para que o mesmo identifique as que eu clonei, basta acrescentar neste arquivo as que estão faltando: 

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="bash" style="font-family:monospace;">oracle<span style="color: #000000; font-weight: bold;">@</span>oracleibm:~<span style="color: #000000; font-weight: bold;">&gt;</span> <span style="color: #c20cb9; font-weight: bold;">vi</span> <span style="color: #000000; font-weight: bold;">/</span>etc<span style="color: #000000; font-weight: bold;">/</span>oratab
&nbsp;
<span style="color: #666666; font-style: italic;"># A colon, ':', is used as the field terminator.  A new line terminates</span>
<span style="color: #666666; font-style: italic;"># the entry.  Lines beginning with a pound sign, '#', are comments.</span>
<span style="color: #666666; font-style: italic;">#</span>
<span style="color: #666666; font-style: italic;"># Entries are of the form:</span>
<span style="color: #666666; font-style: italic;">#   $ORACLE_SID:$ORACLE_HOME::</span>
<span style="color: #666666; font-style: italic;">#</span>
<span style="color: #666666; font-style: italic;"># The first and second fields are the system identifier and home</span>
<span style="color: #666666; font-style: italic;"># directory of the database respectively.  The third filed indicates</span>
<span style="color: #666666; font-style: italic;"># to the dbstart utility that the database should , "Y", or should not,</span>
<span style="color: #666666; font-style: italic;"># "N", be brought up at system boot time.</span>
<span style="color: #666666; font-style: italic;">#</span>
<span style="color: #666666; font-style: italic;"># Multiple entries with the same $ORACLE_SID are not allowed.</span>
<span style="color: #666666; font-style: italic;">#</span>
<span style="color: #666666; font-style: italic;">#</span>
producao:<span style="color: #000000; font-weight: bold;">/</span>opt<span style="color: #000000; font-weight: bold;">/</span>oracle<span style="color: #000000; font-weight: bold;">/</span>db<span style="color: #000000; font-weight: bold;">/</span>10.2.0.1.0<span style="color: #000000; font-weight: bold;">/</span>server:Y
alfa:<span style="color: #000000; font-weight: bold;">/</span>opt<span style="color: #000000; font-weight: bold;">/</span>oracle<span style="color: #000000; font-weight: bold;">/</span>db<span style="color: #000000; font-weight: bold;">/</span>10.2.0.1.0<span style="color: #000000; font-weight: bold;">/</span>server:Y</pre>
      </td>
    </tr>
  </table>
</div>


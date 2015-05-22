id=362
title=SQL*Loader - Números decimais 
date=2010-05-31 16:30:31
type=post
status=published
tags=Database, Linux, oracle
~~~~~~


> Verificando posts de [meu antigo blog][1] notei que alguns não foram importados ou foram importados com defeitos em seu conteúdo. Então resolvi realizar um trabalho de revisão e o **[segundo][2]** começa hoje: 

Se burrice matasse, já estária morto! Calma vou explicar. Estou fazendo carga de um sistema legado (migração). E algumas tabelas contém colunas com o [tipo de dado NUMBER][3](15,6), mas os dados podem vir nulos, inteiros ou decimais.  
Inicialmente pensei que ele ([sqlldr][4]) faria a conversão, mas ..

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="sql" style="font-family:monospace;">Record <span style="color: #cc66cc;">1</span>: Rejected <span style="color: #66cc66;">-</span> Error <span style="color: #993333; font-weight: bold;">ON</span> <span style="color: #993333; font-weight: bold;">TABLE</span> VANTAGENS_TMP<span style="color: #66cc66;">,</span> <span style="color: #993333; font-weight: bold;">COLUMN</span> VALOR<span style="color: #66cc66;">.</span>
ORA<span style="color: #66cc66;">-</span>01722: invalid <span style="color: #993333; font-weight: bold;">NUMBER</span>
Record <span style="color: #cc66cc;">2</span>: Rejected <span style="color: #66cc66;">-</span> Error <span style="color: #993333; font-weight: bold;">ON</span> <span style="color: #993333; font-weight: bold;">TABLE</span> VANTAGENS_TMP<span style="color: #66cc66;">,</span> <span style="color: #993333; font-weight: bold;">COLUMN</span> VALOR<span style="color: #66cc66;">.</span>
ORA<span style="color: #66cc66;">-</span>01722: invalid <span style="color: #993333; font-weight: bold;">NUMBER</span></pre>
      </td>
    </tr>
  </table>
</div></p> 

Depois tentei colocar [tipos específicos no control file][5] para estas colunas, como por exemplo [INTEGER, INTEGER EXTERNAL, DECIMAL(15,6)][6]. Mas todas as tentativas acabavam com:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="sql" style="font-family:monospace;">Record <span style="color: #cc66cc;">29</span>: Rejected <span style="color: #66cc66;">-</span> Error <span style="color: #993333; font-weight: bold;">ON</span> <span style="color: #993333; font-weight: bold;">TABLE</span> VANTAGENS_TMP<span style="color: #66cc66;">,</span> <span style="color: #993333; font-weight: bold;">COLUMN</span> VALOR<span style="color: #66cc66;">.</span>
ORA<span style="color: #66cc66;">-</span>01460: unimplemented <span style="color: #993333; font-weight: bold;">OR</span> unreasonable conversion requested</pre>
      </td>
    </tr>
  </table>
</div></p> 

A solução, foi tão simples que estou até com vergonha de dizer. Bom, praticamente todas as atividades que você faz através de uma sessão sql, são regidas pela [variável de ambiente NLS_LANG][7]. Pois é, você ajusta esta variável e todas que dependem dela, quer dizer, NLS_* vão assumir valores pre-definidos. Aí você fala: Qual é a novidade? A novidade é que se você fizer uma customização em qualquer uma das [outras variáveis][8] (que foi o caso do bonitão aqui), você terá que assumir as consequências. Enquanto estava fazendo um teste com procedimento ajustei uma destas variáveis:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="bash" style="font-family:monospace;"><span style="color: #7a0874; font-weight: bold;">export</span> <span style="color: #007800;">NLS_NUMERIC_CHARACTERS</span>=,.</pre>
      </td>
    </tr>
  </table>
</div></p> 

Bom, foi só trocar os sinais que conversão implícita funcionou. Mas uma coisa, uma dica é colocar o tipo do character set no [control file][9] através do parametro CHARACTERSET, assim você não depende da configuração do ambiente para fazer carga.



 [1]: http://www.jroller.com/gilbertoca
 [2]: http://www.jroller.com/gilbertoca/entry/sql_load_n%C3%BAmeros_decimais
 [3]: http://download.oracle.com/docs/cd/B19306_01/server.102/b14200/sql_elements001.htm#SQLRF00222
 [4]: http://download.oracle.com/docs/cd/B19306_01/server.102/b14215/part_ldr.htm#g996849
 [5]: http://download.oracle.com/docs/cd/B19306_01/server.102/b14215/ldr_field_list.htm
 [6]: http://download.oracle.com/docs/cd/B19306_01/server.102/b14215/ldr_field_list.htm#sthref948
 [7]: http://download.oracle.com/docs/cd/B19306_01/install.102/b25149/app_gblsupp.htm#sthref469
 [8]: http://download.oracle.com/docs/cd/B19306_01/server.102/b14225/ch3globenv.htm#sthref316
 [9]: http://download.oracle.com/docs/cd/B19306_01/server.102/b14215/ldr_control_file.htm#i1006645
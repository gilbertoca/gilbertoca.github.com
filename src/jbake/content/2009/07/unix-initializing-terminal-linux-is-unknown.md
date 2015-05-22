id=117
title=Unix: Initializing..Terminal linux is unknown. 
date=2009-07-09 11:14:47
type=post
status=published
tags=AIX, console, Database, Linux
~~~~~~

Nosso banco de dados atual está instalado em uma máquina unix - AIX 5.3. Mas por estar acostumado com ambientes Linux, instalei para o mesmo, o[ pacote de ferramentas Linux][1] que a [IBM ][2]disponibiliza. Funciona muito bem, mas quando executo um binário unix - exemplo: topas - o shell responde que esse erro.  
A solução é ajustar a variável TERM para xterm, nesse caso é claro, pois utilizo um ambiente gráfico para acessar o servidor. Não sei se funcionaria acessando de um terminal texto.

<pre>
<code class="bash">
        export TERM=xterm
</code>
</pre>





 [1]: http://www-03.ibm.com/systems/power/software/aix/linux/
 [2]: http://www.ibm.com/pt/pt/
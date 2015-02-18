id=225
title='Oracle IAS [An error occurred while talking to OPMN. Could not find entity for]'
status=published
type=post
guid=http://blog.gilbertoca.com/?p=225
permalink=/?p=225
dsq_thread_id=
  - 3503808728
tags=
  - Application Server
  - Linux
  - Unix
tags=
  - Application Server
  - Linux
  - Sistema Operacional
~~~~~~
<!-- google_ad_section_start -->

O servidor de aplicações Oracle (IAS 10g) não inicia, o enterprise manager reporta um erro que não diz muito:

> An error occurred while talking to OPMN. Could not find entity for &#8220;nome do servidor&#8221; 

Os arquivos de log necessários são:

  * $ORACLE_HOME/opmn/logs/ons.log
  * $ORACLE_HOME/opmn/logs/opmn.log
  * $ORACLE_HOME/opmn/logs/ipm.log

O único que mostrou algo de errado foi ipm.log:  
`<br />
cat ipm.log<br />
09/10/19 10:18:09 [2] BIND (Address already in use)<br />
09/10/19 10:18:09 [2] 127.0.0.1:6101 - listener BIND failed<br />
09/10/19 10:18:09 [4] Thread do listener 98311: 127.0.0.1:6101 (0x442) está sendo encerrado<br />
09/10/19 10:18:09 [1] Listener local encerrado<br />
`  
A solução foi fechar todas a aplicações oracle em execução e verificar pelo utilitário **[ps][1]** a existência de algum ainda rodando, para fechá-lo também.

<!-- google_ad_section_end -->

 [1]: http://linux.die.net/man/1/ps
id=13
title=Como obter histórico de dados modificados no banco de dados Oracle?
date=2008-06-04 18:09:43
type=post
status=published
tags=Auditoria, banco de dados, configuração, Data Mining, Database, oracle
~~~~~~
<!-- google_ad_section_start -->

Na verdade a pergunta original, em inglês, é essa: [How can you get the history of data modified from an Oracle database?][1]  
Gosto das dicas desse autor. Essa em questão, nos dá as opções existentes para captura de histórico de modificações no banco de dado. 

  1. Depois do fato ocorrido
podemos “minerar” nossos logs de arquivamento usando o utilitário oracle Log Miner;

  * Antes do fato ocorrido
podemos configurar a auditoria para registrar essas atividades. Com auditoria, registramos as ações ocorridas em tabelas no banco e então consultar tal tabela de registros em qualquer época futura.

</ol> <!-- google_ad_section_end -->

 [1]: http://searchoracle.techtarget.com/expert/KnowledgebaseAnswer/0,289625,sid41_gci1313625,00.html?track=NL-94&#038;ad=643910&asrc=EM_NLT_3776659&uid=2562960
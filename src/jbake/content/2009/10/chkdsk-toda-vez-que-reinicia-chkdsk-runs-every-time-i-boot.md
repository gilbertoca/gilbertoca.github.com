id=216
title=CHKDSK toda vez que reinicia (CHKDSK runs every time I boot)!
date=2009-10-16 22:18:28
type=post
status=published
tags= Sistema Operacional, Windows
~~~~~~


Esse parece ser um problema comum e caso você não o tenha encontrado, pode ficar tranquilo. Sua vez vai chegar!  
A solução que funcionou para mim, encontrei neste [fórum][1]. Vou deixar registrado pois sei que outros usuários também precisarão:

  * 1. click no menu iniciar e abra a janela de execução;
  * 2. digite “cmd” e enter (nota: não use aspas);
  * 3. depois digite “fsutil dirty query e:”;
  * 4. se a mensagem de retorno indicar que o volume está SUJO vá para o passo 5; 
  * 5. depois digite “chkdsk e: /f /x”;
  * 6. com a finalização repita o passo 3;
  * 7. se não mais indicar que está SUJO então reinicie e não verá mais a mensagem de agendamento do CHKDSK.

<pre>Microsoft Windows XP [versão 5.1.2600]
(C) Copyright 1985-2001 Microsoft Corp.

C:Documents and SettingsGilberto>fsutil dirty query e:
O volume e: está sujo.

C:Documents and SettingsGilberto>chkdsk e: /f /x
O tipo do sistema de arquivos é NTFS.
Volume desmontado. Todos os identificadores abertos para esse volume agora são i
nválidos.
O rótulo de volume é Disco local.

CHKDSK está verificando os arquivos e pastas (etapa 1 de 3)...
Verificação de arquivos concluída.
CHKDSK está verificando índices (etapa 2 de 3)...
Verificação dos índices concluída.
CHKDSK está verificando os descritores de segurança (etapa 3 de 3)...
Verificação de descritores de segurança concluída.
O Windows verificou o sistema de arquivos e não encontrou problemas.

  58878224 KB de espaço total em disco.
   7342712 KB em 18820 arquivos.
     11708 KB em 4861 índices.
         0 KB em setores defeituosos.
     96752 KB em uso pelo sistema.
     65536 KB ocupados pelo arquivo de log.
  51427052 KB disponíveis em disco.

      4096 bytes em cada unidade de alocação.
  14719556 total de unidades de alocação no disco.
  12856763 unidades de alocação disponíveis em disco.

C:Documents and SettingsGilberto>fsutil dirty query e:
O volume e: NÃO está sujo.
</pre>



 [1]: http://www.pcreview.co.uk/forums/thread-72388.php
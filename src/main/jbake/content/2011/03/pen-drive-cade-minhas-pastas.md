id=601
title=pen drive - Cadê minhas pastas? 
date=2011-03-25 22:17:58
type=post
status=published
tags=Sistema Operacional, Virus, Windows
~~~~~~

Meus problemas com <a href="http://pt.wikipedia.org/wiki/V%C3%ADrus_de_computador" target="_blank">vírus de computador</a>, 
aqui em casa, já se tornaram história. Não me lembro quando foi a última vez que 
tive o trabalho de criar um <a href="http://www.ubcd4win.com/howto.htm" target="_blank">CD para boot do Windows XP</a> 
e a partir dele realizar a limpeza - isso não é totalmente verdade, volta e meia 
tenho que fazer isso para <a href="http://pt.wikipedia.org/wiki/Laptop" target="_blank">NoteBooks</a> 
de colegas ou de colegas de minha esposa. 

Recentemente, algo tem chamado minha atenção; vira e mexe aparece minha esposa 
com bolso cheio de <a href="http://pt.wikipedia.org/wiki/USB_flash_drive" target="_blank">pen-drives</a> 
solicitando que eu recupere documentos e pastas que desapareceram nestes 
dispositivos que, por sinal, são bem mais úteis que os velhos disquetes. E 
aquela dica(para o windows explorer): Menu->Ferramentas->Opções de Pastas->[aba]Modo de exibição, 
depois marcar a opção “Mostrar pastas e arquivos ocultos”, não adianta.  


<div id="attachment_608" style="width: 864px" class="wp-caption alignright">
  <a href="MostrarOcultos.png"><img src:"MostrarOcultos.png" alt="Menu->Ferramentas->Outras Opções" title="MostrarOcultos" width="854" height="639" class="size-full wp-image-608" /></a>
  
  <p class="wp-caption-text">
    Mostrar arquivos ocultos
  </p>
</div>

  
Parece que alguns vírus mais recentes alteram não só o atributo oculto mas também o atributo morto. E ai, o arquivo morre? <img src="http://blog.gilbertoca.com/wp-includes/images/smilies/icon_smile.gif" alt=":)" class="wp-smiley" /> 

Ai você pergunta: por que sua esposa traz os dispositivos pra você? por que ela não pede ao pessoal para passar um <a href="http://pt.wikipedia.org/wiki/Antiv%C3%ADrus" target="_blank">antivírus</a>? Veja, eles fazem a varredura. Mas os arquivos e pastas continuam ocultos e minha esposa já havia tido uma experiência em casa onde o pen-drive que usava, mesmo infectado, aparecia todos os arquivos e pastas - <a href="http://live.gnome.org/Nautilus" target="_blank">o gerenciador de arquivos do Gnome (Nautilus)</a> - apresenta todos os arquivo e pastas, inclusive os criados pelo vírus.  


<div id="attachment_612" style="width: 1034px" class="wp-caption alignright">
  <a href="NavegadorArquivosGnome.png"><img src:"NavegadorArquivosGnome.png" alt="Navegador de arquivos do Gnome - nautilus" title="NavegadorArquivosGnome" width="1024" height="768" class="size-full wp-image-612" /></a>
  
  <p class="wp-caption-text">
    Navegador de arquivos do Gnome - nautilus
  </p>
</div>

Bem, esta dica não é para usuários <a href="http://pt.wikipedia.org/wiki/Linux" target="_blank">linux</a>! Então vamos à solução? Para resolver você precisa conhecer o <a href="http://pt.wikipedia.org/wiki/Cmd.exe" target="_blank">prompt de comando do windows xp</a>, em especial o comando <a href="http://pt.wikipedia.org/wiki/Attrib" target="_blank">ATTRIB</a>. Para acioná-lo faço o seguinte: menu iniciar->Todos programas->Acessórios->Prompt de comando.  


<div id="attachment_614" style="width: 1031px" class="wp-caption alignright">
  <a href="PromptComando.png"><img src:"PromptComando.png" alt="prompt de comando do windows xp" title="PromptComando" width="1021" height="669" class="size-full wp-image-614" /></a>
  
  <p class="wp-caption-text">
    prompt de comando do windows xp
  </p>
</div>

  
Criei uma pasta para demonstração a qual contém uma sub-pasta e um arquivo texto. 

Primeiro, vou fazer o mesmo que alguns vírus fazem(nem tudo, é claro, apenas o que está relacionado com esta dica, ok?):  


<div id="attachment_616" style="width: 1030px" class="wp-caption alignright">
  <a href="ComandoATTRIB.png"><img src:"ComandoATTRIB.png" alt="prompt de comando do windows - usando ATTRIB" title="ComandoATTRIB" width="1020" height="660" class="size-full wp-image-616" /></a>
  
  <p class="wp-caption-text">
    prompt de comando do windows - usando ATTRIB
  </p>
</div>

  
E em seguida, desfazerei as alterações retornando os atributos com seus valores normais para arquivos e pastas.  
Perceba como é o uso dos sinais + e - diante dos parâmetros. Usamos o sinal negativo (-) para retirar um atributo do arquivo/pasta, neste caso o A(morto) e H(oculto). Então, ficou assim:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="cmd" style="font-family:monospace;">C:\Demonstracao&gt;ATTRIB -A -H /D /S *.*
C:\Demonstracao&gt;</pre>
      </td>
    </tr>
  </table>
</div>

**[29/03/2011] Atualização**: em alguns casos, o vírus também seta o atributo “arquivo do sistema”. Para resolver é só acrescentar o parâmentro que corresponde a este atributo: S. Ficando assim todo o comando:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="cmd" style="font-family:monospace;"> ATTRIB -A -H -S /D /S *.*</pre>
      </td>
    </tr>
  </table>
</div>

**[02/07/2013] Atualização**: O Ivans Dias, em um dos comentários, colocou um vídeo do <a href="http://www.professorramos.com" title="Professor Ramos" target="_blank">Professor Ramos</a> bem didático - <a href="http://www.professorramos.com/video.php?id=187" title="Vírus de Pendrive - Como recuperar seus Arquivos Perdidos ou Ocultados de forma Simples" target="_blank">vale a pena conferir.</a>

Um abração a todos!



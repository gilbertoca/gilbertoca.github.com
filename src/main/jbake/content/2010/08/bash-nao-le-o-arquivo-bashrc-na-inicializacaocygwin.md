id=441
title=bash não lê o arquivo .bashrc na inicialização[Cygwin] 
date=2010-08-24 16:43:22
type=post
status=published
tags=console, cygwin, Java, Linux, Windows
~~~~~~

Uso a bastante tempo o ambiente [Cygwin ][1]em casa. Recentemente realizei a 
atualização para a versão 1.7. Por enquanto nenhuma queixa, tudo funcionando 
normalmente. Hoje resolvi me aventurar e customizar o console utilizado como 
padrão - cmd.exe. Para isso tomei como base o seguinte artigo: 
[Useful Configuration of Cygwin, Part 1: Install, rxvt, and BASH][2]. Fiz 
todos os ajustes recomendados e fui realizar o teste, mas por algum motivo 
meu arquivo .bashrc - de ajustes do ambiente bash - não era carregado na 
inicialização do [Cygwin][1]. 

Bom, resolvi verificar o problema e primeira parada foi a [FAQ][3] do projeto. 
Chequei meu ambiente como sugerido pela documentação, mas no entanto não conseguia 
fazer funcionar. A segunda opção foi pesquisar na lista de discussão: 
[logo de primeira encontrei a solução do problema][4]. O arquivo .bash_profile 
precisa conter:

<pre>
<code class="bash">
    . "${HOME}"/.bashrc
</code>
</pre>

**ATUALIZAÇÃO:**

Mais um problema que encontrei, não relacionado com o ambiente bash, mas ao 
utilitário que o usa - rxvt. Com a atualização do Cygwin, o atalho criado não 
funciona, alias, o utilitário não encontra o ambiente bash. Para resolver é 
fácil: coloque o caminho absoluto do ambiente bash. Da seguinte forma:

<pre>
<code class="bash">
    C:cygwinbinrxvt.exe -sl 1500 -fn "Lucida Console-12" -bg black -fg grey -sr -e /bin/bash --login -i
</code>
</pre>

 [1]: http://cygwin.com
 [2]: http://infrablue.tripod.com/cygwin.html
 [3]: http://cygwin.com/faq/faq-nochunks.html#faq.using.bashrc
 [4]: http://old.nabble.com/bash-load-td18529958.html
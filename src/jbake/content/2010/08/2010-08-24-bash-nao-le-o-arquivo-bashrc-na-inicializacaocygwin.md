id=
title=bash não lê o arquivo .bashrc na inicialização[Cygwin] 
date=2010-08-24 16:43:22
type=post
status=published
tags=configuração, console, cygwin, Java, Linux, Windows, Windows XP
~~~~~~
<!-- google_ad_section_start -->

Uso a bastante tempo o ambiente [Cygwin ][1]em casa. Recentemente realizei a atualização para a versão 1.7. Por enquanto nenhuma queixa, tudo funcionando normalmente. Hoje resolvi me aventurar e customizar o console utilizado como padrão - cmd.exe. Para isso tomei como base o seguinte artigo: [Useful Configuration of Cygwin, Part 1: Install, rxvt, and BASH][2]. Fiz todos os ajustes recomendados e fui realizar o teste, mas por algum motivo meu arquivo .bashrc - de ajustes do ambiente bash - não era carregado na inicialização do [Cygwin][1]. 

Bom, resolvi verificar o problema e primeira parada foi a [FAQ][3] do projeto. Chequei meu ambiente como sugerido pela documentação, mas no entanto não conseguia fazer funcionar. A segunda opção foi pesquisar na lista de discussão: [logo de primeira encontrei a solução do problema][4]. O arquivo .bash_profile precisa conter:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="bash" style="font-family:monospace;">. <span style="color: #ff0000;">"<span style="color: #007800;">${HOME}</span>"</span><span style="color: #000000; font-weight: bold;">/</span>.bashrc</pre>
      </td>
    </tr>
  </table>
</div></p> 

**ATUALIZAÇÃO:**

Mais um problema que encontrei, não relacionado com o ambiente bash, mas ao utilitário que o usa - rxvt. Com a atualização do Cygwin, o atalho criado não funciona, alias, o utilitário não encontra o ambiente bash. Para resolver é fácil: coloque o caminho absoluto do ambiente bash. Da seguinte forma:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="bash" style="font-family:monospace;">C:cygwinbinrxvt.exe <span style="color: #660033;">-sl</span> <span style="color: #000000;">1500</span> <span style="color: #660033;">-fn</span> <span style="color: #ff0000;">"Lucida Console-12"</span> <span style="color: #660033;">-bg</span> black <span style="color: #660033;">-fg</span> grey <span style="color: #660033;">-sr</span> <span style="color: #660033;">-e</span> <span style="color: #000000; font-weight: bold;">/</span>bin<span style="color: #000000; font-weight: bold;">/</span><span style="color: #c20cb9; font-weight: bold;">bash</span> <span style="color: #660033;">--login</span> <span style="color: #660033;">-i</span></pre>
      </td>
    </tr>
  </table>
</div></p> 

<!-- google_ad_section_end -->

 [1]: http://cygwin.com
 [2]: http://infrablue.tripod.com/cygwin.html
 [3]: http://cygwin.com/faq/faq-nochunks.html#faq.using.bashrc
 [4]: http://old.nabble.com/bash-load-td18529958.html
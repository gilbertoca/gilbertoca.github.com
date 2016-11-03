id=948
title=Como baixar um site web inteiro - wget 
date=2012-09-20 10:31:34
type=post
status=published
tags= Internet, Linux, openSUSE, Windows
~~~~~~


Na verdade, a pergunta correta seria: como baixar todas as páginas - e seus recursos (css, javascript, imagem, etc) - de um site web?  
Após uma <a href="http://superuser.com/questions/14403/how-can-i-download-an-entire-website" title="pesquisa" target="_blank">breve pesquisa</a>, fiquei surpreso ao saber que possuía a ferramenta adequada para essa tarefa, mas ao mesmo tempo decepcionado comigo mesmo por se tratar de um utilitário que uso a um bom tempo - aquela velha história, compra-se um produto mas não se importa em usar todo o seu potencial.  
O <a href="http://www.gnu.org/software/wget/" title="wget" target="_blank">Wget</a> é uma ferramenta de linha de comando bem clássica para este tipo de tarefa. Ele vem com a maioria dos sistemas Unix/Linux, há versão para o Windows também (mais recente <a href="http://opensourcepack.blogspot.com.br/2010/05/wget-112-for-windows.html" title="wget para windows" target="_blank">está disponível aqui</a>).  
Assim temos:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="bash" style="font-family:monospace;"><span style="color: #c20cb9; font-weight: bold;">wget</span> <span style="color: #660033;">-r</span> <span style="color: #660033;">--no-parent</span> http:<span style="color: #000000; font-weight: bold;">//</span>site.com<span style="color: #000000; font-weight: bold;">/</span>pdfs<span style="color: #000000; font-weight: bold;">/</span></pre>
      </td>
    </tr>
  </table>
</div>

Aqui mais dois ótimos sites como exemplo:

  * <a href="http://linuxreviews.org/quicktips/wget/" target="_blank">http://linuxreviews.org/quicktips/wget/</a>
  * <a href="http://www.krazyworks.com/?p=591" target="_blank">http://www.krazyworks.com/?p=591</a>


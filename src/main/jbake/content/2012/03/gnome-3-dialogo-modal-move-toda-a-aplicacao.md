id=855
title=Gnome 3 - diálogo modal move toda a aplicação 
date=2012-03-02 17:36:28
type=post
status=published
tags=Geral
~~~~~~


É, finalmente consegui um tempo para postar algo aqui no blog. Ultimamente (nos dois últimos meses) estive ocupado trabalhando na conversão de alguns projetos java para web: usavam Ant e agora, este trabalho, usam Maven. Neste período, <a href="http://blog.gilbertoca.com/?p=415" target="_blank">como vocês bem sabem</a>, fiz a atualização (na verdade uma nova instalação) do [openSUSE][1]. Estava com a versão 11.3 e com o recente lançamento da <a href="http://software.openSUSE.org/121/en" target="_blank">versão 12.1</a>, não resisti - ansioso por usar o novo <a href="http://www.gnome.org/gnome-3/" target="_blank">Gnome 3</a>. 

A mudança foi um pouco impactante mais pro lado positivo, diferente de outras experiências que tenho ouvido e lido a respeito. Bem, espero ajudar os novos adeptos a este ambiente gráfico por aqui: postando dicas e links para solucionar eventuais embaraços por assim dizer nesta jornada de aprendizado.  
Vamos começar com um link bem útil: <a href="https://live.gnome.org/GnomeShell/CheatSheet" title="GnomeShell-CheatSheet" target="_blank">GnomeShell/CheatSheet</a> . 

Agora algo que atrapalha um pouco: toda vez que precisamos abrir uma janela modal, tipo “Open File”, “Print”, esta mesma janela modal é anexada (colada mesmo!) à janela principal da aplicação(Evince, Firefox, NetBeans, Empathy, etc) tornando-a uma só. Isso é contra produtivo pois em algumas situações precisamos fazer um “copy and paste” de informações na janela principal da aplicação - ocorre muito com o Evince e com NetBeans no meu caso.  
No GNOME 3, o comportamento padrão de diálogo modal é este anexar-se à janela principal da aplicação, mas este comportamento pode ser customizado, veja:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="bash" style="font-family:monospace;">gconftool-<span style="color: #000000;">2</span> <span style="color: #660033;">--set</span> <span style="color: #000000; font-weight: bold;">/</span>desktop<span style="color: #000000; font-weight: bold;">/</span>gnome<span style="color: #000000; font-weight: bold;">/</span>shell<span style="color: #000000; font-weight: bold;">/</span>windows<span style="color: #000000; font-weight: bold;">/</span>attach_modal_dialogs <span style="color: #c20cb9; font-weight: bold;">false</span> <span style="color: #660033;">--type</span> bool</pre>
      </td>
    </tr>
  </table>
</div>

Para desabilitar. E o contrário:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="bash" style="font-family:monospace;">gconftool-<span style="color: #000000;">2</span> <span style="color: #660033;">--set</span> <span style="color: #000000; font-weight: bold;">/</span>desktop<span style="color: #000000; font-weight: bold;">/</span>gnome<span style="color: #000000; font-weight: bold;">/</span>shell<span style="color: #000000; font-weight: bold;">/</span>windows<span style="color: #000000; font-weight: bold;">/</span>attach_modal_dialogs <span style="color: #c20cb9; font-weight: bold;">true</span> <span style="color: #660033;">--type</span> bool</pre>
      </td>
    </tr>
  </table>
</div></p> 

**Referência:The GNOME Shell Blog - <a href="http://gnomeshell.wordpress.com/2011/09/10/the-modal-windows-behavior/" title="the-modal-windows-behavior" target="_blank">The modal windows behavior</a>**



 [1]: http://www.openSUSE.org
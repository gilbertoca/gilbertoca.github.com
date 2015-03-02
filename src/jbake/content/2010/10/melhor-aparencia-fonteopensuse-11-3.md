id=452
title=Melhor aparência (fonte)[OpenSuSe 11.3] 
date=2010-10-22 16:12:35
type=post
status=published
tags=configuração, desktop, Geral, Linux, opensuse
~~~~~~
<!-- google_ad_section_start -->

Sexta-feira, final de tarde! Um bom motivo para me aventurar em uma área que costumo deixar de lado: configuração do desktop. Primeiro as fontes! Percebo que as fontes não são exibidas de forma suave e elas estão bem pequenas devido a minha resolução de vídeo - 1152&#215;864. Vou seguir [a seguinte dica][1], descrita por Fahad: 

  1. precisamos instalar o [pacote freetype2][2]. Veja se já instalou:  
    ![Status da instalação do pacote freetype2][3] 
  2. faça o seguinte ajuste em</p> <div class="wp_syntax">
      <table>
        <tr>
          <td class="line_numbers">
            <pre>1
2
3
</pre>
          </td>
          
          <td class="code">
            <pre class="properties" style="font-family:monospace;">Configure Desktop &gt; Appearance &gt; Fonts
* <span style="color: #933;">"Use anti-aliasing for fonts"</span> &gt; enabled
* <span style="color: #933;">"Force fonts DPI"</span> &gt; <span style="">96</span></pre>
          </td>
        </tr>
      </table>
    </div>

  3. faça o seguinte ajuste em (através do botão ” Configure”)</p> <div class="wp_syntax">
      <table>
        <tr>
          <td class="line_numbers">
            <pre>1
2
3
</pre>
          </td>
          
          <td class="code">
            <pre class="properties" style="font-family:monospace;"><span style="color: #933;">"Configure Anti-aliasing Settings"</span> &gt;
* <span style="color: #933;">"Use sub-pixel rendering:"</span> &gt; RGB
* <span style="color: #933;">"Hinting style:"</span> &gt; full</pre>
          </td>
        </tr>
      </table>
    </div>

Depois de sair (log ou) e entrar (log in) novamente, você vai notar que o KDE irá exibir as fontes mais suaves.  
Depois escolhi outras fontes e aumentei o tamanho. Ficou um beleza!  
![Uma amostra de configuração][4]

<!-- google_ad_section_end -->

 [1]: http://www.linuxcrunch.com/content/font-smoothing-opensuse-112
 [2]: http://software.opensuse.org/search?q=freetype2&#038;baseproject=openSUSE%3A11.3&#038;lang=en&#038;exclude_filter=home%3A&#038;exclude_debug=true
 [3]: http://dl.dropbox.com/u/9093640/yast2.png
 [4]: http://dl.dropbox.com/u/9093640/Fonts.png
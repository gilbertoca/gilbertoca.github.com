id=296
title=Unir legenda (srt) e video (avi) com MENCODER
date=2010-03-12 17:45:17
type=post
status=published
tags=Diversão,  Linux, openSUSE
~~~~~~


Quem tiver um video e o arquivo de legenda e deseja unir ambos num aquivo o comando é este : 

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="bash" style="font-family:monospace;">mencoder <span style="color: #660033;">-oac</span> mp3lame <span style="color: #660033;">-ovc</span> lavc <span style="color: #660033;">-sub</span> legenda.srt video.avi <span style="color: #660033;">-o</span> videocomlegenda.avi</pre>
      </td>
    </tr>
  </table>
</div>

Sintaxe :

  1. \# mencoder ( programa que acompanha o mplayer capaz de ripar e outras coisas )
  2. \# -oac (Qual sera o codec de audio no arquivo que seja criado, usando a opção help é possivel ter uma lista ex.: <div class="wp_syntax">
      <table>
        <tr>
          <td class="code">
            <pre class="bash" style="font-family:monospace;">mencoder <span style="color: #660033;">-oac</span> <span style="color: #7a0874; font-weight: bold;">help</span></pre>
          </td>
        </tr>
      </table>
    </div>
    
    )</li> 
    
      * \# -ovc (Qual sera o codec de video no arquivo que seja criado, usando a opção help é possivel ter uma lista ex.: <div class="wp_syntax">
          <table>
            <tr>
              <td class="code">
                <pre class="bash" style="font-family:monospace;">mencoder <span style="color: #660033;">-ovc</span> <span style="color: #7a0874; font-weight: bold;">help</span></pre>
              </td>
            </tr>
          </table>
        </div>
        
        )</li> 
        
          * \# -sub ( para especificar o arquivo de legendas )
          * \# -o ( arquivo de saida que sera gerado)</ol> 
        
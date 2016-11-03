id=484
title=Sumiu os botões maximizar,minimizar,fechar[openSUSE 11.3] 
date=2010-12-30 18:22:16
type=post
status=published
tags=desktop,  gnome, Linux, openSUSE, Sistema Operacional
~~~~~~


Este comportamento do gerenciador de janelas é esquisito, para não dizer indesejável. A coisa fica mais estranha ainda pois não tenho meios de rastrear a causa do problema (placa de vídeo, kernel, gnome, gdm qual é o cupido?). Alguém pode, em algumas situações, acusar o compiz, mas este não o caso - placa legada:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="bash" style="font-family:monospace;">dhcppc0:<span style="color: #000000; font-weight: bold;">/</span>home<span style="color: #000000; font-weight: bold;">/</span>gilberto <span style="color: #666666; font-style: italic;"># hwinfo --gfxcard </span>
<span style="color: #000000;">21</span>: PCI<span style="color: #7a0874; font-weight: bold;">&#40;</span>AGP<span style="color: #7a0874; font-weight: bold;">&#41;</span> <span style="color: #000000;">100.0</span>: 0300 VGA compatible controller <span style="color: #7a0874; font-weight: bold;">&#40;</span>VGA<span style="color: #7a0874; font-weight: bold;">&#41;</span>        
  <span style="color: #7a0874; font-weight: bold;">&#91;</span>Created at pci.318<span style="color: #7a0874; font-weight: bold;">&#93;</span>
  Unique ID: VCu0.UZW4QWn62T6
  Parent ID: vSkL.uvrveDpO5n6
  SysFS ID: <span style="color: #000000; font-weight: bold;">/</span>devices<span style="color: #000000; font-weight: bold;">/</span>pci0000:00<span style="color: #000000; font-weight: bold;">/</span>0000:00:<span style="color: #000000;">01.0</span><span style="color: #000000; font-weight: bold;">/</span>0000:01:<span style="color: #000000;">00.0</span>
  SysFS BusID: 0000:01:<span style="color: #000000;">00.0</span>
  Hardware Class: graphics card
  Model: <span style="color: #ff0000;">"nVidia GeForce4 MX 440 with AGP8X"</span>
  Vendor: pci 0x10de <span style="color: #ff0000;">"nVidia Corporation"</span>
  Device: pci 0x0181 <span style="color: #ff0000;">"GeForce4 MX 440 with AGP8X"</span>
  Revision: 0xc1
  Driver: <span style="color: #ff0000;">"nvidia"</span>
  Driver Modules: <span style="color: #ff0000;">"nvidia"</span></pre>
      </td>
    </tr>
  </table>
</div></p> 

Assim que estalei o openSUSE 11.3 em casa ficou difícil evitar seu uso e olha que minha família ainda não viu - ou não usufruiu - das ferramentas gráficas pois ficamos aproximadamente 3 meses usando o [driver de vídeo que vem instalado por padrão][1] - O projeto Nouveau. Só recentemente a Nvidia publicou uma atualização [para minha placa de vídeo][2] e é claro para a minha versão do kernel. 

Bom, até agora podemos dizer que o problema não é hardware. Por que? Você pode perguntar. Veja, usei dois tipos de driver e com ambos o comportamento (defeito) persistiu. O pior é que fica dias sem aparecer e de repente acontece. Até então não havia outro meio de contornar o problema senão encerrar a sessão e entrar novamente. Hoje encontrei [uma discussão sobre o assunto][3] - Adivinha? Aconteceu hoje novamente - e nessa discussão o usuário “Rvos” sugere o seguinte contorno:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="sql" style="font-family:monospace;">Tente alt<span style="color: #66cc66;">+</span>f2<span style="color: #66cc66;">,</span> depois digite metacity <span style="color: #808080; font-style: italic;">--replace</span></pre>
      </td>
    </tr>
  </table>
</div>

Com essa opção não tenho que encerra a sessão para que as janelas voltem ao normal. 

Mas &#8230; como vamos explicar essa solução para meu filho de 9 anos ou mesmo para minha esposa?  
Sei que farão com bastante tranquilidade quando estiver por perto, mas quando não estiver? 

**ATUALIZAÇÃO (25/06/2011):**  
Após um longo período sem este problema, aconteceu novamente: desta vez enquanto usava o [qBittorrent][4].  
[Esta discussão][5] pode revelar algum caminho para resolução deste problema. Com o comando sugerido, verifiquei a minha configuração:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="bash" style="font-family:monospace;">gilberto<span style="color: #000000; font-weight: bold;">@</span>dhcppc0:~<span style="color: #000000; font-weight: bold;">&gt;</span> gconftool-<span style="color: #000000;">2</span> <span style="color: #660033;">-R</span> <span style="color: #000000; font-weight: bold;">/</span>desktop<span style="color: #000000; font-weight: bold;">/</span>gnome<span style="color: #000000; font-weight: bold;">/</span>session
 required_components_list = <span style="color: #7a0874; font-weight: bold;">&#91;</span>windowmanager,panel,filemanager<span style="color: #7a0874; font-weight: bold;">&#93;</span>
 default_session = <span style="color: #7a0874; font-weight: bold;">&#91;</span>gnome-settings-daemon<span style="color: #7a0874; font-weight: bold;">&#93;</span>
 idle_delay = <span style="color: #000000;">90</span>
 <span style="color: #000000; font-weight: bold;">/</span>desktop<span style="color: #000000; font-weight: bold;">/</span>gnome<span style="color: #000000; font-weight: bold;">/</span>session<span style="color: #000000; font-weight: bold;">/</span>required_components:
  filemanager = nautilus
  windowmanager = gnome-wm
  panel = gnome-panel</pre>
      </td>
    </tr>
  </table>
</div>

E com outro ajustei para o sugerido:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="bash" style="font-family:monospace;">gilberto<span style="color: #000000; font-weight: bold;">@</span>dhcppc0:~<span style="color: #000000; font-weight: bold;">&gt;</span> gconftool-<span style="color: #000000;">2</span> <span style="color: #660033;">-s</span> <span style="color: #660033;">-t</span> string <span style="color: #000000; font-weight: bold;">/</span>desktop<span style="color: #000000; font-weight: bold;">/</span>gnome<span style="color: #000000; font-weight: bold;">/</span>session<span style="color: #000000; font-weight: bold;">/</span>required_components<span style="color: #000000; font-weight: bold;">/</span>windowmanager <span style="color: #ff0000;">"metacity"</span></pre>
      </td>
    </tr>
  </table>
</div>

Vamos aguardar e torcer! <img src="http://blog.gilbertoca.com/wp-includes/images/smilies/icon_smile.gif" alt=":)" class="wp-smiley" /> 

**ATUALIZAÇÃO (31/12/2010):**  
Aconteceu novamente. Desta vez enquanto verificava a lista de contatos no [Empathy][6]. O mais complicado foi constatar que este problema afeta a digitação. Ao utilizar as teclas de atalho - alt + f2 - não aconteceu nada, a tela de execução de aplicativos não apareceu. Utilizei o menu iniciar para acionar o prompt de comando - terminal gnome - que logo apareceu, mas não recebia qualquer digitação. O que fazer? Fui abrindo - através do menu iniciar - aplicativos que pudessem receber digitação, mas nenhum respondia. Então tentei a caixa de texto para pesquisa do próprio menu iniciar:  
![Caixa de texto para pesquisa, menu iniciar.][7] 

Com isso, fiz uma cópia do texto - ctrl+c - e adicionei um ícone no [painel principal][8], aquela grande barra no rodapé da tela, para acionar o Executar Aplicativo:  
![adicionar ao painel][9]  
Observe que a imagem traz o botão de fechar, isso porque fiz a captura da tela agora depois de todo o processo. Com o ícone disponível foi só acioná-lo e colar - ctrl+v - o comando (metacity -replace) e executar. Pronto, Voltou ao normal! Até quando? <img src="http://blog.gilbertoca.com/wp-includes/images/smilies/icon_sad.gif" alt=":(" class="wp-smiley" />



 [1]: http://nouveau.freedesktop.org/wiki/
 [2]: http://www.nvidia.com/object/linux-display-ia32-96.43.19-driver.html
 [3]: http://ubuntuforum-br.org/index.php?topic=69863.msg388780#msg388780
 [4]: http://qbittorrent.sourceforge.net/
 [5]: http://forums.fedoraforum.org/archive/index.php/t-241590.html
 [6]: http://live.gnome.org/Empathy
 [7]: http://dl.dropbox.com/u/9093640/imagem1.png
 [8]: http://pt.wikipedia.org/wiki/Gnome-panel
 [9]: http://dl.dropbox.com/u/9093640/adicionar_ao_painel.png
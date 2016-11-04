id=415
title=Empathy não conectando ao MSN
date=2010-06-22 10:28:24
type=post
status=published
tags=Empathy,  gnome, jabber, Linux, msn
~~~~~~


Recentimente resolvi, novamente, atualizar o gnome da versão 2.28 para 2.30 através do procedimento descrito neste endereço: <http://en.openSUSE.org/GNOME/2.30> .  Como sempre sem problemas. <a href="http://www.gnome.org/" target="_blank">O gnome</a> é um ambiente bastante consistente e a meu ver seguro! Mas um componente que uso como meio de comunicação - <a href="http://live.gnome.org/Empathy" target="_blank">Empathy</a> - começou a apresentar um erro conexão usando o protocolo MSN. Não havia percebido tal problema porque até então só tinha utilizado o <a href="http://pt.wikipedia.org/wiki/Extensible_Messaging_and_Presence_Protocol" target="_blank">protocolo Jabber</a>.

Bem, após uma pesquisa pelo google, <a href="http://ubuntu-utah.ubuntuforums.org/showpost.php?p=8058121&postcount=9" target="_blank">encontrei a solução do problema</a>: desisntalar o *pacote telepathy-butterfly. *Lembrando que há a necessidade de fechar o programa antes de remover este componente.

> **Atualização(13/12/2011):** Hoje, após uma atualização, o empathy parou de conectar. Voltando <a href="http://forums.openSUSE.org/english/get-technical-help-here/applications/467973-empathy-not-working-msn-2.html#post2417727" target="_blank">àquela discussão no forum openSUSE</a>, notei que a solução é bem mais simples:
> 
> <div class="wp_syntax">
>   <table>
>     <tr>
>       <td class="code">
>         <pre class="bash" style="font-family:monospace;">- Remova sua conta<span style="color: #7a0874; font-weight: bold;">&#40;</span>Remove your live account<span style="color: #7a0874; font-weight: bold;">&#41;</span>.
- Sair <span style="color: #000000; font-weight: bold;">do</span> Empathy<span style="color: #7a0874; font-weight: bold;">&#40;</span>Exit from Empathy<span style="color: #7a0874; font-weight: bold;">&#41;</span>
- Desinstalar o pacote <span style="color: #7a0874; font-weight: bold;">&#40;</span>Remove telepathy-butterfly<span style="color: #7a0874; font-weight: bold;">&#41;</span>
- Encerrar sua sessão<span style="color: #000000; font-weight: bold;">/</span>Entrar em uma nova sessão<span style="color: #7a0874; font-weight: bold;">&#40;</span>logout<span style="color: #000000; font-weight: bold;">/</span><span style="color: #c20cb9; font-weight: bold;">login</span><span style="color: #7a0874; font-weight: bold;">&#41;</span>
- Adicione sua conta MSN novamente<span style="color: #7a0874; font-weight: bold;">&#40;</span>Enter your account again<span style="color: #7a0874; font-weight: bold;">&#41;</span>
- Marque a opção Método Http<span style="color: #7a0874; font-weight: bold;">&#40;</span>mark the Http Method option<span style="color: #7a0874; font-weight: bold;">&#41;</span></pre>
>       </td>
>     </tr>
>   </table>
> </div>
> 
> [<img src="empathy_msn-300x240.png"  title="Empathy MSN" width="300" height="240" class="alignnone size-medium wp-image-850" />][1]  
> Lembre-se: você precisa fechar o aplicativo(Empathy). 

> **Atualização(28/11/2011):** No trabalho já estou utilizando o openSUSE 12.1 (adaptando-me ao novo jeito do gnome 3). Este gerenciador de mensagens, novamente, veio com problema para conectar ao protocolo MSN. Desta vez não precisamos desinstalar nada, apenas realizar uma pequena modificação em uma biblioteca que o acompanha. <a href="http://forums.openSUSE.org/english/get-technical-help-here/applications/467973-empathy-not-working-msn.html#post2405889" title="Empathy not working with MSN" target="_blank">Edite o seguinte arquivo da biblioteca ql</a>:
> 
> <div class="wp_syntax">
>   <table>
>     <tr>
>       <td class="code">
>         <pre class="bash" style="font-family:monospace;">gilberto<span style="color: #000000; font-weight: bold;">@</span>SUGEP265338:~<span style="color: #000000; font-weight: bold;">&gt;</span> <span style="color: #c20cb9; font-weight: bold;">sudo</span> <span style="color: #c20cb9; font-weight: bold;">vi</span> <span style="color: #000000; font-weight: bold;">/</span>usr<span style="color: #000000; font-weight: bold;">/</span>lib<span style="color: #000000; font-weight: bold;">/</span>python2.7<span style="color: #000000; font-weight: bold;">/</span>site-packages<span style="color: #000000; font-weight: bold;">/</span>papyon<span style="color: #000000; font-weight: bold;">/</span>service<span style="color: #000000; font-weight: bold;">/</span>description<span style="color: #000000; font-weight: bold;">/</span>AB<span style="color: #000000; font-weight: bold;">/</span>__init__.py</pre>
>       </td>
>     </tr>
>   </table>
> </div>
> 
> e faça a seguinte modificação:
> 
> <div class="wp_syntax">
>   <table>
>     <tr>
>       <td class="code">
>         <pre class="vim" style="font-family:monospace;">#url = <span style="color: #C5A22D;">"http://contacts.msn.com/abservice/abservice.asmx"</span>
url = <span style="color: #C5A22D;">"http://local-bay.contacts.msn.com/abservice/abservice.asmx"</span></pre>
>       </td>
>     </tr>
>   </table>
> </div>
> 
> Lembre-se: você precisa fechar o aplicativo(Empathy). 

Espero que esta informação ajude a outros colegas usuários linux.



 [1]: empathy_msn.png
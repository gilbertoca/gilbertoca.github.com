id=818
title=Usando comando GREP em documentos Word, OpenOffice ou LibreOffice
date=2011-11-10 10:24:01
type=post
status=published
tags=comandos, console, grep, Linux, openSUSE, Sistema Operacional
~~~~~~


Esta é uma pequena dica. Se você tem uma grande quantidade de arquivos MS Word, OpenOffice e agora LibreOffice, com certeza já teve a necessidade de utilizar os recursos que o Shell Linux/Unix nos trás - grep, sed, more, strings, <a href="http://www.wagner.pp.ru/~vitus/software/catdoc/" title="catdoc" target="_blank">catdoc</a>, <a href="http://www.winfield.demon.nl/" title="antiwork" target="_blank">antiwork</a>, etc. 

Como vocês bem sabem, gerencio o grupo <a href="http://groups.google.com/group/ibmp-mensagens-reflexivas" title="Mensagens Reflexivas" target="_blank">Mensagens Reflexivas</a> e neste fim de semana - aos sábados editamos as mensagens - me deparei que tal necessidade: procurar em vários arquivos docs por um nome, neste caso, por um autor. 

Bem, aqui está a dica:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="bash" style="font-family:monospace;">&nbsp;
gilberto<span style="color: #000000; font-weight: bold;">@</span>SUGEP-DMASI:~<span style="color: #000000; font-weight: bold;">/</span>Dropbox<span style="color: #000000; font-weight: bold;">/</span>igreja-bmp<span style="color: #000000; font-weight: bold;">/</span>mensagens<span style="color: #000000; font-weight: bold;">/</span>ENVIADAS$ <span style="color: #c20cb9; font-weight: bold;">ls</span> <span style="color: #660033;">-1</span> <span style="color: #000000; font-weight: bold;">|</span> <span style="color: #c20cb9; font-weight: bold;">wc</span> <span style="color: #660033;">-l</span>
<span style="color: #000000;">167</span>
&nbsp;
gilberto<span style="color: #000000; font-weight: bold;">@</span>SUGEP-DMASI:~<span style="color: #000000; font-weight: bold;">/</span>Dropbox<span style="color: #000000; font-weight: bold;">/</span>igreja-bmp<span style="color: #000000; font-weight: bold;">/</span>mensagens<span style="color: #000000; font-weight: bold;">/</span>ENVIADAS$ antiword <span style="color: #000000; font-weight: bold;">*</span>.doc <span style="color: #000000; font-weight: bold;">|</span> <span style="color: #c20cb9; font-weight: bold;">grep</span> <span style="color: #660033;">-i</span> <span style="color: #ff0000;">"João Garcia"</span> <span style="color: #000000; font-weight: bold;">|</span> <span style="color: #c20cb9; font-weight: bold;">more</span>
<span style="color: #000000; font-weight: bold;">|</span>Autor: João Garcia, Oakville,      <span style="color: #000000; font-weight: bold;">|</span>Prezado amigo, caso queira interagir  <span style="color: #000000; font-weight: bold;">|</span>
<span style="color: #000000; font-weight: bold;">|</span>Autor: João Garcia, Oakville,      <span style="color: #000000; font-weight: bold;">|</span>Prezado amigo, caso queira interagir  <span style="color: #000000; font-weight: bold;">|</span>
<span style="color: #000000; font-weight: bold;">|</span>Autor: João Garcia, Oakville,      <span style="color: #000000; font-weight: bold;">|</span>Prezado amigo, caso queira interagir  <span style="color: #000000; font-weight: bold;">|</span>
<span style="color: #000000; font-weight: bold;">|</span>Autor: João Garcia, Oakville,      <span style="color: #000000; font-weight: bold;">|</span>Prezado amigo, caso queira interagir  <span style="color: #000000; font-weight: bold;">|</span>
<span style="color: #000000; font-weight: bold;">|</span>Autor: João Garcia, Oakville,      <span style="color: #000000; font-weight: bold;">|</span>Prezado amigo, caso queira interagir  <span style="color: #000000; font-weight: bold;">|</span>
<span style="color: #000000; font-weight: bold;">|</span>Autor: João Garcia, Oakville,      <span style="color: #000000; font-weight: bold;">|</span>Prezado amigo, caso queira interagir  <span style="color: #000000; font-weight: bold;">|</span>
<span style="color: #000000; font-weight: bold;">|</span>Autor: João Garcia, Oakville,      <span style="color: #000000; font-weight: bold;">|</span>Prezado amigo, caso queira interagir  <span style="color: #000000; font-weight: bold;">|</span>
<span style="color: #000000; font-weight: bold;">|</span>Autor: João Garcia, Oakville,   <span style="color: #000000; font-weight: bold;">|</span>Prezado amigo, caso queira interagir      <span style="color: #000000; font-weight: bold;">|</span>
<span style="color: #000000; font-weight: bold;">|</span>Autor: João Garcia, Oakville -     <span style="color: #000000; font-weight: bold;">|</span>Prezado amigo, caso queira interagir<span style="color: #000000; font-weight: bold;">|</span>
<span style="color: #000000; font-weight: bold;">|</span>Autor: João Garcia, Oakville,   <span style="color: #000000; font-weight: bold;">|</span>Prezado amigo, caso queira interagir     <span style="color: #000000; font-weight: bold;">|</span></pre>
      </td>
    </tr>
  </table>
</div></p> 

Uma busca pela rede mundial usando o Google ajuda muito nessas horas.

  * <a href="http://superuser.com/questions/70343/grep-in-microsoft-word" title="Grep in Microsoft Word?" target="_blank">Grep in Microsoft Word?</a>

**Agora é descobrir como listar o nome dos arquivos. Alguém se habilita?**


title='umount= /mnt/XXXX= device is busy'
date=2010-02-24 16:09:27
type=post
status=published
tags=Database, Linux, opensuse, Sistema Operacional, Unix
~~~~~~
<!-- google_ad_section_start -->

Você está cansado de ver estas mensagens, dizendo que você não pode desmountar /mnt/cdrom ou /mnt/flash? Veja esta pequena tática:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="bash" style="font-family:monospace;">lsof <span style="color: #000000; font-weight: bold;">|</span> <span style="color: #c20cb9; font-weight: bold;">grep</span> <span style="color: #000000; font-weight: bold;">/</span>mnt<span style="color: #000000; font-weight: bold;">/</span>cdrom</pre>
      </td>
    </tr>
  </table>
</div>

A sáida será o(s) processo(s) que estão usando este dispositivo. Agora pare ou derrube o processo. Outra opção:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="bash" style="font-family:monospace;"><span style="color: #c20cb9; font-weight: bold;">fuser</span> <span style="color: #660033;">-muv</span> <span style="color: #000000; font-weight: bold;">/</span>mnt<span style="color: #000000; font-weight: bold;">/</span>cdrom</pre>
      </td>
    </tr>
  </table>
</div>

O qual irá listar conta de usuário, PID, etc usando o dispositivo montado em /mnt/cdrom. 

<!-- google_ad_section_end -->
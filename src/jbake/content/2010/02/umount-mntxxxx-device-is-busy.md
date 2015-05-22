id=286
title=umount: /mnt/XXXX device is busy 
date=2010-02-24 16:09:27
type=post
status=published
tags=Database, Linux, openSUSE, Sistema Operacional
~~~~~~

Você está cansado de ver estas mensagens, dizendo que você não pode 
desmountar <code>/mnt/cdrom</code> ou <code>/mnt/flash</code>? Veja esta 
pequena tática:

<pre>
<code class="bash">
    lsof | grep /mnt/cdrom
</code>
</pre>


A sáida será o(s) processo(s) que estão usando este dispositivo. Agora pare ou 
derrube o processo. Outra opção:

<pre>
<code class="bash">
    fuser -muv /mnt/cdrom
</code>
</pre>

O qual irá listar conta de usuário, PID, etc usando o dispositivo montado 
em <code>/mnt/cdrom</code>. 
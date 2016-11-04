id=739
title=Removendo itens pré-definidos da barra lateral(sidebar) iNove template
date=2011-06-15 23:03:40
type=post
status=published
tags= Internet, Tema, Wordpress
~~~~~~


Há algum tempo venho tentando personalizar a barra lateral(sidebar) do tema([iNove template][1]) que adotei pro blog. Mas quando adiciono, por exemplo, um widget no sidebar Norte ele aparece duplicado. 

Hoje encontrei uma [discussão sobre o assunto][2] e finalmente a solução. Veja, como estão definidos os widgets para este tema:

  1. North sidebar: Recent Posts, WP-RecentComments, Tag Cloud
  2. South sidebar: Meta
  3. West sidebar: Archives
  4. East sidebar: Categories

Então, se você quiser remover o widget Archives:

  1. escolha Appearance->Widgets
  2. selecione west_sidebar
  3. arraste um widget Text para o sidebar selecionado e salve
[<img src="delete_archives_widget.png" alt:"delete archives widget" title="delete_archives_widget" width="436" height="712" class="aligncenter size-full wp-image-744" />][3] </ol> 

Colocando um widget de Text vazio faz a mágica. Foi o que coloquei em cada sidebar! Desta forma pude personalizar o primeiro(North sidebar)  
[<img src="Widgets_personalizado.png" alt:"Widgets_personalizado" title="Widgets_personalizado" width="436" height="712" class="aligncenter size-full wp-image-744" />][3]



 [1]: http://www.neoease.com/inove/
 [2]: http://wordpress.org/support/topic/removing-sidebar-items-in-inove-template
 [3]: delete_archives_widget.png
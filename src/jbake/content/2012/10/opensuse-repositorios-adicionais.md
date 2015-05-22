id=956
title=openSUSE - Repositórios adicionais 
date=2012-10-09 10:42:36
type=post
status=published
tags= Linux, openSUSE, Sistema Operacional, Yast
~~~~~~


Vira e mexe (entre uma instalação e outra, ou um upgrade e outro) preciso adicionar alguns repositórios(repository) ao <a href="http://pt.openSUSE.org/YaST_Software_Management" title="Yast" target="_blank">Yast</a> para aplicativos que costumo utilizar. Registro logo abaixo os que não podem faltar: 

<table border="1">
  <tr>
    <td>
      <strong>Nome</strong>
    </td>
    
    <td>
      <strong>Como adicionar</strong>
    </td>
  </tr>
  
  <tr>
    <td>
      <a href="https://www.virtualbox.org/" title="VirtualBox" target="_blank">VirtualBox</a>
    </td>
    
    <td>
      zypper addrepo -r http://download.virtualbox.org/virtualbox/rpm/openSUSE/11.4/virtualbox.repo
    </td>
  </tr>
  
  <tr>
    <td>
      Fonts
    </td>
    
    <td>
      zypper addrepo -r http://download.openSUSE.org/repositories/M17N:/fonts/openSUSE_12.2/M17N:fonts.repo
    </td>
  </tr>
  
  <tr>
    <td>
      <a href="https://www.google.com/intl/pt-BR/chrome/browser/?hl:pt-BR" title="Google Chrome" target="_blank">Google Chrome</a>
    </td>
    
    <td>
      zypper ar -f -n Google-Chrome http://dl.google.com/linux/chrome/rpm/stable/x86_64 Google-Chrome
    </td>
  </tr>
  
  <tr>
    <td>
      <a href="http://openSUSE-community.org/Restricted_formats/12.2" title="Restricted Formats" target="_blank">Restricted formats</a>
    </td>
    
    <td>
      zypper addrepo -r http://packman.inode.at/suse/12.2/packman.repo<br /> zypper addrepo -r http://www.openSUSE-guide.org/repo/12.2/libdvdcss.repo
    </td>
  </tr>
</table>

</> 

E aí, quais você mais usa?


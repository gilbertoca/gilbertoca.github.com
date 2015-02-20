title='Linux &#8211; Participação no domínio do Windows'
date=2011-07-15 22=27=44
type=post
status=published
tags=
,Active Directory
,configuração
,kerberos
,Linux
,opensuse
,Sistema Operacional
,Windows
~~~~~~
<!-- google_ad_section_start -->

> Eu não quero compartilhar aquivo nenhum, apenas quero me logar no dominio MS, para assim usar internet, e-mail, enfim tudo que uma estação d trabalho com XP faria quando ngressa no dominio!  
> Eu não quero criar um server com samba sem ser PDC E deixar na rede, quero apenas ao inves de usar o XP como estação de trabalho usar o openSUSE! 

Este pedido de ajuda está registrado <a href="http://www.vivaolinux.com.br/topico/Suse/Linux-em-dominio-Windows" title="Linux em dominio Windows" target="_blank">aqui</a> na comunidade <a href="http://www.vivaolinux.com.br/" title="Viva o Linux" target="_blank">vivaolinux</a>. 

Apesar de ser uma discussão antiga, ainda assim é bom fazer um passo a passo deste procedimento. Antes devo relatar que aqui na secretaria usamos <a href="http://technet.microsoft.com/pt-br/library/cc668412.aspx" title="Active Directory" target="_blank">Active Directory</a> para autenticação, então foi esse ambiente que usei para testar a inclusão de uma estação <a href="http://pt.opensuse.org/Portal:Distribui%C3%A7%C3%A3o" title="OpenSUSE" target="_blank">Linux OpenSUSE</a> em um Domínio Windows: 

  1. Registrar seu controlador de domínio(DC) na lista de nomes de máquinas. Adicione todo o nome qualificado primeiro e o apelido como alias: 192.168.1.2 = server.domain.com server  
    [<img src="http://blog.gilbertoca.com/wp-content/uploads/1-register_domain_controler_machine_hosts.png" alt="" title="1-register_domain_controler_machine_hosts" width="1024" height="768" class="alignright size-full wp-image-769" />][1] 
  2. Editar o arquivo /etc/resolv.conf e adicionar seu DC como nameserver: nameserver = server.domain.com  
    [<img src="http://blog.gilbertoca.com/wp-content/uploads/2-edit_etc_resolver_conf_add_DC_as_nameserver.png" alt="" title="2-edit_etc_resolver_conf_add_DC_as_nameserver" width="1024" height="768" class="alignright size-full wp-image-770" />][2] 
  3. Configure o kerberos através do yast: o realm deverá ser escrito em letra maiúscula: DOMAIN.COM  
    [<img src="http://blog.gilbertoca.com/wp-content/uploads/3-configure_kerberos_capitalletters_for_DC.png" alt="" title="3-configure_kerberos_capitalletters_for_DC" width="1024" height="768" class="alignright size-full wp-image-771" />][3] 
  4. Configura o samba  
    [<img src="http://blog.gilbertoca.com/wp-content/uploads/4-samba_DC_none_workgroupname_domain_security_ads_realms.png" alt="" title="4-samba_DC_none_workgroupname_domain_security_ads_realms" width="1024" height="768" class="alignright size-full wp-image-772" />][4]</p> <div class="wp_syntax">
      <table>
        <tr>
          <td class="code">
            <pre class="vim" style="font-family:monospace;">SUGEP265338<span style="color: #000000;">:~</span> # <span style="color: #668080;">more</span> <span style="color: #000000;">/</span>etc<span style="color: #000000;">/</span>samba<span style="color: #000000;">/</span>smb<span style="color: #000000;">.</span>conf 
# smb<span style="color: #000000;">.</span>conf <span style="color: #668080;">is</span> the main Samba configuration file<span style="color: #000000;">.</span> You find a full commented
# version at <span style="color: #000000;">/</span>usr<span style="color: #000000;">/</span>share<span style="color: #000000;">/</span>doc<span style="color: #000000;">/</span>packages<span style="color: #000000;">/</span>samba<span style="color: #000000;">/</span>examples<span style="color: #000000;">/</span>smb<span style="color: #000000;">.</span>conf<span style="color: #000000;">.</span>SUSE <span style="color: #804040;">if</span> the
# samba<span style="color: #000000;">-</span>doc package <span style="color: #668080;">is</span> installed<span style="color: #000000;">.</span>
# Date<span style="color: #000000;">:</span> <span style="color: #000000; font-weight:bold;">2011</span><span style="color: #000000;">-</span><span style="color: #000000; font-weight:bold;">11</span><span style="color: #000000;">-</span>02
<span style="color: #000000;">&#91;</span>global<span style="color: #000000;">&#93;</span>
	<span style="color: #25BB4D;">add</span> machine script = <span style="color: #000000;">/</span>usr<span style="color: #000000;">/</span>sbin<span style="color: #000000;">/</span>useradd <span style="color: #000000;">-</span>c Machine <span style="color: #000000;">-</span>d <span style="color: #000000;">/</span>var<span style="color: #000000;">/</span>lib<span style="color: #000000;">/</span>nobody <span style="color: #000000;">-</span>s <span style="color: #000000;">/</span><span style="color: #668080;">bin</span><span style="color: #000000;">/</span>false <span style="color: #000000;">%</span>m<span style="color: #000000;">$</span>
	domain master = No
	security = ADS
	workgroup = ADMINISTRACAO
	realm = ADMINISTRACAO<span style="color: #000000;">.</span>LOCAL
	idmap gid = <span style="color: #000000; font-weight:bold;">10000</span><span style="color: #000000;">-</span><span style="color: #000000; font-weight:bold;">20000</span>
	idmap uid = <span style="color: #000000; font-weight:bold;">10000</span><span style="color: #000000;">-</span><span style="color: #000000; font-weight:bold;">20000</span>
	usershare allow guests = No
	template homedir = <span style="color: #000000;">/</span>home<span style="color: #000000;">/%</span>D<span style="color: #000000;">/%</span>U
	winbind refresh tickets = yes
	template <span style="color: #668080;">shell</span> = <span style="color: #000000;">/</span><span style="color: #668080;">bin</span><span style="color: #000000;">/</span>bash
<span style="color: #000000;">&#91;</span>homes<span style="color: #000000;">&#93;</span>
	comment = Home Directories
	valid users = <span style="color: #000000;">%</span>S, <span style="color: #000000;">%</span>D<span style="color: #000000;">%</span>w<span style="color: #000000;">%</span>S
	browseable = No
	read only = No
	inherit acls = Yes
<span style="color: #000000;">&#91;</span>profiles<span style="color: #000000;">&#93;</span>
<span style="color: #000000;">--</span>More<span style="color: #000000;">--</span><span style="color: #000000;">&#40;</span><span style="color: #000000; font-weight:bold;">51</span><span style="color: #000000;">%</span><span style="color: #000000;">&#41;</span></pre>
          </td>
        </tr>
      </table>
    </div>
    
    Não esqueça de reiniciar os serviços  
    [<img src="http://blog.gilbertoca.com/wp-content/uploads/5-restart_samba_server.png" alt="" title="5-restart_samba_server" width="1024" height="768" class="alignright size-full wp-image-773" />][5] </li> 
    
      * Adicionar a máquina ao domínio (neste momento utilizando o kerberos)  
        [<img src="http://blog.gilbertoca.com/wp-content/uploads/6-test_kerberos_autentication.png" alt="" title="6-test_kerberos_autentication" width="1024" height="768" class="alignright size-full wp-image-774" />][6]</p> 
        net ads join -U Administrador  
        [<img src="http://blog.gilbertoca.com/wp-content/uploads/7-join_ads_domain.png" alt="" title="7-join_ads_domain" width="1024" height="768" class="alignright size-full wp-image-775" />][7] </li> 
        
          * Adicionar a máquina ao domínio (agora utilizando o samba): no yast use a opção:&#8221;Participação no domínio do windows&#8221;, marcando a opção &#8220;Usar informação SMB para autenticação Linux&#8221;  
            [<img src="http://blog.gilbertoca.com/wp-content/uploads/8-windows_domain_membership.png" alt="" title="8-windows_domain_membership" width="1024" height="768" class="alignright size-full wp-image-776" />][8] 
          * Reinicie a máquina  
            [<img src="http://blog.gilbertoca.com/wp-content/uploads/9-reboot_linux_client.png" alt="" title="9-reboot_linux_client" width="1024" height="768" class="alignright size-full wp-image-777" />][9] </ol> 
        
        Use com moderação! <img src="http://blog.gilbertoca.com/wp-includes/images/smilies/icon_smile.gif" alt=":)" class="wp-smiley" /> 
        
        <!-- google_ad_section_end -->

 [1]: http://blog.gilbertoca.com/wp-content/uploads/1-register_domain_controler_machine_hosts.png
 [2]: http://blog.gilbertoca.com/wp-content/uploads/2-edit_etc_resolver_conf_add_DC_as_nameserver.png
 [3]: http://blog.gilbertoca.com/wp-content/uploads/3-configure_kerberos_capitalletters_for_DC.png
 [4]: http://blog.gilbertoca.com/wp-content/uploads/4-samba_DC_none_workgroupname_domain_security_ads_realms.png
 [5]: http://blog.gilbertoca.com/wp-content/uploads/5-restart_samba_server.png
 [6]: http://blog.gilbertoca.com/wp-content/uploads/6-test_kerberos_autentication.png
 [7]: http://blog.gilbertoca.com/wp-content/uploads/7-join_ads_domain.png
 [8]: http://blog.gilbertoca.com/wp-content/uploads/8-windows_domain_membership.png
 [9]: http://blog.gilbertoca.com/wp-content/uploads/9-reboot_linux_client.png
id=432
title=Alterne entre versões Java facilmente [Netbeans 6.*] 
date=2010-07-21 14:22:40
type=post
status=published
tags=desenvolvimento,  Java, Linux, maven, openSUSE, Sistema Operacional
~~~~~~


Outro dia escrevi como [alterner entre versões Java facilmente][1] utilizando o utilitário de sistema operacional [update-alternatives][2]. Aquele post tem uma perspectiva do lado do servidor onde estão instalados servidores de aplicação java ou mesmo aplicativos e o administrador/desenvolvedor precisa testar como estes artefatos mencionados se comportariam em cada versão. 

Hoje vou relatar outra maneira de alternar entre versões java em perspectiva do lado do desenvolvedor. Aqui na secretaria, podemos escolher entre [Netbeans][3] e [Eclipse][4] como ambientes de desenvolvimento, desde que o projeto seja gerenciado pela ferramenta de construção [Maven][5]. 

Minha escolha, assim como de mais alguns colegas foi o [Netbeans][6] 6.8. Vejamos então como configurar o IDE Netbeans para facilitar a traca de versões java para compilar ou rodar aplicativos.  
Tanto para configurar ou mesmo alternar a versão do java utilizado pode-se utilizar o seguinte caminho:  
Project&#8217;s properties->Build:compile .  
A partir deste diálogo, você poderá alternar de versão através “Java Plataform” ou gerenciar/adicionar/remover versões através da opção “Manage Java Plataforms”  
[<img src="compile_option-300x225.png"  title="compile_option" width="300" height="225" class="alignleft size-medium wp-image-436" />][7]  
Lembrando que antes disso precisamos instalar as versões que desejamos utilizar.



 [1]: http://blog.gilbertoca.com/?p=383
 [2]: http://man.he.net/man8/update-alternatives
 [3]: http://www.netbeans.org
 [4]: http://www.eclipse.org
 [5]: http://maven.apache.org
 [6]: http://netbeans.org/index.html
 [7]: compile_option.png
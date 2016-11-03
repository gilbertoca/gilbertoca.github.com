id=1123
title=Visualizando arquivos de log no NetBeans
date=2014-12-05 09:26:55
type=post
status=published
tags=desenvolvimento,  Java, NetBeans, Traduções
~~~~~~

*Disponível na Internet. <a href="https://blogs.oracle.com/NetBeansSupport/entry/netbeans_ide_log_file" target="_blank">Viewing log files in NetBeans IDE</a>
Arquivo capturado em 05 de dezembro de 2014*


Os diferentes arquivos de log que o usuário do NetBeans necessita verificar em caso de problema, e como visualizá-los através do próprio IDE:

  * O arquivo de log do NetBeans: Para visualizar o conteúdo deste arquivo acesse Menu Principal -> Exibir -> Log do IDE (ou diretamente $netbeans_userdir/var/log/messages.log). O conteúdo aparece na janela de saída com o título log do IDE
  * Os arquivos de log de Servidor: Para visualizar os arquivos de log de Servidor, mude para janela Serviços, expanda o nó Servidores, clique com o botão direito do mouse sobre o nó da instância, e selecione &#8216;Exibir Log do Servidor&#8217;.
  * Por exemplo, para o servidor de aplicações GlassFish Server Open Source que vem na instalação do NetBeans, na janela Serviços, expanda o nó Servidores -> GlassFish V4 e clique com o botão direito do mouse, e selecione &#8216;Exibir Log do Servidor&#8217;. O conteúdo aparece na janela de saída sob aba de título glassFish V4.
  * Observe que para um Servidor Tomcat registrado, clicar com o botão direito do mouse e selecionar &#8216;Visualizar saída do servidor&#8217;, exibirá o arquivo de log do servidor definido no arquivo de configuração server.xml. Este menu fica disponpível quando o servidor estiver em execução.


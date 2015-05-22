id=6
title=Oracle JInitiator + Forms + IE6/IE7 + Windows Live Toolbar : Problema
date=2009-03-06 15:43:35
type=post
status=published
tags=Application Server
~~~~~~


Essa combinação é bombástica! Aqui na secretaria, alguns usuários inadivertidadmente instalaram o IE7 e com isso, em conjunto, veio o Windows Live Toolbar. Depois disso, nenhuma aplicação forms funciona, derrubando o navegador. Segundo [essa][1] discussão o problema todo está nesse complemento ao IE. Então a solução é: 

  * Remova Windows Live Toolbar;
  * Remova JInitiator;
  * Reinstale JInitiator. 

Na maioria dos casos, só a remoção de todos os complementos com a tag Messenger resolve.



 [1]: http://www.experts-exchange.com/Database/Oracle/9.x/Q_22572754.html
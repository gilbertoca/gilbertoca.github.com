id=420
title=Testes de Unidade em Paralelo[Maven|JUnit] 
date=2010-07-08 22:29:15
type=post
status=published
tags= Java, junit, maven
~~~~~~


<a href="http://java.dzone.com/articles/running-junit-tests-parallel?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+javalobby%2Ffrontpage+%28Javalobby+%2F+Java+Zone%29" target="_blank">Este artigo</a> no <a href="http://www.dzone.com/links/index.html" target="_blank">Dzone </a>explica detalhadamente como executar testes em paralelo utilizando <a href="http://maven.apache.org" target="_blank">Maven </a>e <a href="http://www.junit.org/" target="_blank">JUnit</a>.

Qual a justificativa desta característica? Ora, imagine uma bateria de testes que acessa usa um servidor web  embarcado, ler longos arquivos xml, etc. Vê-se que nestes tipos de testes há bastante processamento e consequentemente demora-se mais. Com essa opção, execução em paralelo, obtemos melhor velocidade - performance.


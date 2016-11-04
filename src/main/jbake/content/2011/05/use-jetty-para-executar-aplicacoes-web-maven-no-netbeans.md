id=679
title=Debugando com Maven Jetty Plugin no Netbeans
date=2011-05-13 16:30:29
type=post
status=published
tags=Apache Click, Apache Wicket, Application Server, Debugging, Depurar, desenvolvimento, IDE, Java, JSF, maven, Metodologia Ágil, NetBeans
~~~~~~


[Jetty ][1]é um servidor web excelente. É rápido para iniciar o que o torna muito útil durante o desenvolvimento. A [ferramente de construção Maven][2] possui um [plugin Jetty][3] que podemos usar em nossos projetos de aplicação Web que utilizam Maven. Desta forma, podemos usar o Jetty para testar nossos arquivos HTML/JSP/JSF/Wicket/Click/etc. Podemos editar o arquivo JSP/HTML e atualizar nosso navegador para ver o resultado imediatamente. Podemos até mesmo compilar um arquivo de classe Java e o servidor Jetty irá reiniciar para que possamos testar o resultado no nosso navegador.  
Vejamos como configurar o [Jetty][1], utilizando como IDE o [Netbeans 6.9][4] (deve funcionar para outras versões também!), para executar e principalmente para depurar (Debugging) a aplicação:  
**requisito: ser uma aplicação web gerenciada pelo Maven.** 

  1. Primeiro vamos habilitar a função Compilar ao Salvar ([Compile On Save][5]) em nosso projeto. Esta função vem habilitada somente para execução de testes em projetos gerenciados pelo Maven, aqui estamos ajustando para execução do fonte também:  
    [<img src="CompileOnSave.png"  title="CompileOnSave" width="804" height="563" class="alignright size-full wp-image-701" />][6] 
  2. Adicione o [plugin jetty][3] para o maven;

```Xml
<plugin>
    <groupId>org.mortbay.jetty</groupId>
    <artifactId>jetty-maven-plugin</artifactId>
    <version>7.0.1.v20091125</version>
    <configuration>  
        <!--reload>manual</reload-->
        <scanIntervalSeconds>10</scanIntervalSeconds>
        <stopKey>foo</stopKey>
        <stopPort>9966</stopPort>
    </configuration>
</plugin>
```
  3. Abra a janela de propriedades do projeto Maven e selecione Ações(Actions) da lista de categorias (Categories). Encontre a ação Executar (Run) e altere o valor do campo Metas de Execução (Execute Goals) para <bold>jetty:stop jetty:run</bold>;  
    [<img src="ActionRunExecuteGoals.png"  title="ActionRunExecuteGoals" width="752" height="580" class="alignright size-full wp-image-687" />][7] 
  4. Então, faça o mesmo para ação Depurar Projeto(Debug project)  
    e adicione as seguintes propriedades:

    ```Shell
    jpda.listen=maven netbeans.deploy.debugmode=true
    ```
    
    [<img src="ActionDebugExecuteGoals.png"  title="ActionDebugExecuteGoals" width="760" height="589" class="alignright size-full wp-image-689" />][8] </li> </ol> 
    
    O legal é poder depurar a aplicação web.  
    Pronto!! <img src="http://blog.gilbertoca.com/wp-includes/images/smilies/icon_smile.gif" alt=":)" class="wp-smiley" /> 
    
    Referências:
    
      * [Using the Maven Jetty plugin - Wicket][9]
      * [Use Jetty to run Maven web applications in NetBeans][10]
    
    

 [1]: http://www.eclipse.org/jetty/
 [2]: http://maven.apache.org/what-is-maven.html
 [3]: http://wiki.eclipse.org/Jetty/Feature/Jetty_Maven_Plugin
 [4]: http://www.netbeans.org
 [5]: http://wiki.netbeans.org/FaqCompileOnSave#Using_Compile_on_Save_in_Maven_Projects
 [6]: CompileOnSave.png
 [7]: ActionRunExecuteGoals.png
 [8]: ActionDebugExecuteGoals.png
 [9]: https://cwiki.apache.org/WICKET/maven-jetty-plugin.html
 [10]: http://mrhaki.blogspot.com/2009/02/use-jetty-to-run-maven-web-applications.html
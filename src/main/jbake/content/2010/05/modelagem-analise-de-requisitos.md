id=352
title=Modelagem usando Uml em Cores [Análise de Requisitos] 
date=2010-05-11 11:06:35
type=post
status=published
tags=Database,  Metodologia Ágil, Modelagem, UML, Uml em Cores
~~~~~~


> Verificando posts de [meu antigo blog][1] notei que alguns não foram importados ou foram importados com defeitos em seu conteúdo. Então resolvi realizar um trabalho de revisão e o primeiro deles começa hoje: 

<div class="toc">
  <h2>
    Conteúdo
  </h2>
  
  <p>
    <a href="#intro">Análise de Requisitos</a><br /> <a href="#cont">Quatro Archetypes/Cores - Pequena Introdução</a><br /> <a href="#conc">Dado uma Classe, Qual é a Cor, Qual é o Archetype?</a><br /> <a href="#refe">Referências</a> </div> 
    
    <p>
      </br>
    </p>
    
    <h2>
      <a name="intro">Análise de Requisitos</a>
    </h2>
    
    <p>
      O post de hoje falaremos sobre a fase de levantamento, mais precisamente a <a href="http://pt.wikipedia.org/wiki/An%C3%A1lise_de_requisitos_de_software">análise de requisitos</a>. Essa é considerada a mais importante fase do ciclo de desenvolvimento de sistemas. O levantamento dos requisitos do sistema pode definir ou mais precisamente nortear o futuro do mesmo. Como Analista/DBA, após a entrevista e coleta de formulários usados atualmente, tenho o hábito de rascunhar um pequeno diagrama de entidade relacionamento (ER). Este modelo(ER) de diagramação ainda é bastante usado, mas com o constante avanço dos modelos especificados pela Linguagem de Modelagem Unificada (UML) acho importante estudo e pratica dos mesmos. Ainda, não costumo seguir um processo de desenvolvimento de software, tais como: XP, RUP e assim vai.
    </p>
    
    <p>
      O que mais acontece é a elaboração de um protótipo inicial e o aperfeiçoamento no decorrer do projeto. Vou usar aqui algo que achei extremamente fácil para iniciantes no mundo OO ou mesmo para a modelagem de um sistema, a técnica chamada “UML in Color”, mais precisamente modelando com Archetypes (arquétipo).<br /> Para você entender porque a modelagem em cor é fácil e ao mesmo tempo tão poderosa é preciso que se entenda os quatro blocos de construção básicos no qual ela é baseada - Os Archetypes. Definição de Archetype:<br /> <em>um modelo no qual todas as coisas do mesmo tipo mais ou menos o seguem - incluindo atributos, links, métodos, pontos de entrada (plug-in), e interações.</em>
    </p>
    
    <h2>
      <a name="cont">Quatro Archetypes/Cores - Pequena Introdução</a>
    </h2>
    
    <p>
      A utilização de cores para cada Archetype foi uma idéia interessante e importante dos autores do livro <a href="http://www.step-10.com/Books/JMCUBook.html">Java Modeling in Color with UML</a> . A cada classe Archetype é dado sua própria cor. A cor facilita o aprendizado e a fixação das classes Archetype tornando informações de alto nível, em um diagrama de classes, mais fáceis de ler. Usar cor também ajuda prevenir pessoas sendo colocadas de lado por não saber por onde começar quando postas diante de um diagrama de classes não trivial (complexo).
    </p>
    
    <h2>
      <a name="conc">Dado uma Classe, Qual é a Cor, Qual é o Archetype?</a>
    </h2>
    
    <p>
      Então dado uma classe, que archetype ou cor deveremos usar? Usaremos o seguinte check-list:
    </p>
    
    <ul>
      <li>
        Moment-Interval (rosa): A classe archetype Moment-Interval representa uma atividade que o sistema precisar rastrear por razões legais ou de negócio, algo que ocorre em um momento no tempo ou sobre um intervalo de tempo;
      </li>
      <li>
        Role (amarelo):A classe archetype Role representa um forma de participação por uma parte (pessoa ou organização), lugar ou, coisa em um Moment-Interval;
      </li>
      <li>
        Party, Place, or Thing (verde): A classe archetype Party, Place, ou Thing, PPT resumidamente, representa coisas que podem exercer um papel (Role) em diferentes atividades do sistema;
      </li>
      <li>
        Description (azul):A classe archetype Description representa um catálogo de descrição, um valor ou conjunto de valores que podem ser usados para etiquetar coisas. A forma mais fácil de pensar em uma classe archetype Description é pensar na informação que classifica uma entidade mas que não define sua identidade. Por exemplo, nacionalidade e estado de civil podem ser considerados descrições para uma pessoa enquanto que número do CPF ou de Passaporte fará parte da informação de identidade da pessoa.
      </li>
    </ul>
    
    <div id="attachment_360" style="width: 310px" class="wp-caption alignnone">
      <a href="four_archetypes.png"><img src:"four_archetypes-300x142.png" alt="" title="four_archetypes" width="300" height="142" class="size-medium wp-image-360" /></a>
      
      <p class="wp-caption-text">
        Quatro Arquétipos
      </p>
    </div>
    
    <p>
      Fique tranquilo, com o exercício/uso dessa modelagem você intuitivamente identificará em qual categoria de archetype sua classe se encaixa.
    </p>
    
    <h2>
      <a href="#refe">Referências</a>
    </h2>
    
    <ul>
      <li>
        <a href="http://edn.embarcadero.com/br/article/33736#9UMLemCores" target="referências">Análise e Desenho Orientados por Objetos (2/4)</a>
      </li>
      <li>
        <a href="http://www.step-10.com/SoftwareDesign/ModellingInColour/index.html" target="referências">Modeling in Color</a>
      </li>
      <li>
        <a href="http://www.hostfrontier.com/index.php/200811029/agile-methodology/domain-modelling-using-color-uml.html" target="referências">Domain Modelling using color UML</a>
      </li>
      <li>
        <a href="http://www.step-10.com/Books/JMCUBook.html" target="referências">Java Modeling in Color with UML</a>
      </li>
    </ul>
    
    

 [1]: http://www.jroller.com/gilbertoca
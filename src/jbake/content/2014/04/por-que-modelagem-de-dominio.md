id=1078
title=Por que Modelagem de Domínio?
date=2014-04-11 09:47:15
type=post
status=published
tags=Estou lendo e você, Metodologia Ágil, Modelagem, Traduções, UML
~~~~~~


*Disponível na Internet. Rebecca Wirfs-Brock <a href="http://wirfs-brock.com/blog/2013/02/27/why-domain-modeling/" target="_blank">Why Domain Modeling?</a>
Arquivo capturado em 27 de fevereiro de 2013*

<p style="text-align:justify">
  Uma barreira ao considerar arquiteturas ricas em modelo de domínio é a ideia errônea do valor ou propósito de um modelo de domínio. Para alguns, criar um modelo de domínio parere retroceder à aqueles dias iniciais onde projeto e modelagem eram percebidas como atividades discretas, longas e muitas vezes improdutivas.
</p>

<p style="text-align:justify">
  Quando a tecnologia objeto era jovem, vários autores fizeram uma forte distinção entre análise orientada a objeto, projeto orientado a objeto e programação. Ostensivamente, durante análise orientada a objeto você analisou uma tarefa com intuito de automatizá-la e desenvolveu um modelo conceitual (de objeto) daquele domínio. Você produziu um conjunto de descrições de tarefa e um modelo de objetos que incluiu representações de conceitos do domínio e mostrou como estes objetos interagiram para concluir algum trabalho. Mas você não conseguiu implementar diretamente estes objetos. Durante o projeto orientado a objeto você refinou esse modelo da análise de forma a considerar a implementação e restrições tecnológicas. Somente então, ao terminar o projeto, escreveria seu programa. A implicação era que qualquer modelo que você produzisse durante a análise ou projeto necessitaria ampla manipulação e refinamento antes de poder escrever seu programa.
</p>

<p style="text-align:justify">
  Mas mesmo naqueles dias iniciais, muitos de nós borrou as linhas entre análise, projeto e programação orientada a objeto. Na prática, como trabalhávamos era frequentemente bem diferente do sugerido pela literatura popular daquele tempo. Podíamos analisar o problema, rapidamente esboçar algumas ideias de projeto e então implementá-las. Podíamos usar cartões CRC para modelar nossos objetos (os quais descartaríamos). Não havia lacunas distintas entre análise do problema e projeto e implementação da solução. Algumas vezes diferentes pessoas faziam análise enquanto outras o projeto e programação; mas muitas vezes um desenvolvedor faria todas essas atividades. Algumas vezes, criávamos representações permanentes de alguns modelos (além de nosso código). Isso dependia da situação e da necessidade.
</p>

<p style="text-align:justify">
  Esses dias, raramente vejo alguém produzir análise de objeto ou modelos de projeto. Na verdade, projeto e modelagem tornaram-se algo sem sabor (ou de má reputação). Um bom projeto de objeto é considerado muito difícil por programadores “médios”, e não há tempo fora da codificação para pensar sobre o domínio e propor alguns modelos.
</p>

<p style="text-align:justify">
  Os modelos de objeto mais comuns que vejo, são criados para um dos seguintes propósitos: pequenos modelos conceituais construídos para ganhar entendimento de uma funcionalidade significante; ou esboços de projeto informal com o intuito de fornecer uma visão rápida para recém-chegados ou pessoas que não leem código que necessitam “saber mais” do software. A falta de modelagem (a menos que você considere código e testes modelos – Eu não!) é predominante se ou não a equipe segue práticas ágeis. Os modelos mais comuns que vejo são modelos ER detalhados que são mais especificações de implementação do que modelos. Eles não deixam nenhum detalhe dificultando a busca de partes importantes.
</p>

<p style="text-align:justify">
  Entender e descrever um domínio e criar qualquer modelo dele de algum forma, fica fora de muitas atividades de desenvolvimento.<br /> Mas se seu software é complexo, sofre mudanças repentinas, estratégico e você não está fazendo nenhuma modelagem de domínio, você pode estar perdendo alguma coisa realmente importante. Se seu software é complexo o bastante, você pode notavelmente se beneficiar da modelagem de domínio e certamente realizar algumas atividades do Projeto Dirigido por Domínio(Domain-Driven Design).<br /> Por exemplo, a “Estratégia de Projeto” do Projeto Dirigido por Domínio é um esforço consciente para criar um entendimento comum entre visionários do negócio, especialistas do domínio e desenvolvedores. Discussões de domínio iniciais de alto nível leva ao entendimento do que é central ao problema(o núcleo do domínio) e ao relacionamento entre todas as partes(subdomínios) que se interagem. Ganhar tal consenso te ajuda a manter o foco em melhores práticas de projeto e estruturar (ou restruturar) seu software habilitando-o a crescer e evoluir sustentavelmente.<br /> Mas não para por aí. Se você compra a ideia de modelagem de domínio, você também se compromete a desenvolver um profundo compartilhamento do entendimento do domínio do problema ao lado do seu código. Sua missão não é somente entregar operações funcionais, mas incorporar conhecimento do domínio em sua solução. Seu código terá objetos que representam conceitos do domínio. Você será mais minucioso ao nomear classes e métodos, assim refletindo exatamente a linguagem do domínio. Você terá discussões progressivas com especialistas de domínio e em conjunto discutir e refinar seu entendimento do domínio. Ao longo do caminho você pode rascunhar e revisar modelos de domínio. Se esforçará para identificar, preservar, fortalecer e tornar explícito as conexões entre o problema do negócio e seu código. Quando refatorar seu projeto ao ganhar mais entendimento, você não esquecerá de refletir o domínio em seu código. Seu modelo de domínio vive e evolui junto com o código.<br /> Como consequência, não há aquela grande desconexão entre o que você codifica e o que o negócio diz. E essa pode ser uma poderosa força para uma colaboração mais próxima entre desenvolvedores e especialistas do domínio.
</p>


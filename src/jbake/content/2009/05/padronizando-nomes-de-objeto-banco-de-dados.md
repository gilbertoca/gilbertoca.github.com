id=25
title=Padronizando Nomes de Objeto - Banco de Dados 
date=2009-05-08 16:07:46
type=post
status=published
tags=Database,  nomear objeto, padrão
~~~~~~


Primeiro definimos a extensão dos arquivos que conterão as sentenças de criação dos objetos do banco de dados: 

<table border="0">
  <tr>
    <td>
      <modulo>.tbs
    </td>
    
    <td>
      Tablespace (Tablespace)- Script de criação do(s) espaço(s) de armazenamento
    </td>
  </tr>
  
  <tr>
    <td>
      <modulo>.vw
    </td>
    
    <td>
      View (visão)-Script de criação da visões
    </td>
  </tr>
  
  <tr>
    <td>
      <modulo>.usr
    </td>
    
    <td>
      Schema (esquema)- Criação do Proprietário do Módulo (Schema), juntamente com a role(papel) de aplicação e usário(s) correspondente(s)
    </td>
  </tr>
  
  <tr>
    <td>
      <modulo>.grt
    </td>
    
    <td>
      Grant (Permissão)- Script que estabelece as permissões a outros usuário e a role de aplicação
    </td>
  </tr>
  
  <tr>
    <td>
      <modulo>.rvk
    </td>
    
    <td>
      Revoke (Permissão)- Script que revoga as permissões a outros usuário e a role de aplicação
    </td>
  </tr>
  
  <tr>
    <td>
      <modulo>.syn
    </td>
    
    <td>
      Synonym (Sinônimo)- Script que estabelece os sinônimos dos objetos a outros usuários
    </td>
  </tr>
  
  <tr>
    <td>
      <modulo>.tab
    </td>
    
    <td>
      Table (Tabela)- Script de criação das tabelas
    </td>
  </tr>
  
  <tr>
    <td>
      <modulo>.con
    </td>
    
    <td>
      Constraint (Restrição)- Script de criação das restrições de integridade
    </td>
  </tr>
  
  <tr>
    <td>
      <modulo>.ind
    </td>
    
    <td>
      Index (Índice)- Script de criação dos índeces
    </td>
  </tr>
  
  <tr>
    <td>
      <modulo>.trg
    </td>
    
    <td>
      Trigger (Gatilho)- Script de criação dos gatilhos
    </td>
  </tr>
  
  <tr>
    <td>
      <modulo>.seq
    </td>
    
    <td>
      Sequence (Sequência)- Script de criação das sequências
    </td>
  </tr>
  
  <tr>
    <td>
      <modulo>.prc
    </td>
    
    <td>
      Stored Procedure (Procedimento Armazenado)- Script de criação de procedimentos armazenados
    </td>
  </tr>
  
  <tr>
    <td>
      <modulo>.fnc
    </td>
    
    <td>
      Stored Function (Função Armazenada)- Script de criação de funções armazenadas
    </td>
  </tr>
  
  <tr>
    <td>
      <modulo>.pks
    </td>
    
    <td>
      Package Specification (Especificação de Pacote) - Script de criação das especificações dos pacotes
    </td>
  </tr>
  
  <tr>
    <td>
      <modulo>.pkb
    </td>
    
    <td>
      Package Body (Corpo de Pacote) - Script de criação do corpo dos pacotes
    </td>
  </tr>
  
  <tr>
    <td>
      <modulo>.sql
    </td>
    
    <td>
      Reponsável por chamar/executar os outros arquivos em uma sequencia apropriada:
    </td>
  </tr>
</table>

| Para Tabelas           | Descrição                                                                            | Exemplo    |
| ---------------------- | ------------------------------------------------------------------------------------ | ---------- |
| <prefixo>_<nometabela> | onde <prefixo> deverá ser letras representando o módulo em que esta tabela pertença. | ger_pessoa |

</tr> | Para Visão                 | Descrição                                                                            | Exemplo              |
| -------------------------- | ------------------------------------------------------------------------------------ | -------------------- |
| <prefixo>\_<nomevisao>\_vw | onde <prefixo> deverá ser letras representando o módulo em que esta tabela pertença. | ger\_funcionario\_vw |

| Para Sequências                   | Descrição                                                                            | Exemplo                    |
| --------------------------------- | ------------------------------------------------------------------------------------ | -------------------------- |
| <prefixo>\_<nometabela>\_sequence | onde <prefixo> deverá ser letras representando o módulo em que esta tabela pertença. | ger\_funcionario\_sequence |

| Para Colunas                                              | Descrição                                                     | Exemplo                       |
| --------------------------------------------------------- | ------------------------------------------------------------- | ----------------------------- |
| <cd>_<nometabela>                                         | para coluna representando a chave primaria da tabela.         | cd_pessoa                     |
| <cd>_<nometabelaestrangeira>                              | para coluna(s) representando a presença de chave estrangeira. | cd_municipio                  |
| <cd>_<nometabelaestrangeira><significadodorelacionamento> | para coluna(s) representando a presença de chave estrangeira. | cd_municipionaturalidade      |
| <fl>_<nomecampo>                                          | para coluna representando campo lógico(verdadeiro ou falso).  | fl\_dependente, fl\_encerrado |
| <dt>_<nomecampo>                                          | para coluna representando campo data.                         | dt_nascimento                 |
| <hr>_<nomecampo>                                          | para coluna representando campo tempo.                        | hr_saida                      |
| <nu>_<nomecampo>                                          | para coluna representando campo numerico.                     | nu_leicriacao                 |

Para nomear constraints, devemos usar um padrão porque não pode haver repetição de nomes dos mesmos (limitado a 30 caracteres - limitação do oracle). 

| Para Constraints                                                                               | Descrição                                                     | Exemplo                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| ---------------------------------------------------------------------------------------------- | ------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| <nome da tabela com prefixo>_<pk>                                                              | para chave primaria.                                          | constraint sys\_usuario\_pk primary key (cd_usuario) enable                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| <nome da tabela com prefixo>_<uk>                                                              | para indice unico.                                            | constraint sys\_usuario\_uk unique (login, email) enable                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| <nome da tabela origem sem prefixo>\_<to>\_<nome da tabela atual(destino sem prefixo>_<fk>     | para coluna(s) representando a presença de chave estrangeira. | constraint entidade\_to\_subentidade\_fk foreign key (id\_entidade) references kira.sys\_entidade (id\_entidade) enable                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| <nome da tabela sem prefixo>\_<nome da coluna>\_<ck>_<um digito - caso ocorra repeticao> | para check.                                                   | create table ergon.ergon\_regras\_compara_ff  
(  
regra number(6,0) constraint regras\_compara\_ff\_regra\_ck_0 not null enable,  
fl\_ativa\_1 char(1 byte) default &#8216;n&#8217; constraint rg\_cp\_ff\_fl\_ativa\_1\_ck_0 not null enable,  
fl\_ativa\_2 char(1 byte) default &#8216;n&#8217; constraint rg\_cp\_ff\_fl\_ativa\_2\_ck_0 not null enable,  
fl\_ativa\_3 char(1 byte) default &#8216;n&#8217; constraint rg\_cp\_ff\_fl\_ativa\_3\_ck_0 not null enable,  
limite_diferenca number(11,2),  
constraint ergon\_regras\_compara\_ff\_pk primary key (regra) enable,  
constraint rg\_cp\_ff\_fl\_ativa\_1\_ck\_1 check (fl\_ativa_1 in (&#8216;s&#8217;, &#8216;n&#8217;)) enable novalidate,  
constraint rg\_cp\_ff\_fl\_ativa\_2\_ck\_2 check (fl\_ativa_2 in (&#8216;s&#8217;, &#8216;n&#8217;)) enable novalidate,  
constraint rg\_cp\_ff\_fl\_ativa\_3\_ck\_3 check (fl\_ativa_3 in (&#8216;s&#8217;, &#8216;n&#8217;)) enable novalidate  
) ; |

**Nota:** em todos os casos acima, sendo o nome do objeto grande, devemos abreviar o nome do mesmo.  
ex.:  
aplicacoes = apli (4)  
aplicacao_funcoes = apfu (2:2)  
aplicacao\_funcao\_papeis = apfp (2:1:1)  
aplicacao\_funcao\_papel_bananas = afpb (1:1:1:1)  
aplicacao\_funcao\_papel\_banana\_macas = (Seja criativo!) 

**REFERENCIA:** [NamingConventions.php][1]

Uso essa estratégia há algum tempo e fica muito fácil de trabalhar e manter. 

Você adota uma notação?  
Qual notação você usa?



 [1]: http://www.oracle-base.com/articles/misc/NamingConventions.php
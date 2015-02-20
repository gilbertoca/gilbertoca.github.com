title='Alterando o group principal/efetivo do usuário &#8211; newgrp e sg'
date=2010-02-22 17=24=31
type=post
status=published
tags=
,Application Server
,Database
,Linux
,opensuse
,Sistema Operacional
,Unix
~~~~~~
<!-- google_ad_section_start -->

Para ter um ambiente semelhante ao de produção, neste caso para as aplicações que rodam em forms e para a instalação do banco, acabei por instalar o mesmo sistema operacional (SLES9), os mesmos softwares (OracleAs 10g, Oracle Database 10g e Oracle DevSuit 10g) no meu desktop. Com isso, toda vez que preciso usar qualquer um destes softwares eu tem que assumir o usuario de instalação dos mesmos que neste caso usei o default oracle. Veja a labuta que tem de fazer:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="bash" style="font-family:monospace;"><span style="color: #c20cb9; font-weight: bold;">xhost</span> +
&nbsp;
sux – oracle
&nbsp;
<span style="color: #7a0874; font-weight: bold;">source</span> .oracleDB <span style="color: #7a0874; font-weight: bold;">&#40;</span>ou oracleDS ou oracleAS<span style="color: #7a0874; font-weight: bold;">&#41;</span></pre>
      </td>
    </tr>
  </table>
</div>

Bom dos scripts de mudança de ambiente não tenho como escapar mas para facilitar minha vida, acabei adicionando os grupos DBA e oinstall para minha lista de grupos. Dessa forma não preciso usar o su para mudança de usuario. Ai tem um porem, meu grupo padrão é users. Nessa, quando tento compilar um forms ou iniciar o servidor de aplicações, acontece vários erros de permissões. Isso porque meu grupo principal/efetivo, como ja disse, não é o oinstall nem DBA. Para contornar este problema usei o utilitário de sistema newgrp. O comando newgrp é usado para alterar o grupo efetivo do usuário para o grupo solicitado em uma nova sessão de login:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="bash" style="font-family:monospace;">$ <span style="color: #c20cb9; font-weight: bold;">groups</span> 
&nbsp;
<span style="color: #c20cb9; font-weight: bold;">users</span> disk uucp dialout audio video oinstall dba
&nbsp;
$ newgrp oinstall
&nbsp;
$ <span style="color: #c20cb9; font-weight: bold;">groups</span> 
&nbsp;
oinstall disk uucp dialout audio video dba <span style="color: #c20cb9; font-weight: bold;">users</span>
&nbsp;
$ <span style="color: #7a0874; font-weight: bold;">exit</span>
&nbsp;
$ <span style="color: #c20cb9; font-weight: bold;">groups</span>
&nbsp;
<span style="color: #c20cb9; font-weight: bold;">users</span> disk uucp dialout audio video oinstall dba</pre>
      </td>
    </tr>
  </table>
</div>

Desta forma meu grupo principal torna-se oinstall, me possibilitando trabalhar com a compilação dos forms. Legal hein! O outro utilitario de sistema que podemos usar é o sg. O sg é mais usando que vc so precisa executar um comando, mas usando o grupo o qual vc necessita:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="bash" style="font-family:monospace;">sg oinstall <span style="color: #660033;">-c</span> <span style="color: #c20cb9; font-weight: bold;">rm</span> <span style="color: #000000; font-weight: bold;">*</span>.err</pre>
      </td>
    </tr>
  </table>
</div>

<!-- google_ad_section_end -->
title=Como fazer
date=2009-12-23 09:31:21
type=page
status=published
~~~~~~
<!-- google_ad_section_start -->

<table>
  <tr>
    <th style="width: 150px; border: 1px inset #cccccc;" width="150">
      O que você quer?
    </th>
    
    <th style="width: 300px; border: 1px inset #cccccc;" width="200">
      Como fazer?
    </th>
  </tr>
  
  <tr>
    <td>
      active-profiles
    </td>
    
    <td>
      mvn help:all-profiles
    </td>
  </tr>
  
  <tr>
    <td>
      executar um único teste
    </td>
    
    <td>
      mvn test -Dtest=CustomerTest
    </td>
  </tr>
  
  <tr>
    <td>
      gerar documentação
    </td>
    
    <td>
      mvn javadoc:javadoc
    </td>
  </tr>
  
  <tr>
    <td>
      pular a fase de teste
    </td>
    
    <td>
      mvn -Dmaven.test.skip=true
    </td>
  </tr>
  
  <tr>
    <td>
      sobrescrever propriedades
    </td>
    
    <td>
      mvn -Djdbc.url=&#8221;jdbc:h2:file:data/parkDB;create=true;MODE=PostgreSQL;DB_CLOSE_DELAY=-1&#8243; -Dmaven.test.skip=true clean install
    </td>
  </tr>
  
  <tr>
    <td>
      Executar um programa java
    </td>
    
    <td>
      mvn clean compile exec:java -Dexec.mainClass=&#8221;com.tengen.m101j.HelloWorldMongoDBStyle&#8221;
    </td>
  </tr>
</table>

<!-- google_ad_section_end -->
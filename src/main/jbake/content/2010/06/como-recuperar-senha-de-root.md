id=386
title=Como recuperar senha de root
date=2010-06-08 11:14:18
type=post
status=published
tags=console,  Linux, openSUSE, Sistema Operacional
~~~~~~


Não é difícil encontrar novos usuários linux que esquecem ou perdem a senha do [usuário root][1] em um servidor ou estação de trabalho. Este post é uma tradução do seguinte HOW-TO: [Recover the Linux root password][2], publicado pela novell. 

Então vamos resolver o problema:

  * 1. inicie (Boot) o computador a partir do Cd de instalação;
  * 2. selecione qualquer método de instalação ou a opção recuperação de sistema (Rescue System); 
  * 3. na primeira tela de instalação quando for selecionar a linguagem, pressione **ctrl-alt-f2** para abir um terminal virtual(virtual console); 
Nota: se você selecionou recuperação de sistema(Rescue System), selecione a linguagem de seu teclado e então o prompt para o Login de Recuperação(Rescue Login) aparecerá. Entre como root.

  * 4. Digite <div class="wp_syntax">
      <table>
        <tr>
          <td class="code">
            <pre class="bash" style="font-family:monospace;"><span style="color: #c20cb9; font-weight: bold;">fdisk</span> <span style="color: #660033;">-l</span></pre>
          </td>
        </tr>
      </table>
    </div>
    
    para listar as partições. Localize a partição Linux raiz(/). </li> 
    
      * 5. Digite <div class="wp_syntax">
          <table>
            <tr>
              <td class="code">
                <pre class="bash" style="font-family:monospace;"><span style="color: #c20cb9; font-weight: bold;">mount</span> <span style="color: #000000; font-weight: bold;">/</span>dev<span style="color: #000000; font-weight: bold;">/</span>sda4 <span style="color: #000000; font-weight: bold;">/</span>mnt</pre>
              </td>
            </tr>
          </table>
        </div>
        
        (substitua sda4 com o nome do dispositivo - device - pela a partição Linux raiz identificada no passo anterior); </li> 
        
          * 6. Execute <div class="wp_syntax">
              <table>
                <tr>
                  <td class="code">
                    <pre class="bash" style="font-family:monospace;"><span style="color: #c20cb9; font-weight: bold;">mount</span> <span style="color: #660033;">-o</span> <span style="color: #7a0874; font-weight: bold;">bind</span> <span style="color: #000000; font-weight: bold;">/</span>dev <span style="color: #000000; font-weight: bold;">/</span>mnt<span style="color: #000000; font-weight: bold;">/</span>dev</pre>
                  </td>
                </tr>
              </table>
            </div>
            
            para tornar os arquivos do dispositivo disponíveis (isso é necessário para o acesso ao dispositivo urandom o qual pode ser usado pelo comando passwd abaixo); </li> 
            
              * 7. Entre <div class="wp_syntax">
                  <table>
                    <tr>
                      <td class="code">
                        <pre class="bash" style="font-family:monospace;"><span style="color: #c20cb9; font-weight: bold;">chroot</span> <span style="color: #000000; font-weight: bold;">/</span>mnt</pre>
                      </td>
                    </tr>
                  </table>
                </div>
            
              * 8. Agora entre</p> <div class="wp_syntax">
                  <table>
                    <tr>
                      <td class="code">
                        <pre class="bash" style="font-family:monospace;"><span style="color: #c20cb9; font-weight: bold;">passwd</span> root</pre>
                      </td>
                    </tr>
                  </table>
                </div>
                
                e digite a nova senha do root;</li> 
                
                  * 9. Digite</p> <div class="wp_syntax">
                      <table>
                        <tr>
                          <td class="code">
                            <pre class="bash" style="font-family:monospace;"><span style="color: #7a0874; font-weight: bold;">exit</span></pre>
                          </td>
                        </tr>
                      </table>
                    </div>
                    
                    para sair do ambiente chroot;</li> 
                    
                      * 10. Desmonte o sistema de arquivos com <div class="wp_syntax">
                          <table>
                            <tr>
                              <td class="code">
                                <pre class="bash" style="font-family:monospace;"><span style="color: #c20cb9; font-weight: bold;">umount</span> <span style="color: #000000; font-weight: bold;">/</span>mnt</pre>
                              </td>
                            </tr>
                          </table>
                        </div>
                    
                      * 11. Reinicie o sistema.</ul> 
                    

 [1]: http://br-linux.org/artigos/dicas_root.htm
 [2]: http://www.novell.com/support/search.do?cmd=displayKC&#038;docType=kc&#038;externalId=3003803&#038;sliceId=SAL_Public&#038;dialogID=17188705&#038;stateId=0%200%2017194530
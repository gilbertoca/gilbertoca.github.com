id=1106
title=Oracle JDK8 no OpenSUSE
date=2014-07-02 14:31:06
type=post
status=published
tags=Geral, Java, Linux, Sistema Operacional, Unix
~~~~~~
<!-- google_ad_section_start -->

Esta forma de instalação é mais resumida que a do <a href="http://blog.gilbertoca.com/?p:971" title="Instale Oracle JDK7 no openSUSE" target="_blank">post antigo</a> e utiliza o formato comprimido (tar.gz). 

Realize o download a partir deste local: <a href="http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html" title="Java SE Development Kit 8 Downloads" target="_blank">Java SE Development Kit 8 Downloads</a>, em um diretório de sua escolha - escolhi: Downloads. 

Depois como super usuário (root) pelo <a href="http://kde.org/applications/system/konsole/" title="Kconsole" target="_blank">Kconsole</a> faça uso da seguinte sequência:

    # cd /usr/java
    # tar xvf ~/Downloads/jdk-8u5-linux-x64.tar.gz
    # chown -R root:root jdk1.8.0_05
    # rm latest
    # ln -s /usr/java/jdk1.8.0_05 /usr/java/latest
    # cd latest/bin
    # for bin in *; do update-alternatives --install /usr/bin/$bin $bin $(pwd)/$bin 1; done
    # cd ..
    # cd latest/jre/bin
    # for bin in *; do update-alternatives --install /usr/bin/$bin $bin $(pwd)/$bin 1; done
    # cd ..
    # cd ..
    # update-alternatives --install /usr/lib64/browser-plugins/javaplugin.so javaplugin /usr/java/latest/jre/lib/amd64/libnpjp2.so 1
    # update-alternatives --config java
    # update-alternatives --config javac
    # update-alternatives --config javaplugin


<!-- google_ad_section_end -->
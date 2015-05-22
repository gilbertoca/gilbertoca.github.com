#! /bin/bash
rm -fr output/
~/bin/jbake-2.4.0-SNAPSHOT/bin/jbake -b src/jbake/ output
~/bin/jbake-2.4.0-SNAPSHOT/bin/jbake -s output

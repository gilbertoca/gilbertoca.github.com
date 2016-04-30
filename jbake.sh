#! /bin/bash
rm -fr output/
~/bin/jbake-2.4.0/bin/jbake -b src/jbake/ output
~/bin/jbake-2.4.0/bin/jbake -s output

#!/bin/bash
rm -fr output/
~/bin/jbake-2.3.3-SNAPSHOT/bin/jbake -b src/jbake/ output
~/bin/jbake-2.3.3-SNAPSHOT/bin/jbake -s output

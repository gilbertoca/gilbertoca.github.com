git config --local user.email "gilbertoca at gmail"
git config --local user.name "Gilberto Caetano de Andrade"

mvn clean compile jbake:inline -Djbake.port=8080 -Djbake.listenAddress=0.0.0.0
mvn jbake:inline -Djbake.port=8080 -Djbake.listenAddress=0.0.0.0

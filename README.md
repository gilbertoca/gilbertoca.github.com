git config --local user.email "gilbertoca at gmail"
git config --local user.name "Gilberto Caetano de Andrade"

mvn clean compile jbake:inline -Djbake.port=8080 -Djbake.listenAddress=0.0.0.0
mvn jbake:inline -Djbake.port=8080 -Djbake.listenAddress=0.0.0.0

Following [this tip](https://gist.github.com/cobyism/4730490)

1. clone the master branch and create/change your post/article;
2. chech the result by building locally:
   #the compile goal will copy the resources images/video as well
   #to the output folder target/blog
   mvn clean compile jbake:inline -Djbake.port=8080 -Djbake.listenAddress=0.0.0.0
3. check-out your gh-pages branch in the target/blog subfolder and keep that folder in the gitignore to keep your history clean;
4. git clone git@github.com:gilbertoca/gilbertoca.com.git --branch gh-pages target/blog
5. rm -rf target/blog/*
6. mvn compile jbake:generate
7. cd target/blog/ && git add --all && git commit -m "Publising at $(date)" && git push
8. cd ../.. and continue again

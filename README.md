git config --local user.email "gilbertoca at gmail"
git config --local user.name "Gilberto Caetano de Andrade"

mvn mvn clean jbake:inline -Djbake.port=8080 -Djbake.listenAddress=0.0.0.0
ou 
mvn jbake:generate

setup 

mvn clean 
echo "target" >> .gitignore
git worktree add target/blog gh-pages

making changes

mvn jbake:generate
cd target/blog
git add --all && git commit -m "Publising at $(date)" && git push

--repeat

--clean worktree
--back to root folder
git worktree list
mvn clean or rm -rf target/
git worktree prune




# merge master -> development

echo "*** THE CODE WILL WORK ONLY IF YOU ARE USING master AND development BRANCHES ***"

git checkout master
git merge --no-commit development

echo "Enter commit message >"
read message

git add -A
git commit -a -m "merge development -> master"
git push

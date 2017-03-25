# merge master -> development

echo
echo "*** THE CODE WILL WORK ONLY IF YOU ARE USING master AND development BRANCHES ***"
echo

git checkout development
git merge --no-commit master

git add -A
git commit -a -m "merge master -> development"
git push

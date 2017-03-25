# merge master -> development

echo
echo "*** THE CODE WILL WORK ONLY IF YOU ARE USING master AND development BRANCHES ***"
echo

git checkout development
git merge master --no-commit

git add -A
git commit -a -m "merge master -> development"
git push
git checkout master

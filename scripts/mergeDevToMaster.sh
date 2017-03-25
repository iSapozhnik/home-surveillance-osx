# merge development -> master

echo
echo "*** THE CODE WILL WORK ONLY IF YOU ARE USING master AND development BRANCHES ***"
echo

git checkout master
git pull
git merge development --no-commit

git add -A
git commit -a -m "merge development -> master"
git push
git checkout development
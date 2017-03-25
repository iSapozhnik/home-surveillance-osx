echo -n "Enter commit message >"
read message
git add -A
git commit -a -m "$message"
git pull
git push

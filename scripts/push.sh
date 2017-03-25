echo -p "Enter commit message >"
read message
git add -A
git commit -a -m "$message"
git pull --no-edit
git push

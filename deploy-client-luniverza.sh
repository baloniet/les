#!/bin/bash  
echo "Preparing production client"  
cd ../bs4
npm run vgccrm

echo "Start git operations"
cd ../les
mv *.tgz dist
mv *.gz dist
git add -A && git commit -m $1
git push
echo $1 "compiled and commited. Run deploy on server."
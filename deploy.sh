#!/bin/bash  
echo "Preparing production client"  
cd ../bs4
npm run vgccrm

echo "Preparing demo client"  
npm run vgccrm-test

echo "Preparing production public"  
cd ../live-events-public
npm run vgccrm

echo "Preparing demo public"  
cd ../live-events-public
npm run vgccrm-test

echo "Preparing register service"  
cd ../live-events-register
npm run vgccrm

echo "Preparing server"  
cd ../live_events_server
npm run vgccrm 

echo "Start git operations"
cd ../les
mv *.tgz dist
mv *.gz dist
git add -A && git commit -m $1
git push
echo $1 "compiled and commited. Run deploy on server."
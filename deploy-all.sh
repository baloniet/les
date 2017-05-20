#!/bin/bash  

# CLIENT
echo "Preparing luniverza client"  
cd ../bs4
npm run vgccrm

echo "Preparing vps client"  
npm run vgccrm-vps

echo "Preparing demo client"  
npm run vgccrm-test

# PUBLIC
echo "Preparing luniverza public"  
cd ../live-events-public
npm run vgccrm

echo "Preparing vps public"  
npm run vgccrm-vps

echo "Preparing demo public"  
npm run vgccrm-test

# REGISTER SERVICE
echo "Preparing register service"  
cd ../live-events-register
npm run vgccrm

# REST SERVICE
echo "Preparing server"  
cd ../live_events_server
npm run vgccrm 

# GIT
echo "Start git operations"
cd ../les
mv *.tgz dist
mv *.gz dist
git add -A && git commit -m $1
git push
echo $1 "compiled and commited. Run deploy on server."
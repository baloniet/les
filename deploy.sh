#!/bin/bash  
echo "Preparing production client"  
cd ../bs4
npm run meksis

echo "Preparing test client"  
npm run meksis-test

echo "Preparing test public"  
cd ../live-events-public
npm run meksis-test-public

echo "Preparing register service"  
cd ../live-events-register
npm pack 
mv live-events-register-1.0.0.tgz register.tgz
mv register.* ../les/

echo "Preparing server"  
cd ../live_events_server
npm run meksis 

echo "Start git operations"
cd ../les
mv -v -f dist.tar.gz client.tgz
mv -v -f disttest.tar.gz client-test.tgz
mv -v -f publicdisttest.tar.gz public-client-test.tgz
mv -v -f live-events-server-1.0.0.tgz server.tgz
git add -A && git commit -m $1
git push
echo $1 "compiled and commited. Run deploy on server."



echo -e "\E[1;32mgit pull\E[1;37m"
git pull
pm2 delete all
cd dist

echo -e "\E[1;32mpreparing production server\E[1;37m"
tar -xzf server.tgz
cp ../../datasources.json package/server
tar -czf package.tgz package 
slc deploy --service=live-events-server http://localhost:8701 ./package.tgz
rm -rf package

echo -e "\E[1;32mpreparing production register server\E[1;37m"
tar -xzf register.tgz
rsync -av package/ register/
cp ../../datasources.json register/app
cd register
pm2 start index.js --name register-server
cd ..
rm -rf package

echo -e "\E[1;32mpreparing production client\E[1;37m"
rm -rf client
mkdir client
tar -xzf client.tar.gz client
pm2 start /usr/bin/http-server --name http-client -f -- client -p 8080

echo -e "\E[1;32mpreparing production public\E[1;37m"
rm -rf public
mkdir public
tar -xzf public.tar.gz public
pm2 start /usr/bin/http-server --name http-public -f -- public -p 8082

rm *.tar.gz
rm *.tgz
cd ..

echo -e “\E[1;32mScript completed.\E[1;37m"
slc ctl
pm2 status
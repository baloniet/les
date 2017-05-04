echo "git pull"
git pull
cd dist

echo "preparing test server"
tar -xzf server.tgz
cp ../../datasources.json package/server
tar -czf package.tgz package 
slc deploy --service=live-events-server http://localhost:8701 ./package.tgz
rm -rf package

echo "preparing test register server"
rm -rf register
tar -xzf register.tgz
mv package register
cp ../../datasources.json register/app
cd register
pm2 start index.js --name register-server
cd ..

echo "preparing test client"
rm -rf client
mkdir client
tar -xzf client-test.tar.gz client
pm2 start /usr/local/bin/http-server --name http-client -f -- client -p 8080

echo "preparing test public"
rm -rf public
mkdir public
tar -xzf public-test.tar.gz public
pm2 start /usr/local/bin/http-server --name http-public -f -- public -p 8082

rm *.tar.gz
rm *.tgz
cd ..

echo “Script completed.”
slc ctl
pm2 status
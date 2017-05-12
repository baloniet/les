echo -e "\E[1;32mgit pull\E[1;37m"
git pull
pm2 delete http-client
cd dist

echo -e "\E[1;32mpreparing production client\E[1;37m"
rm -rf client
mkdir client
tar -xzf client.tar.gz client
pm2 start /usr/bin/http-server --name http-client -f -- client -p 8080

#rm *.tar.gz
#rm *.tgz
cd ..

echo -e "\E[1;32mScript completed.\E[1;37m"
slc ctl
pm2 status
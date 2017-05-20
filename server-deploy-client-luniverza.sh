echo "git pull"
git pull
pm2 delete http-client
cd dist

echo "preparing production client"
rm -rf client
mkdir client
tar -xzf client.tar.gz client
pm2 start /usr/bin/http-server --name http-client -f -- client -p 8080

#rm *.tar.gz
#rm *.tgz
cd ..

echo "Script completed."
slc ctl
pm2 status
rm -rf /package
git pull
tar -xzf server.tgz
cp datasources.json package/server
tar -czf package.tgz package 
slc deploy --service=live-events-server http://localhost:8701 ./package.tgz
rm package.tgz
rm -rf packagejanez
rm -rf dist
mkdir dist 
tar -xzf client.tgz dist
echo “Script completed.”
pm2 show 0

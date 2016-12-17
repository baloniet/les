rm -rf /package
git pull
tar -xzvf server.tgz
cp datasources.json package/server
tar -czvf package.tgz package 
slc deploy --service=live-events-server http://localhost:8701 ./package.tgz
rm package.tgz
rm -rf package
rm -rf dist
mkdir dist 
tar -xzvf client.tgz dist
echo “Script completed.”

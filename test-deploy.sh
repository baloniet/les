rm -rf /package
git pull
tar -xzf server.tgz
cp ../datasources.json package/server
tar -czf package.tgz package 
slc deploy --service=live-events-server http://localhost:8701 ./package.tgz
rm package.tgz
rm -rf package
rm -rf dist
rm -rf publicdist
mkdir dist 
tar -xzf client-test.tgz dist
mkdir publicdist 
tar -xzf public-client-test.tgz publicdist
echo “Script completed.”
pm2 show 0
slc ctl

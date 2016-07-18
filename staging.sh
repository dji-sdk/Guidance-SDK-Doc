C='\033[1;34m'
NC='\033[0m'
SERVER='121.196.219.14'

export ACCESS_KEY_ID=bJ5XKDeUOEMrQ1p6
export ACCESS_KEY_SECRET=gUQoCEQMHthV6diqBPxMWVNPTj7F48
export BUCKET=pro-dev-front-hz01-e4s8
export CDN_HOST=http://dev1.djicdn.com

echo -e "${C}[ BUILD DOC ]${NC}"
git pull
npm i
rm db.json
NODE_ENV=staging hexo generate
npm run build

echo -e "${C}[ FLY TO THE CLOUD ]${NC}"
mv dist guidance-doc-dist
tar zcf guidance-doc-dist.tar.gz guidance-doc-dist
scp guidance-doc-dist.tar.gz dev-front@${SERVER}:/data/home/dev-front/front
ssh dev-front@${SERVER} "cd ~/front; \
  tar zxf guidance-doc-dist.tar.gz; \
  rm -r doc/guidance-sdk; \
  mv guidance-doc-dist doc/guidance-sdk; \
  rm guidance-doc-dist.tar.gz;"

echo -e "${C}[ LAUNCHED ]${NC}"
rm -r guidance-doc-dist guidance-doc-dist.tar.gz

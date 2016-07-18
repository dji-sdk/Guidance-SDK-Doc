C='\033[1;34m'
NC='\033[0m'
SERVER='121.196.219.14'

echo -e "${C}[ BUILD DOC ]${NC}"
git pull
npm i
NODE_ENV=production hexo generate
npm run build

echo -e "${C}[ FLY TO THE CLOUD ]${NC}"
cp -r .tmp/dist mobile-doc-dist
tar zcf mobile-doc-dist.tar.gz mobile-doc-dist
scp mobile-doc-dist.tar.gz dev-front@${SERVER}:/data/home/dev-front/front
ssh dev-front@${SERVER} "cd ~/front; \
  tar zxf mobile-doc-dist.tar.gz; \
  rm -r doc/mobile-sdk; \
  mv mobile-doc-dist doc/mobile-sdk; \
  rm mobile-doc-dist.tar.gz;"

echo -e "${C}[ LAUNCHED ]${NC}"
rm -r mobile-doc-dist mobile-doc-dist.tar.gz
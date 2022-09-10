rm -rf vue3
git clone https://github.com/Composur/vue3.git
cd vue3
git --version && node -v && npm -v && yarn -v
echo '=========================build start==================== '
yarn
yarn build
echo '=========================build success==================== '

echo '=========================build docker start==================== '

docker stop vue3_demo
docker rm vue3_demo
docker build -t vue3_demo .

docker run --name vue3_demo -p 8082:80 -d --restart=always vue3_demo
echo '=========================build docker success==================== '

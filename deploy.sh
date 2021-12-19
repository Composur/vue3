git --version && node -v && npm -v && yarn -v
echo '=========================build start==================== '
yarn
yarn build
echo '=========================build success==================== '

echo '=========================build docker start==================== '
docker build -t vue3_demo .

docker run --name vue3_demo -p 8082:80 -d vue3_demo

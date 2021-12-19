git --version && node -v && npm -v
echo '=========================build start==================== '
npm install
npm build
echo '=========================build success==================== '

echo '=========================build docker start==================== '
docker build -t vue3_demo .

docker run --name vue3_demo -p 8082:80 -d vue3_demo

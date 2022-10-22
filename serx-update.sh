sudo apt update && sudo apt upgrade -y

cd /usr/local/searxng-docker

sudo docker-compose down

sudo docker-compose pull

sudo docker-compose up -d

rm serx-update.sh

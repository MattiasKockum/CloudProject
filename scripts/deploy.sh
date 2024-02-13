systemctl start docker
docker-compose up -d
docker ps
echo "frontend is at : http://localhost:8080"
echo "backend is at : http://localhost:8081"

docker build --tag 'jenkins' .
docker rm jenkins 
wait
docker run -v /var/run/docker.sock:/var/run/docker.sock --name jenkins -p 8080:8080 jenkins



GOINFRE="/goinfre/$USER"

echo $GOINFRE
mkdir $GOINFRE/Caches
mkdir $GOINFRE/Caches/com.docker.docker
rm -rf ~/Library/Caches/com.docker.docker
ln -s $GOINFRE/Caches/com.docker.docker ~/Library/Caches/com.docker.docker
mkdir $GOINFRE/Containers
mkdir $GOINFRE/.docker

rm -rf ~/.docker
ln -s $GOINFRE/.docker ~/.docker

mkdir $GOINFRE/Containers/com.docker.docker
rm -rf ~/Library/Containers/com.docker.docker
ln -s $GOINFRE/Containers/com.docker.docker ~/Library/Containers/com.docker.docker

rm -rf ~/.minikube
mkdir $GOINFRE/.minikube
ln -s $GOINFRE/.minikube ~/.minikube

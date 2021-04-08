#!/bin/sh
BG='\033[0;0;41m'
YELLOW='\033[0;30;43m'
GREEN='\033[0;30;42m'
CLEAR='\033[0m'

##########################################################################################
minikube start --vm-driver=virtualbox
echo "${BG} ОБОРАЧИВАЕМ ${YELLOW} ДОКЕР ${GREEN} 1/18 ${CLEAR}"
eval $(minikube docker-env)

docker pull metallb/speaker:v0.8.2
docker pull metallb/controller:v0.8.2

echo "${BG} ВКЛЮЧЕНИЕ ${YELLOW} METALLB ${GREEN} 2/18 ${CLEAR}"
minikube addons enable metallb

echo "${BG} ПРИМЕНЕНИЕ YAML К ${YELLOW} METALLB ${GREEN} 3/18 ${CLEAR}"
kubectl apply -f ./srcs/yaml/metallb.yaml
##########################################################################################



##########################################################################################
#                                      NGINX                                             #
##########################################################################################
echo "${BG} СОЗДАНИЕ ДОКЕР-КОНТЕЙНЕРА ДЛЯ ${YELLOW} NGINX ${GREEN} 4/18 ${CLEAR}"
docker build -t nginx_image ./srcs/nginx
echo "${BG} ПРИМЕНЕНИЕ YAML К ${YELLOW} NGINX ${GREEN} 5/18 ${CLEAR}"
kubectl apply -f ./srcs/yaml/nginx.yaml



##########################################################################################
#                                    WORDPRESS                                           #
##########################################################################################
echo "${BG} СОЗДАНИЕ ДОКЕР-КОНТЕЙНЕРА ДЛЯ ${YELLOW} WORDPRESS ${GREEN} 6/18 ${CLEAR}"
docker build -t wordpress-image ./srcs/wordpress
echo "${BG} ПРИМЕНЕНИЕ YAML К ${YELLOW} WORDPRESS ${GREEN} 7/18 ${CLEAR}"
kubectl apply -f ./srcs/yaml/wordpress.yaml
echo "${BG} ПРИМЕНЕНИЕ YAML К ${YELLOW} VOLUME ${GREEN} 8/18 ${CLEAR}"
kubectl apply -f ./srcs/yaml/volume.yaml



##########################################################################################
#                                    PHPMYADMIN                                          #
##########################################################################################
echo "${BG} СОЗДАНИЕ ДОКЕР-КОНТЕЙНЕРА ДЛЯ ${YELLOW} PHPMYADMIN ${GREEN} 9/18 ${CLEAR}"
docker build -t phpmyadmin-image ./srcs/phpmyadmin
echo "${BG} ПРИМЕНЕНИЕ YAML К ${YELLOW} PHPMYADMIN ${GREEN} 10/18 ${CLEAR}"
kubectl apply -f ./srcs/yaml/phpmyadmin.yaml



##########################################################################################
#                                       MYSQL                                            #
##########################################################################################
echo "${BG} СОЗДАНИЕ ДОКЕР-КОНТЕЙНЕРА ДЛЯ ${YELLOW} MYSQL ${GREEN} 11/18 ${CLEAR}"
docker build -t mysql-image ./srcs/mysql
echo "${BG} ПРИМЕНЕНИЕ YAML К ${YELLOW} MYSQL ${GREEN} 12/18 ${CLEAR}"
kubectl apply -f ./srcs/yaml/mysql.yaml



##########################################################################################
#                                       FTPS                                             #
##########################################################################################
echo "${BG} СОЗДАНИЕ ДОКЕР-КОНТЕЙНЕРА ДЛЯ ${YELLOW} FTPS ${GREEN} 13/18 ${CLEAR}"
docker build -t ftps-image ./srcs/ftps
echo "${BG} ПРИМЕНЕНИЕ YAML К ${YELLOW} FTPS ${GREEN} 14/18 ${CLEAR}"
kubectl apply -f ./srcs/yaml/ftps.yaml



##########################################################################################
#                                      GRAFANA                                           #
##########################################################################################
echo "${BG} СОЗДАНИЕ ДОКЕР-КОНТЕЙНЕРА ДЛЯ ${YELLOW} GRAFANA ${GREEN} 15/18 ${CLEAR}"
docker build -t grafana-image ./srcs/grafana
echo "${BG} ПРИМЕНЕНИЕ YAML К ${YELLOW} GRAFANA ${GREEN} 16/18 ${CLEAR}"
kubectl apply -f ./srcs/yaml/grafana.yaml



##########################################################################################
#                                      INFLUXDB                                          #
##########################################################################################
echo "${BG} СОЗДАНИЕ ДОКЕР-КОНТЕЙНЕРА ДЛЯ ${YELLOW} INFLUXDB ${GREEN} 17/18 ${CLEAR}"
docker build -t influxdb-image ./srcs/influxdb
echo "${BG} ПРИМЕНЕНИЕ YAML К ${YELLOW} INFLUXDB ${GREEN} 18/18 ${CLEAR}"
kubectl apply -f ./srcs/yaml/influxdb.yaml
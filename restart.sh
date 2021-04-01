#!/bin/bash

# services = (metallb, storage)

# minikube start --vm-driver=docker

# eval $(minikube docker-env)
# minikube addons enable metallb
# minikube addons enable dashboard

# docker build -t nginx ./srcs/nginx
# docker build -t mysql ./srcs/mysql
# docker build -t phpmyadmin ./srcs/phpmyadmin
# docker build -t ftps ./srcs/ftps
# docker build -t wordpress ./srcs/wordpress
# docker build -t influxdb ./srcs/influxdb
# docker build -t grafana ./srcs/grafana

# kubectl apply -f ./srcs/stuff/metallb.yaml
# kubectl apply -f ./srcs/stuff/storage.yaml
# kubectl apply -f ./srcs/mysql/mysql.yaml
# kubectl apply -f ./srcs/ftps/ftps.yaml
# kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml
# kubectl apply -f ./srcs/nginx/nginx.yaml
# kubectl apply -f ./srcs/wordpress/wordpress.yaml
# kubectl apply -f ./srcs/grafana/grafana.yaml
# kubectl apply -f ./srcs/influxdb/influxdb.yaml

# minikube dashboard

echo "$1"

kubectl delete svc $1
kubectl delete deployment $1

eval $(minikube docker-env)

docker build -t $1 ./srcs/$1 1>>docker_logs
kubectl apply -f ./srcs/$1/$1.yaml
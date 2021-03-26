#!/bin/bash

minikube start --driver=virtualbox --memory='2000' --disk-size 2000MB;

eval $(minikube docker-env)
minikube addons enable metallb
minikube addons enable dashboard

docker build -t nginx ./srcs/nginx
docker build -t mysql ./srcs/mysql
docker build -t phpmyadmin ./srcs/phpmyadmin
docker build -t ftps ./srcs/ftps

kubectl apply -f ./srcs/metallb.yaml
kubectl apply -f ./srcs/mysql/mysql.yaml
kubectl apply -f ./srcs/ftps/ftps.yaml
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml
kubectl apply -f ./srcs/nginx/nginx.yaml

minikube dashboard

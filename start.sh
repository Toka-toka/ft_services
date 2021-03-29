#!/bin/bash

minikube start --vm-driver=docker

eval $(minikube docker-env)
minikube addons enable metallb
minikube addons enable dashboard

docker build -t nginx ./srcs/nginx
docker build -t mysql ./srcs/mysql
docker build -t phpmyadmin ./srcs/phpmyadmin
docker build -t ftps ./srcs/ftps
docker build -t wordpress ./srcs/wordpress

kubectl apply -f ./srcs/stuff/metallb.yaml
kubectl apply -f ./srcs/stuff/storage.yaml
kubectl apply -f ./srcs/mysql/mysql.yaml
kubectl apply -f ./srcs/ftps/ftps.yaml
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml
kubectl apply -f ./srcs/nginx/nginx.yaml
kubectl apply -f ./srcs/wordpress/wordpress.yaml

minikube dashboard
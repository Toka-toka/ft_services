#!/bin/bash

minikube start --vm-driver=docker

minikube addons enable metallb
minikube addons enable dashboard

eval $(minikube docker-env)

kubectl apply -f ./srcs/stuff/metallb.yaml
kubectl apply -f ./srcs/stuff/storage.yaml

echo "Docker logs are here" > docker_logs
for services in nginx mysql phpmyadmin ftps wordpress influxdb grafana
do
echo "--- --- --- --- --- --- --- --- --- --- --- ---"
echo "build docker image $services"
docker build -t $services ./srcs/$services 1>>docker_logs
kubectl apply -f ./srcs/$services/$services.yaml
done

minikube dashboard
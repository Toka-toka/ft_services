minikube start
eval $(minikube docker-env)
minikube addons enable metallb
kubectl apply -f configmap.yaml
docker build -t nginx ./srcs/nginx
kubectl apply -f ./srcs/nginx/nginx.yaml
minikube dashboard
kubectl delete svc nginx-svc
kubectl delete deploy nginx-deployment

docker build -t nginx ./srcs/nginx
kubectl apply -f ./srcs/nginx/nginx.yaml
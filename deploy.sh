#!/bin/bash
rm -rf user-service
git clone https://github.com/agbankar/user-service.git
cd user-service
docker build -t shahpriti919/user-service .
docker login -u shahpriti919 -p $urekha12
docker push shahpriti919/user-service
kubectl delete deployment user-service-deployment
kubectl delete svc user-service-svc
kubectl apply -f user-deployment.yml
kubectl apply -f  user-service.yml
kubectl get deployments
kubectl get svc

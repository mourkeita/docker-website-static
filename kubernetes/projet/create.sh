#!/bin/bash
# Create infra

echo "Launch infra..."

kubectl create -f namespace.yml
sleep 5
kubectl apply -f mysql-deployment.yml -n wordpress
sleep 5
kubectl apply -f mysql-service.yml -n wordpress --force
sleep 5
kubectl apply -f wordpress-deployment.yml -n wordpress
sleep 5
kubectl apply -f wordpress-service.yml -n wordpress
echo "Infra started ..."
sleep 3


echo "Testing infra..."
kubectl port-forward service/wordpress-service 30001:80 --address 0.0.0.0 -n wordpress &
curl 0.0.0.0:30001
sleep 100


curl 0.0.0.0:30001
echo "Stopping tests ..."
upid=$(ps aux | grep -w '30001\|port-forward' | grep -v 'grep' | awk '{print $2}')
kill $upid
echo "PID closed"

#!/bin/bash
# Create infra

echo "Launch infra..."

kubectl create -f pod-blue.yml
sleep 5
kubectl create -f pod-red.yml
sleep 5
kubectl create -f service-nodeport-web.yml
sleep 5
echo "Infra started ..."
sleep 3

#Test
echo "Test infra"
kubectl port-forward service/service-nodeport-web 30008:8080 --address 0.0.0.0 -n production &
curl 0.0.0.0:30008

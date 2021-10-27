#!/bin/bash
echo "Infra deletion"

echo "Stop infra..."

kubectl delete -f mysql-deployment.yml -n wordpress
sleep 5
kubectl delete -f mysql-service.yml -n wordpress
sleep 5
kubectl delete -f wordpress-deployment.yml -n wordpress
sleep 5
kubectl delete -f wordpress-service.yml -n wordpress
sleep 5
kubectl delete -f namespace.yml
sleep 5
sleep 5
echo "Infra deleted ..."

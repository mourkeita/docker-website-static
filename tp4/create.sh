#!/bin/bash
# Create infra

echo "Launch infra..."

kubectl create -f mysql-volume.yml
sleep 5
kubectl create -f mysql-pv.yml
sleep 5
kubectl create -f pv.yml
kubectl create -f pvc.yml
sleep 5
echo "Infra started ..."
sleep 3


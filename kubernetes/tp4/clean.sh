#!/bin/bash
echo "Infra deletion"

echo "Stop infra..."

kubectl delete -f mysql-volume.yml
sleep 5
kubectl delete -f mysql-pv.yml
sleep 5
kubectl delete -f pvc.yml
kubectl delete -f pv.yml
sleep 5
echo "Infra deleted ..."

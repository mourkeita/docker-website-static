#!/bin/bash
echo "Infra deletion"

echo "Stop infra..."

kubectl delete -f pod-red.yml
sleep 5
kubectl delete -f pod-blue.yml
sleep 5
kubectl delete -f service-nodeport-web.yml
sleep 5
echo "Infra deleted ..."

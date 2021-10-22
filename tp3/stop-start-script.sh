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
sleep 100

#Stop pid
curl 0.0.0.0:30008
echo "Stopping tests ..."
upid=$(ps aux | grep -w '30008\|port-forward' | grep -v 'grep' | awk '{print $2}')
kill $upid
echo "PID closed"

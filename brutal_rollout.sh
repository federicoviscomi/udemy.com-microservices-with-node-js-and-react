#!/usr/bin/env bash

PROJECT_ROOT=$(pwd)

echo "Delete deployments"
kubectl delete deployment --all
echo

echo "Delete services"
kubectl delete service --all
echo

echo "Delete pods"
kubectl delete pods --all
echo

echo "Get deployments services and pods"
kubectl get deployment
kubectl get service
kubectl get pods
echo

echo "Reapply everything"
cd ${PROJECT_ROOT}/infra/k8s/
kubectl apply -f .
kubectl rollout restart deployments
echo

echo
echo
echo "DONE"
echo
echo "Deployments"
kubectl get deployment
echo
echo "Services"
kubectl get service
echo
echo "Pods"
kubectl get pods
echo


#DEPLOYMENTS=$(kubectl get deployment -o=name)
#SERVICES=$(kubectl get service -o=name)
#PODS=$(kubectl get pods -o=name)
#while read -r DEPLOYMENT
#do
#    echo "$DEPLOYMENT"
#    set -x
#    while [[ $(kubectl get ${DEPLOYMENT} -o 'jsonpath={..status.conditions[?(@.type=="READY")].status}') != "1" ]]; do
#      echo "waiting for deployment ${DEPLOYMENT} to be ready" && sleep 1;
#    done
#    set +x
#done < <(kubectl get deployment -o=name)

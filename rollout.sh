#!/usr/bin/env bash
PROJECT_ROOT=$(pwd)
echo "Get deployments services pods and ingresses"
kubectl get deployment
kubectl get service
kubectl get pods
kubectl get ingress
echo
echo "Reapply everything"
cd ${PROJECT_ROOT}/infra/k8s/
kubectl apply -f .
echo
echo "Rollout as well"
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
echo "Others"
kubectl get replicationcontroller
kubectl get rc
echo
#!/usr/bin/env bash
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
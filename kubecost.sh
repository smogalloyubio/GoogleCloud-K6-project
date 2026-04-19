#!/bin/bash


echo "Creating kubecost namespace..."
kubectl create namespace kubecost --dry-run=client -o yaml | kubectl apply -f -


echo "Adding Kubecost Helm repository..."
helm repo add kubecost https://kubecost.github.io/cost-analyzer/
helm repo update


echo "Installing Kubecost..."
helm install kubecost kubecost/cost-analyzer \
    --namespace kubecost \
    --set kubecostToken="cnVrZXZ3ZXViaW9AZ21haWwuY29t"


echo "Waiting for Kubecost to start (this may take 2 minutes)..."
kubectl rollout status deployment/kubecost-cost-analyzer -n kubecost

echo "--------------------------------------------------------"
echo "INSTALLATION COMPLETE"
echo "--------------------------------------------------------"
echo "To view the cost dashboard, run the following command:"
echo "kubectl port-forward --namespace kubecost deployment/kubecost-cost-analyzer 9090"
echo ""
echo "Then open your browser to: http://localhost:9090"
echo "--------------------------------------------------------"
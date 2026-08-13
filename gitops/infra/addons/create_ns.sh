#!/bin/bash

NAMESPACES=("sso" "grafana" "loki" "mimir" "tempo" "sonarqube" "gitlab-runner" "kong" "argocd" "k8s-monitoring" "argo-rollouts" "velero")

for NS_NAME in "${NAMESPACES[@]}"; do
    echo "========================================="
    echo "$NS_NAME 생성 시작"
    echo "========================================="
    cat <<EOF | kubectl --kubeconfig=/home/cloud-user/.kube/kubeconfig apply -f -
apiVersion: v1
kind: Namespace
metadata:
  name: ${NS_NAME}
---
apiVersion: v1
kind: Secret
metadata:
  name: harbor-secret
  namespace: ${NS_NAME}
type: kubernetes.io/dockerconfigjson
data:
  .dockerconfigjson: <harbor_secret_base64_encoded>
---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: default
  namespace: ${NS_NAME}
imagePullSecrets:
- name: harbor-secret
EOF

    echo "========================================="
    echo "$NS_NAME 생성 완료"
    echo "========================================="
done
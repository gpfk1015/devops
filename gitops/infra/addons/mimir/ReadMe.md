### helm 설치 명령어    
cd ~/gitops/infra/addons/mimir    
helm install mimir -n mimir oci://<harbor repository_url>/helm/mimir-distributed --version 0.1.0 -f values.yaml 
### helm 설치 명령어    
cd ~/gitops/infra/addons/loki    
helm install loki -n loki oci://<harbor repository_url>/helm/loki --version 0.1.0 -f values.yaml 
### helm 설치 명령어    
cd ~/gitops/infra/addons/tempo    
helm install tempo -n tempo oci://<harbor repository_url>/helm/tempo-distributed --version 0.1.0 -f values.yaml 
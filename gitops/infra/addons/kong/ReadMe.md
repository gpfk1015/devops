### helm 설치 명령어    
cd ~/gitops/infra/addons/kong    
helm install basics-kong -n kong oci://<harbor repository_url>/helm/kong --version 3.0.1 -f basics-values.yaml 
helm install inaea-kong -n kong oci://<harbor repository_url>/helm/kong --version 3.0.1 -f inaea-values.yaml 
helm install sso-kong -n kong oci://<harbor repository_url>/helm/kong --version 3.0.1 -f sso-values.yaml 
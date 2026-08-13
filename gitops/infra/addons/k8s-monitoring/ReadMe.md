### helm 설치 명령어   
cd ~/gitops/infra/addons/k8s-monitoring    
helm install k8s-monitoring -n k8s-monitoring oci://<harbor repository_url>/helm/k8s-monitoring --version 4.1.3 -f values.yaml 


### 이미지 업로드
helm repo add grafana https://grafana.github.io/helm-charts
helm repo list
helm pull grafana/k8s-monitoring --version 4.1.3
tar -zxvf k8s-monitoring-4.1.3.tgz
helm dependency update k8s-monitoring
helm package ./k8s-monitoring
helm push k8s-monitoring-4.1.3.tgz oci://<harbor repository_url>/helm 
# values 작성
# 해당 values에 맞게 추가 필요한 도커 이미지 확인
helm template test-release ./k8s-monitoring -f values.yaml | grep "image:" | sort | uniq
# 도커 이미지 하버에 업로드
sh ../docker_push.sh
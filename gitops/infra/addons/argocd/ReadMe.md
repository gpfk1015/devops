### helm 설치 명령어    
cd ~/gitops/infra/addons/argocd     
helm install argocd -n argocd oci://<harbor repository_url>/helm/argo-cd --version 0.2.0 -f values.yaml 


### ArgoCD Rollout CRD 추가
argo rollouts 이미지 내부 레지스트리에 업로드
- docker pull quay.io/argoproj/argo-rollouts:v1.9.0
- docker tag quay.io/argoproj/argo-rollouts:v1.9.0 <harbor repository_url>/helm-images/argo-rollouts:v1.9.0
- docker push <harbor repository_url>/helm-images/argo-rollouts:v1.9.0

argo-rollouts 네임스페이스 생성
$ wget https://github.com/argoproj/argo-rollouts/releases/latest/download/install.yaml
quay.io/argoproj/argo-rollouts:v1.9.0 --> <harbor repository_url>/helm-images/argo-rollouts:v1.9.0 로 변경
$ dev -n argo-rollouts apply -f argocd_rollout_install.yaml


### git repo 연결
$ dev -n argocd apply -f repo_creds.yaml
- application 개별 차트는 dev 그룹의 토큰 사용
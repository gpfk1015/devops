# 1. 내부 레지스트리 로그인 (최초 1회)
#docker login <내부-레지스트리-주소> -u <계정명> -p <비밀번호>

# 2. 이미지 이관 리스트 정의
# IMAGES=(
#   "ghcr.io/grafana/alloy-operator:1.8.1"
#   "ghcr.io/grafana/helm-chart-toolbox-kubectl:0.1.2" # 자원 삭제/업데이트 시 자원이 꼬이지 않도록 안정장치 역할
#   "quay.io/prometheus/node-exporter:v1.11.1"
#   "registry.k8s.io/kube-state-metrics/kube-state-metrics:v2.18.0"
#   "grafana/alloy:v1.8.1" # ★ 오퍼레이터가 내부에서 호출할 실무 에이전트 이미지 추가
#   "quay.io/kiwigrid/k8s-sidecar:1.26.1" 
#   "docker.io/library/busybox:1.31.1"
#   "nginxinc/nginx-unprivileged:1.25-alpine"   # 기존에 있었음
#   "memcached:1.6.27-alpine"
#   "prom/memcached-exporter:v0.14.3"
# )

IMAGES=(
  # "memcached:1.6.27-alpine"
  # "prom/memcached-exporter:v0.14.3"
  "grafana/alloy:v1.16.1"
)

# 3. 반복문을 통한 자동 이관 처리
for SRC_IMAGE in "${IMAGES[@]}"; do
  # 원본 주소에서 이미지 이름과 태그만 추출 (예: alloy-operator:1.8.1)
  #IMG_NAME_TAG=$(echo $SRC_IMAGE | awk -F'/' '{print $NF}') # 맨 뒤 이름만 가져옴
  IMG_NAME_TAG=${SRC_IMAGE#*/} # 처음 슬러시 앞만 삭제
  TARGET_IMAGE="<harbor repository_url>/helm-images/${IMG_NAME_TAG}"
  
  echo "========== 이관 시작: ${IMG_NAME_TAG} =========="
  docker pull $SRC_IMAGE
  docker tag $SRC_IMAGE $TARGET_IMAGE
  docker push $TARGET_IMAGE
  echo "========== 이관 완료 =========="
done
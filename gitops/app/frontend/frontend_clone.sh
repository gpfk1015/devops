frontend=( "basics-ba-mgmt" "basics-ba-nb" "basics-cm-ss" "basics-cm-ss-mgmt" "basics-cm-sy" "basics-sy-mgmt" "basics-backend-proxy" "basics-external-proxy" "inaea-ad-am" "inaea-ad-ap" "inaea-ad-ma" "inaea-ad-ps" "inaea-ad-se" "inaea-ad-ws" "inaea-ad-ws-mgmt" "inaea-cm-ss" "inaea-cm-ss-mgmt" "inaea-cm-sy" "inaea-sy-mgmt" "inaea-backend-proxy" "inaea-external-proxy" )

GIT_PREFIX="http://<Git Repository URL>/frontend"

for item in "${frontend[@]}"; do
    echo "- REPO: $item"
    REPO_URL="$GIT_PREFIX/$item.git"

    if [ -d "$item" ]; then
        # 로컬 디렉토리 존재 → pull
        cd "$item" || continue
        #git reset --hard          # 로컬 변경사항 초기화
        #git pull --rebase                 # 최신 상태로 동기화
        git fetch origin
        git reset --hard origin/main
        cd ..
    else
        # 로컬 디렉토리 없으면 clone
        git clone "$REPO_URL"
    fi
done
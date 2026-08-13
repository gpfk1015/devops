backend=( "basics-ba-lc" "basics-ba-lm" "basics-ba-lr" "basics-ba-mgmt" "basics-cm-auth" "basics-cm-ss" "basics-cm-sy" "inaea-ad-am-result" "inaea-ad-am-test-bank" "inaea-ad-ap" "inaea-ad-cm" "inaea-ad-ma" "inaea-ad-ps" "inaea-ad-se" "inaea-ad-ws" "inaea-cm-auth" "inaea-cm-ss" "inaea-cm-sy" "ad-batch-job" "ba-batch-job" "cm-batch-job")

GIT_PREFIX="http://<Git Repository URL>/backend"

for item in "${backend[@]}"; do
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
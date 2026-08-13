frontend=( "basics-ba-mgmt" "basics-ba-nb" "basics-cm-ss" "basics-cm-ss-mgmt" "basics-cm-sy" "basics-sy-mgmt" "inaea-ad-am" "inaea-ad-ap" "inaea-ad-ma" "inaea-ad-ps" "inaea-ad-se" "inaea-ad-ws" "inaea-ad-ws-mgmt" "inaea-cm-ss" "inaea-cm-ss-mgmt" "inaea-cm-sy" "inaea-sy-mgmt")

GIT_PREFIX="http://<Git Repository URL>/frontend"

for item in "${frontend[@]}"; do
    echo "- REPO: $item"

    if [ -d "$item" ]; then
        cd "$item" || continue
        git add .
        git commit -m "노드 개수에 따른 HPA 설정"         
        git push         
        cd ..
    else
        echo "Directory $item does not exist, skipping..."
    fi
done
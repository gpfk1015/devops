backend=( "basics-ba-lc" "basics-ba-lm" "basics-ba-lr" "basics-ba-mgmt" "basics-cm-auth" "basics-cm-ss" "basics-cm-sy" "inaea-ad-am-result" "inaea-ad-am-test-bank" "inaea-ad-ap" "inaea-ad-cm" "inaea-ad-ma" "inaea-ad-ps" "inaea-ad-se" "inaea-ad-ws" "inaea-cm-auth" "inaea-cm-ss" "inaea-cm-sy" )
# "ad-batch-job" "ba-batch-job" "cm-batch-job"
GIT_PREFIX="http://<Git Repository URL>/backend"

for item in "${backend[@]}"; do
    echo "- REPO: $item"

    if [ -d "$item" ]; then
        cd "$item" || continue
        git add .
        #git commit -am "Spring DB IP정보 및 Max Replicas 로 변경"         
        #git commit -am "HPA false 및 replicas 0으로 변경"  
        #git commit -am "HPA true로 변경"  
        git commit -am "노드 개수에 따른 HPA 설정"
        git push         
        cd ..
    else
        echo "Directory $item does not exist, skipping..."
    fi
done
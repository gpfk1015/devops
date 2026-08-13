
## 점검페이지 띄우기
kif apply -f ./maintenance-page-inaea-default.yaml
kif apply -f ./maintenance-page-inaea-mgmt.yaml
kbf apply -f ./maintenance-page-basics-default.yaml
kbf apply -f ./maintenance-page-basics-mgmt.yaml

## 점검페이지 내리기
kif delete -f ./maintenance-page-inaea-default.yaml
kif delete -f ./maintenance-page-inaea-mgmt.yaml
kbf delete -f ./maintenance-page-basics-default.yaml
kbf delete -f ./maintenance-page-basics-mgmt.yaml

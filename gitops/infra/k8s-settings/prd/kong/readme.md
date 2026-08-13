          prd-kks-basic-be   prd-kks-basic-be   75faafc8-d229-4ddb-9865-5f53d5a327c7   
          prd-kks-basic-fe   prd-kks-basic-fe   96ffa04f-aba6-4f76-9270-d83f5b6e9881   
          prd-kks-cmp        prd-kks-cmp        9a8475f5-3f02-4177-ae98-09e2c8d5a27b   
*         prd-kks-inaea-be   prd-kks-inaea-be   0b14b160-0a5c-489f-87dc-b7523d3057d0   
          prd-kks-inaea-fe   prd-kks-inaea-fe   bc43854a-7aa1-4573-8a72-924f76fc01cc 

kubectl config use-context prd-kks-basic-be
kubectl -n serengeti-kong get pod
helm -n serengeti-kong get values serengeti-kong > prd-basics-be-kong.yaml
helm upgrade  -n serengeti-kong serengeti-kong oci://<harbor prod repository_url>/helm/kong --values prd-basics-be-kong.yaml
kubectl -n serengeti-kong scale deployment serengeti-kong-kong --replicas=1

kubectl config use-context prd-kks-basic-fe
kubectl -n serengeti-kong get pod
helm -n serengeti-kong get values serengeti-kong > prd-basics-fe-kong.yaml
helm upgrade  -n serengeti-kong serengeti-kong oci://<harbor prod repository_url>/helm/kong --values prd-basics-fe-kong.yaml
kubectl -n serengeti-kong scale deployment serengeti-kong-kong --replicas=1

kubectl -n mgmt-kong get pod
helm -n mgmt-kong get values mgmt-kong > prd-basics-fe-mgmt-kong.yaml
helm upgrade  -n mgmt-kong mgmt-kong oci://<harbor prod repository_url>/helm/kong --values prd-basics-fe-mgmt-kong.yaml
kubectl -n mgmt-kong scale deployment mgmt-kong-kong --replicas=1

kubectl config use-context prd-kks-inaea-be
kubectl -n serengeti-kong get pod
helm -n serengeti-kong get values serengeti-kong > prd-inaea-be-kong.yaml
helm upgrade  -n serengeti-kong serengeti-kong oci://<harbor prod repository_url>/helm/kong --values prd-inaea-be-kong.yaml
kubectl -n serengeti-kong scale deployment serengeti-kong-kong --replicas=1

kubectl config use-context prd-kks-inaea-fe
kubectl -n serengeti-kong get pod
helm -n serengeti-kong get values serengeti-kong > prd-inaea-fe-kong.yaml
helm upgrade  -n serengeti-kong serengeti-kong oci://<harbor prod repository_url>/helm/kong --values prd-inaea-fe-kong.yaml
kubectl -n serengeti-kong scale deployment serengeti-kong-kong --replicas=1

kubectl -n mgmt-kong get pod
helm -n mgmt-kong get values mgmt-kong > prd-inaea-fe-mgmt-kong.yaml
helm upgrade  -n mgmt-kong mgmt-kong oci://<harbor prod repository_url>/helm/kong --values prd-inaea-fe-mgmt-kong.yaml
kubectl -n mgmt-kong rollout restart deployment mgmt-kong-kong
kubectl -n serengeti-kong scale deployment serengeti-kong-kong --replicas=1

next version


<harbor prod repository_url>/helm-images/kong:3.9
<harbor prod repository_url>/helm-images/kong/kubernetes-ingress-controller:3.5
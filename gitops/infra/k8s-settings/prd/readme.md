prd-kks-basic-fe-LB01 기초학력지원포털 FE ROUNDROBIN HTTP 14.63.186.153 172.30.71.181 80 prd-kks-basic-fe.worker001~003
prd-kks-basic-fe-LB02 기초학력지원포털 FE ROUNDROBIN SSLBRIDGE 14.63.186.153 172.30.71.181 443 prd-kks-basic-fe.worker001~003
prd-kks-basic-be-LB01 기초학력지원포털 BE ROUNDROBIN HTTP 14.63.186.237 172.30.81.181 80 prd-kks-basic-be.worker001~003
prd-kks-basic-be-LB02 기초학력지원포털 BE ROUNDROBIN SSLBRIDGE 14.63.186.237 172.30.81.181 443 prd-kks-basic-be.worker001~003
prd-kks-inaea-fe-LB01 학력진단 서비스 FE ROUNDROBIN HTTP 14.63.186.154 172.30.91.181 80 prd-kks-inaea-fe.worker001~003
prd-kks-inaea-fe-LB02 학력진단 서비스 FE ROUNDROBIN SSLBRIDGE 14.63.186.154 172.30.91.181 443 prd-kks-inaea-fe.worker001~003
prd-kks-inaea-be-LB01 학력진단 서비스 BE ROUNDROBIN HTTP 14.63.186.238 172.30.101.181 80 prd-kks-inaea-be.worker001~003
prd-kks-inaea-be-LB02 학력진단 서비스 BE ROUNDROBIN SSLBRIDGE 14.63.186.238 172.30.101.181 443 prd-kks-inaea-be.worker001~003

kbf -n kube-system edit configmap coredns

apiVersion: v1
kind: ConfigMap
metadata:
  name: coredns
  namespace: kube-system
data:
  Corefile: |
    .:53 {
        errors
        health
        ready
        kubernetes cluster.local in-addr.arpa ip6.arpa {
           pods insecure
           fallthrough in-addr.arpa ip6.arpa
           ttl 30
        }
        hosts {
            172.30.81.181 *.backend
            fallthrough
        }
        forward . /etc/resolv.conf
        cache 30
        loop
        reload
        loadbalance
    }



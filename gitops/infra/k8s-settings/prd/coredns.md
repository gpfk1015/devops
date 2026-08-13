## coredns에 추가 한 내용

각 클러스터의 coredns configmap에 다음 내용을 추가 합니다.

## bf

        template IN A backend {
           match ^[a-z0-9-]+\.backend\.$
           answer "{{ .Name }} 60 IN A 172.30.81.181"
        }
        hosts {
            172.30.41.181 synapdoc.external
            172.30.41.182 smartform.external
            fallthrough
        }

## if

        template IN A backend {
           match ^[a-z0-9-]+\.backend\.$
           answer "{{ .Name }} 60 IN A 172.30.101.181"
        }
        hosts {
            172.30.41.181 synapdoc.external
            172.30.41.182 smartform.external
            fallthrough
        }
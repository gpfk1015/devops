  Corefile: "re.kr:53 {\n    forward . 172.30.21.116 {\n        policy sequential\n
    \       health_check 2s\n        max_fails 2\n        # prefer_udp           #
    (선택) UDP 선호 플래그, 필요시 주석 해제\n        # max_concurrent 1000  # (선택) 동시 처리량 조정\n
    \   }\n    cache 30\n    errors\n}\n\n.:53 {\n    errors\n    health {\n       lameduck
    5s\n    }\n    ready\n    kubernetes cluster.local in-addr.arpa ip6.arpa {\n       pods
    insecure\n       fallthrough in-addr.arpa ip6.arpa\n       ttl 30\n    }\n    template
    IN A backend {\n       match ^[a-z0-9-]+\\.backend\\.$\n       answer \"{{ .Name
    }} 60 IN A 172.30.101.181\"\n    }\n    hosts {\n        172.30.41.181 synapdoc.external\n
    \       172.30.41.182 smartform.external\n        172.30.21.182 epki.external
    \     \n        fallthrough\n    }\n    prometheus :9153\n    forward . /etc/resolv.conf
    {\n       max_concurrent 1000\n    }\n    cache 30\n    loop\n    reload\n    loadbalance\n}\n"
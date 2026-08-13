        template IN A backend {
           match ^[a-z0-9-]+\.backend\.$
           answer "{{ .Name }} 60 IN A 172.30.81.181"
        }
        hosts {
            172.30.41.181 synapdoc.external
            172.30.41.182 smartform.external
            172.30.21.182 epki.external
            fallthrough
        }
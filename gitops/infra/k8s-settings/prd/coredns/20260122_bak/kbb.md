        template IN A Namespace_B.svc {
            match ^[a-z0-9-]+\.Namespace_B\.svc\.$
            answer "{{ .Name }} 60 IN A 172.30.101.181"
        }
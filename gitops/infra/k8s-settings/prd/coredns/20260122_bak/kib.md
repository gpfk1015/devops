        template IN A <namespace>.svc {
            match ^[a-z0-9-]+\.<namespace>\.svc\.$
            answer "{{ .Name }} 60 IN A 172.30.81.181"
        }
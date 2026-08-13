kbb create ns jennifer
kib create ns jennifer

kbb create secret docker-registry image-pull-secret \
  --docker-server=<harbor prod repository_url> \
  --docker-username=kice \
  --docker-password=Kice@0812 \
  --docker-email=kice@adnp.co.kr \
  --namespace=jennifer

kbf create ns sso
kif create ns sso

kbf create secret docker-registry image-pull-secret \
  --docker-server=<harbor prod repository_url> \
  --docker-username=kice \
  --docker-password=Kice@0812 \
  --docker-email=kice@adnp.co.kr \
  --namespace=sso

kif create secret docker-registry image-pull-secret \
  --docker-server=<harbor prod repository_url> \
  --docker-username=kice \
  --docker-password=Kice@0812 \
  --docker-email=kice@adnp.co.kr \
  --namespace=sso
  
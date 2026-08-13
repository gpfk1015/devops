### helm 설치 명령어    
cd ~/gitops/infra/addons/nfs-subdir-external-provisioner   
helm install nfs-provisioner -n ktc-nfs-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner -f values.yaml 


생성되는 항목 참고)
[cloud-user@dev-kvm-sec-bastion-01 hcp]$ hcp get manifest -n ktc-nfs-provisioner nfs-provisioner
---
# Source: nfs-subdir-external-provisioner/templates/storageclass.yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  labels:
    chart: nfs-subdir-external-provisioner-4.0.18
    heritage: Helm
    app: nfs-subdir-external-provisioner
    release: nfs-provisioner
  name: ktc-nfs-client
  annotations:
    storageclass.kubernetes.io/is-default-class: "true"
provisioner: cluster.local/nfs-provisioner-nfs-subdir-external-provisioner
allowVolumeExpansion: true
reclaimPolicy: Delete
volumeBindingMode: Immediate
parameters:
  archiveOnDelete: "true"
---
# Source: nfs-subdir-external-provisioner/templates/clusterrole.yaml
kind: ClusterRole
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  labels:
    chart: nfs-subdir-external-provisioner-4.0.18
    heritage: Helm
    app: nfs-subdir-external-provisioner
    release: nfs-provisioner
  name: nfs-provisioner-nfs-subdir-external-provisioner-runner
rules:
  - apiGroups: [""]
    resources: ["nodes"]
    verbs: ["get", "list", "watch"]
  - apiGroups: [""]
    resources: ["persistentvolumes"]
    verbs: ["get", "list", "watch", "create", "delete"]
  - apiGroups: [""]
    resources: ["persistentvolumeclaims"]
    verbs: ["get", "list", "watch", "update"]
  - apiGroups: ["storage.k8s.io"]
    resources: ["storageclasses"]
    verbs: ["get", "list", "watch"]
  - apiGroups: [""]
    resources: ["events"]
    verbs: ["create", "update", "patch"]
---
# Source: nfs-subdir-external-provisioner/templates/clusterrolebinding.yaml
kind: ClusterRoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  labels:
    chart: nfs-subdir-external-provisioner-4.0.18
    heritage: Helm
    app: nfs-subdir-external-provisioner
    release: nfs-provisioner
  name: run-nfs-provisioner-nfs-subdir-external-provisioner
subjects:
  - kind: ServiceAccount
    name: default
    namespace: ktc-nfs-provisioner
roleRef:
  kind: ClusterRole
  name: nfs-provisioner-nfs-subdir-external-provisioner-runner
  apiGroup: rbac.authorization.k8s.io
---
# Source: nfs-subdir-external-provisioner/templates/role.yaml
kind: Role
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  labels:
    chart: nfs-subdir-external-provisioner-4.0.18
    heritage: Helm
    app: nfs-subdir-external-provisioner
    release: nfs-provisioner
  name: leader-locking-nfs-provisioner-nfs-subdir-external-provisioner
rules:
  - apiGroups: [""]
    resources: ["endpoints"]
    verbs: ["get", "list", "watch", "create", "update", "patch"]
---
# Source: nfs-subdir-external-provisioner/templates/rolebinding.yaml
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  labels:
    chart: nfs-subdir-external-provisioner-4.0.18
    heritage: Helm
    app: nfs-subdir-external-provisioner
    release: nfs-provisioner
  name: leader-locking-nfs-provisioner-nfs-subdir-external-provisioner
subjects:
  - kind: ServiceAccount
    name: default
    namespace: ktc-nfs-provisioner
roleRef:
  kind: Role
  name: leader-locking-nfs-provisioner-nfs-subdir-external-provisioner
  apiGroup: rbac.authorization.k8s.io
---
# Source: nfs-subdir-external-provisioner/templates/deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nfs-provisioner-nfs-subdir-external-provisioner
  labels:
    chart: nfs-subdir-external-provisioner-4.0.18
    heritage: Helm
    app: nfs-subdir-external-provisioner
    release: nfs-provisioner
spec:
  replicas: 1
  strategy:
    type: Recreate
  selector:
    matchLabels:
      app: nfs-subdir-external-provisioner
      release: nfs-provisioner
  template:
    metadata:
      annotations:
      labels:
        app: nfs-subdir-external-provisioner
        release: nfs-provisioner
    spec:
      serviceAccountName: default
      securityContext:
        {}
      containers:
        - name: nfs-subdir-external-provisioner
          image: "registry.k8s.io/sig-storage/nfs-subdir-external-provisioner:v4.0.2"
          imagePullPolicy: IfNotPresent
          securityContext:
            {}
          volumeMounts:
            - name: nfs-subdir-external-provisioner-root
              mountPath: /persistentvolumes
          env:
            - name: PROVISIONER_NAME
              value: cluster.local/nfs-provisioner-nfs-subdir-external-provisioner
            - name: NFS_SERVER
              value: 172.26.61.11
            - name: NFS_PATH
              value: /share_d6a6c05d_6009_4246_927d_285ba7231418
      volumes:
        - name: nfs-subdir-external-provisioner-root
          nfs:
            server: 172.26.61.11
            path: /share_d6a6c05d_6009_4246_927d_285ba7231418

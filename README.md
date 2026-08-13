# DevOps Repository

이 레포지토리는 DevOps 관련 코드 자산의 관리 및 코드 리뷰를 목적으로 구성되었습니다. 
ArgoCD를 활용한 **GitOps 배포 환경**, **Helm 기반의 패키지 관리**, 그리고 **프로젝트 관리 요소**를 중앙 집중화하여 관리합니다.

---

## Repository Structure

```text
.
├── 📂 gitops/            # ArgoCD와 연동된 GitOps 배포 매니페스트
│   ├── 📂 app/           # 애플리케이션 배포 설정
│   └── 📂 infra/         # K8s 인프라스트럭처 설정
└── 📂 management/        # 어플리케이션 관리용 repo
│   └── 📂 scale-ops/     # 어플리케이션 hpa 설정 자동화
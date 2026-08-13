# 프로젝트 개요

본 리포지토리는 `service-a.com` 및 `service-b.com` 두 개의 멀티 도메인 서비스를 운영하기 위한 GitOps 기반의 인프라 및 배포 설정 저장소입니다. 
ArgoCD를 활용한 선언적 배포를 위해 인프라 템플릿(Infra)과 어플리케이션 배포 환경(App)을 완벽히 분리하여, 템플릿의 재사용성을 극대화하고 배포 파이프라인의 안정성을 높였습니다.

---

## 디렉터리 구조 및 역할 분리

| 디렉터리 | 역할 | 상세 내용 |
| :--- | :--- | :--- |
| `/app` | 배포 설정 (Values & ArgoCD) | 각 어플리케이션의 환경별 `values.yaml` 및 ArgoCD Application 매니페스트 관리 |
| `/infra` | 템플릿 및 Addon (Helm Charts) | 공통 Helm Chart 템플릿 및 K8s 클러스터 설정/모니터링 도구 관리 |

---

## 어플리케이션 구성 (App Repository)

도메인별(Service A, Service B)로 동일한 마이크로서비스 아키텍처 패턴을 적용하여 인프라 복잡도를 낮추고 유지보수성을 향상시켰습니다.

### Backend Services
| 컴포넌트 | 설명 |
| :--- | :--- |
| `a-spring` / `b-spring` | 핵심 비즈니스 로직을 처리하는 백엔드 API 어플리케이션 |
| `a-batch` | 대용량 데이터 처리 및 주기가 설정된 배치 작업 프로세스 |

### Frontend & Proxy Services
| 컴포넌트 | 설명 |
| :--- | :--- |
| `a-nextjs` / `b-nextjs` | 사용자 대상의 프론트엔드 웹 어플리케이션 |
| `a-backend-proxy` / `b-backend-proxy` | 내부망 백엔드 API 호출을 위한 CSR(Client-Side Rendering) 통신용 프록시 |
| `a-external-proxy` / `b-external-proxy`| 외부 레거시 시스템(VM) 연동을 위한 전용 라우팅 프록시 |

---

## 인프라 및 관측성 구성 (Infra Repository)

단일 Chart로 다양한 환경을 지원할 수 있도록 모듈화하였으며, 클러스터 관측성(Observability) 확보를 위한 서드파티 도구를 함께 관리합니다.

| 경로 | 용도 | 설명 |
| :--- | :--- | :--- |
| `/infra/charts` | 사내 표준 Helm Chart | Deployment, Service, Ingress 등 공통으로 사용하는 템플릿 차트 |
| `/infra/addons` | 서드파티 및 인프라 도구 | LGTM(Loki, Grafana, Tempo, Mimir) 스택 등 관측성 확보를 위한 설정 |
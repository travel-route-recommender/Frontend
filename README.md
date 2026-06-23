# TripMatch

두 사람의 여행 성향을 매칭하고, 둘 다 만족할 수 있는 여행 코스와 일정을 추천해주는 Flutter 모바일 앱입니다.

> **하나의 코드베이스로 iOS · Android 모두 대응합니다.**  
> `ios/`, `android/` 폴더는 Flutter 빌드 설정용이며, 실제 화면 코드는 `lib/`에서 공통 관리합니다.

## 기술 스택

- **Flutter** (Dart 3.7+)
- **go_router** — 화면 라우팅
- **ChangeNotifier** — 초기 상태 관리 (추후 Riverpod 확장 가능)

## 실행 방법

```bash
cd frontend
flutter pub get
flutter run
```

에뮬레이터/실기기 연결 후 실행하면 됩니다.

```bash
# iOS 시뮬레이터
flutter run -d ios

# Android 에뮬레이터
flutter run -d android

# 정적 분석
flutter analyze
```

## 폴더 구조

```
frontend/
├── lib/
│   ├── main.dart              # 앱 진입점
│   ├── app.dart               # MaterialApp 설정
│   ├── core/                  # 테마, 라우터, 상수
│   ├── shared/                # 공통 위젯, 유틸
│   ├── data/                  # 모델, mock, repository
│   └── features/              # 기능별 화면
│       ├── onboarding/
│       ├── quiz/
│       ├── result/
│       ├── matching/
│       ├── adjustment/
│       ├── course/
│       └── schedule/
├── assets/
│   ├── images/
│   └── icons/
├── ios/                       # iOS 빌드 설정 (플랫폼별 UI 코드 없음)
└── android/                   # Android 빌드 설정 (플랫폼별 UI 코드 없음)
```

## 라우트 목록

| 경로 | 화면 |
|------|------|
| `/` | 시작 (Onboarding) |
| `/quiz` | 여행 성향 질문 |
| `/travel-type-result` | 개인 여행 성향 결과 |
| `/invite` | 동행자 초대 |
| `/match-result` | 두 사람 매칭 결과 |
| `/adjustment` | AI 조율안 |
| `/schedule-style` | 일정 스타일 선택 |
| `/courses` | 추천 코스 리스트 |
| `/edit-schedule` | 함께 수정하는 일정 |
| `/final-schedule` | 최종 일정 요약 |

## 협업 방식

- **기능별 분담**: iOS/Android로 나누지 않고, 화면·기능 단위로 작업합니다.
- **테스트 분담**: iPhone은 개발자 A, Android/Samsung은 개발자 B가 담당합니다.
- **브랜치 전략**: `main` 직접 push 금지, 기능 브랜치 → PR → merge
- **상세 규칙**: [CONTRIBUTING.md](./CONTRIBUTING.md) 참고

## 작업 기록

### 2026-06-20 · 윤지

TripMatch Flutter 프론트엔드 초기 프로젝트 셋업 및 핵심 화면 플로우 구현.

- **프로젝트 생성**: `frontend/` Flutter 프로젝트 초기화 (`tripmatch`, iOS/Android 공통 코드베이스)
- **코어 레이어**: `AppColors`, `AppTextStyles`, `AppTheme`, `go_router` 기반 라우트 설정
- **공통 위젯**: `PrimaryButton`, `SecondaryButton`, `AppCard`, `OptionCard`, `TagChip`, `ProgressHeader`, `SectionTitle`
- **데이터 레이어**: 모델(`travel_type`, `quiz_question`, `match_result`, `itinerary_item`), mock data, `TripRepository`(ChangeNotifier)
- **화면 구현** (mock data 연결, 화면 간 이동 가능):
  - Onboarding → Quiz(8문항) → Travel Type Result
  - Invite(동행자 응답 대기 시뮬레이션) → Match Result
  - Adjustment → Schedule Style → Course Recommendation
  - Editable Schedule(ReorderableListView) → Final Schedule
- **협업 문서**: `CONTRIBUTING.md` 작성, README에 실행 방법·폴더 구조·라우트·개발자 분담 정리
- **검증**: `flutter analyze` 통과, smoke test 추가

### 2026-06-23 · 윤지

앱 진입 플로우 확장 및 프로젝트 구조 정리.

- **인증 화면 추가**: `LoginScreen`, `SignUpScreen` — 로그인/회원가입 UI, redirect 파라미터 지원
- **홈·탐색 화면 추가**:
  - `StartingScreen` — 앱 시작 진입점
  - `HomeScreen` — 메인 홈 메뉴
  - `BrowseTripsScreen` — 여행지 탐색
  - `OngoingTripsScreen` / `OngoingTripDetailScreen` — 진행 중인 여행 목록·상세
- **프로필·동행자**: `MyPageScreen`, `CompanionInviteScreen` 추가
- **데이터·라우터 확장**:
  - `OngoingTrip` 모델 및 mock data 보강
  - `TripRepository` 상태·메서드 추가
  - `/starting`, `/home`, `/login`, `/sign-up`, `/ongoing-trips`, `/browse-trips`, `/my-page`, `/companion-invite` 등 라우트 연결
- **기존 화면 연동 수정**: Onboarding, Travel Type Result, Final Schedule 등 신규 플로우와 navigation 연결



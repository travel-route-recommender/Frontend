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

## 개발자 역할 분담

### 개발자 A
- onboarding
- quiz
- travel type result
- 공통 위젯: `option_card`, `progress_header`
- **테스트**: iPhone (iOS)

### 개발자 B
- invite
- matching result
- adjustment
- course recommendation
- editable schedule
- final schedule
- 위젯: `course_card`, `itinerary_item_card`
- **테스트**: Android / Samsung

## 현재 상태

- 백엔드 미연동 — mock data로 전체 플로우 탐색 가능
- `TripRepository`를 통해 추후 API 연동 시 data layer만 교체하면 됩니다

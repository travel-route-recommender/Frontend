# Contributing to TripMatch

TripMatch 프론트엔드 협업 가이드입니다.

## 브랜치 규칙

- **`main` 직접 push 금지**
- **`dev` 직접 push도 되도록 피하고 PR 권장**
- 기능별 브랜치에서 작업 후 Pull Request로 merge

### 브랜치 이름 예시

```
feat/onboarding
feat/quiz-flow
feat/matching
feat/course-recommendation
feat/schedule-edit
fix/quiz-navigation
style/update-button-radius
refactor/extract-tag-chip
```

## 커밋 메시지

Conventional Commits 스타일을 권장합니다.

```
feat: add onboarding screen
fix: adjust quiz card layout
style: update primary button radius
refactor: extract tag chip widget
docs: update README route list
```

## Pull Request

1. PR 제목은 변경 내용을 한 줄로 요약
2. **스크린샷 첨부** (UI 변경 시 필수)
3. merge 전 **`flutter analyze` 실행** — 오류 없이 통과해야 합니다
4. 리뷰어 1명 이상 approve 후 merge

## 공통 위젯 수정 시

`lib/shared/widgets/` 아래 파일을 수정하면 **팀원 전체에게 공유**해주세요.

영향 받는 위젯:
- `primary_button.dart`
- `secondary_button.dart`
- `option_card.dart`
- `tag_chip.dart`
- `progress_header.dart`
- `app_card.dart`
- `section_title.dart`

## 코딩 컨vention

- 색상: `AppColors` 사용 (하드코딩 금지)
- 텍스트: `AppTextStyles` 사용
- 화면 좌우 padding: `Responsive.horizontalPadding` (24)
- mock data는 `lib/data/mock/`에, UI는 `lib/features/`에 분리
- `const` 가능한 곳에는 `const` 사용

## 로컬 검증 체크리스트

```bash
cd frontend
flutter pub get
flutter analyze
flutter run
```

- [ ] iOS / Android 양쪽에서 레이아웃 확인 (테스트 담당자별)
- [ ] 화면 간 navigation 정상 동작
- [ ] analyze 오류 없음

## 플랫폼 테스트 분담

| 담당 | 기기 |
|------|------|
| 개발자 A | iPhone (iOS) |
| 개발자 B | Android / Samsung |

플랫폼별 코드 분리는 하지 않습니다. UI 이슈 발견 시 GitHub Issue에 기기/OS/스크린샷과 함께 등록해주세요.

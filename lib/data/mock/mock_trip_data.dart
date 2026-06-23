import 'package:tripmatch/data/models/itinerary_item.dart';
import 'package:tripmatch/data/models/match_result.dart';
import 'package:tripmatch/data/models/ongoing_trip.dart';
import 'package:tripmatch/data/models/quiz_question.dart';
import 'package:tripmatch/data/models/travel_type.dart';

abstract final class MockTripData {
  static const String inviteLink = 'tripmatch.com/invite/abc123';

  static const TravelType myTravelType = TravelType(
    name: '감성 여유형 여행자',
    description:
        '많은 장소를 빠르게 방문하기보다, 분위기 좋은 장소에서 오래 머무는 여행을 선호해요.',
    tags: ['바다', '카페', '산책', '사진스팟', '여유로운코스'],
    warning: '긴 이동과 빡빡한 일정은 피하는 것이 좋아요.',
    emoji: '🌊',
  );

  static const TravelType partnerTravelType = TravelType(
    name: '알차게 즐기는 탐험형',
    description: '새로운 장소를 빠르게 둘러보고, 맛집과 액티비티를 함께 즐기는 스타일이에요.',
    tags: ['맛집', '액티비티', '문화', '바다'],
    warning: '너무 느슨한 일정은 지루하게 느껴질 수 있어요.',
    emoji: '🗺️',
  );

  static const List<QuizQuestion> quizQuestions = [
    QuizQuestion(
      id: 'q1',
      question: '여행 첫날 아침, 더 끌리는 쪽은?',
      category: '일정 밀도',
      options: [
        QuizOption(id: 'q1_a', label: '8시부터 알차게 출발'),
        QuizOption(id: 'q1_b', label: '느긋하게 준비하고 11시 출발'),
      ],
    ),
    QuizQuestion(
      id: 'q2',
      question: '이동 수단은 어떤 게 더 편해요?',
      category: '이동 선호',
      options: [
        QuizOption(id: 'q2_a', label: '걸어서 천천히 둘러보기'),
        QuizOption(id: 'q2_b', label: '차로 빠르게 이동하기'),
      ],
    ),
    QuizQuestion(
      id: 'q3',
      question: '점심 시간, 더 선호하는 건?',
      category: '맛집',
      options: [
        QuizOption(id: 'q3_a', label: '웨이팅 있어도 유명 맛집'),
        QuizOption(id: 'q3_b', label: '분위기 좋은 조용한 카페'),
      ],
    ),
    QuizQuestion(
      id: 'q4',
      question: '여행지에서 가장 중요한 건?',
      category: '취향',
      options: [
        QuizOption(id: 'q4_a', label: '예쁜 풍경과 사진'),
        QuizOption(id: 'q4_b', label: '새로운 경험과 체험'),
      ],
    ),
    QuizQuestion(
      id: 'q5',
      question: '저녁 시간은 어떻게 보내고 싶어요?',
      category: '일정 밀도',
      options: [
        QuizOption(id: 'q5_a', label: '야경과 야시장 탐방'),
        QuizOption(id: 'q5_b', label: '숙소에서 푹 쉬기'),
      ],
    ),
    QuizQuestion(
      id: 'q6',
      question: '숙소 선택 기준은?',
      category: '휴식',
      options: [
        QuizOption(id: 'q6_a', label: '위치와 접근성'),
        QuizOption(id: 'q6_b', label: '분위기와 인테리어'),
      ],
    ),
    QuizQuestion(
      id: 'q7',
      question: '함께 가면 좋은 장소는?',
      category: '취향',
      options: [
        QuizOption(id: 'q7_a', label: '바다와 해변'),
        QuizOption(id: 'q7_b', label: '산과 자연'),
      ],
    ),
    QuizQuestion(
      id: 'q8',
      question: '여행 중 예상치 못한 상황이 생기면?',
      category: '유연성',
      options: [
        QuizOption(id: 'q8_a', label: '계획대로 진행하고 싶어요'),
        QuizOption(id: 'q8_b', label: '그때그때 바꿔도 괜찮아요'),
      ],
    ),
  ];

  static const MatchResult matchResult = MatchResult(
    compatibilityScore: 82,
    matchingAreas: ['바다', '카페', '맛집', '사진스팟'],
    adjustmentAreas: ['일정 밀도', '웨이팅 선호도'],
    avoidAreas: ['과도한 이동', '액티비티 중심 일정'],
    summary: '두 분은 장소 취향은 잘 맞지만, 여행 속도에서 차이가 있어요.',
  );

  static const AdjustmentPlan adjustmentPlan = AdjustmentPlan(
    aiMessage:
        '두 분 모두 바다와 카페를 좋아하지만, 일정 속도는 조금 달라요. '
        '오전에는 대표 장소 2곳을 보고, 오후에는 카페와 산책 시간을 넉넉히 넣어볼게요.',
    summaryPoints: [
      '오전: 핵심 관광지 중심',
      '오후: 여유로운 카페·산책',
      '이동: 가까운 동선 위주',
    ],
  );

  static const List<ScheduleStyle> scheduleStyles = [
    ScheduleStyle(
      type: ScheduleStyleType.jType,
      title: 'J형 보기',
      description: '시간표와 동선을 구체적으로 정리해요',
      example: '10:00 강릉역 → 10:40 안목해변 → 12:00 점심',
    ),
    ScheduleStyle(
      type: ScheduleStyleType.pType,
      title: 'P형 보기',
      description: '필수 장소와 선택 후보만 정해둬요',
      example: '오전: 바다 산책 / 오후: 카페거리 or 경포호',
    ),
  ];

  static const List<CourseRecommendation> courses = [
    CourseRecommendation(
      id: 'course_1',
      title: '교집합 코스',
      subtitle: '둘 다 좋아한 장소 중심',
      places: ['안목해변', '바다 전망 카페', '중앙시장', '야경 산책'],
      tags: ['바다', '카페', '맛집'],
      compatibilityScore: 92,
      isRecommended: true,
    ),
    CourseRecommendation(
      id: 'course_2',
      title: '조율형 코스',
      subtitle: '알찬 일정과 여유 시간을 함께 반영',
      places: ['오죽헌', '카페거리', '경포호 산책', '맛집'],
      tags: ['문화', '카페', '산책'],
      compatibilityScore: 88,
      isRecommended: false,
    ),
    CourseRecommendation(
      id: 'course_3',
      title: '여유형 코스',
      subtitle: '이동과 휴식 시간을 넉넉하게',
      places: ['브런치', '강문해변', '카페', '소품샵'],
      tags: ['힐링', '카페', '바다'],
      compatibilityScore: 84,
      isRecommended: false,
    ),
  ];

  static List<ItineraryItem> defaultItinerary = [
    const ItineraryItem(
      id: 'item_1',
      placeName: '안목해변 산책',
      startTime: '10:00',
      endTime: '11:30',
      tags: ['바다', '산책'],
      reason: '두 분 모두 바다를 좋아해요',
      day: 1,
    ),
    const ItineraryItem(
      id: 'item_2',
      placeName: '바다 전망 카페',
      startTime: '11:30',
      endTime: '13:00',
      tags: ['카페', '사진스팟'],
      reason: '여유롭게 쉬며 대화하기 좋아요',
      day: 1,
    ),
    const ItineraryItem(
      id: 'item_3',
      placeName: '중앙시장 점심',
      startTime: '13:30',
      endTime: '14:30',
      tags: ['맛집'],
      reason: '강릉 대표 로컬 맛집',
      day: 1,
    ),
    const ItineraryItem(
      id: 'item_4',
      placeName: '야경 산책',
      startTime: '19:00',
      endTime: '20:00',
      tags: ['야경', '산책'],
      reason: '하루를 마무리하기 좋은 코스',
      day: 1,
    ),
  ];

  static const FinalScheduleSummary finalSummary = FinalScheduleSummary(
    title: '감성힐링형 여행',
    description:
        '우리는 빠르게 많이 보기보다, 좋은 장소를 천천히 즐기는 여행이 잘 맞아요.',
    preferences: {
      '바다': 35,
      '카페': 30,
      '맛집': 25,
      '산책': 10,
    },
    dayPlans: {
      'Day 1': '안목해변 → 카페 → 중앙시장 → 야경',
      'Day 2': '브런치 → 경포호 → 소품샵',
    },
  );

  static const onboardingExample = {
    'user1': '감성 여유형',
    'user2': '알차게 즐기는형',
    'match': '82%',
    'highlight': '바다 · 카페 · 맛집',
  };

  static const List<OngoingTrip> ongoingTrips = [
    OngoingTrip(
      id: 'trip_1',
      title: '강릉 1박 2일',
      destination: '강릉 · 동해',
      status: '조율 중',
      progressLabel: 'AI 조율안까지 완료',
      lastUpdated: '2일 전',
      summary: '감성 여유형 + 알차게 즐기는 탐험형. 바다·카페 취향은 잘 맞고, 일정 속도 조율이 필요해요.',
      currentStep: 4,
    ),
    OngoingTrip(
      id: 'trip_2',
      title: '제주 3박 4일',
      destination: '제주도',
      status: '조율 중',
      progressLabel: '추천 코스 선택 중',
      lastUpdated: '5일 전',
      summary: '맛집과 자연을 함께 즐기는 코스를 고르는 중이에요.',
      currentStep: 6,
    ),
    OngoingTrip(
      id: 'trip_3',
      title: '부산 당일치기',
      destination: '부산',
      status: '조율 중',
      progressLabel: '성향 진단 완료',
      lastUpdated: '1주 전',
      summary: '개인 성향 결과까지 확인했어요. 동행자 매칭 결과를 기다리는 중이에요.',
      currentStep: 3,
    ),
  ];

  static const List<Map<String, String>> publicTrips = [
    {
      'author': '민지',
      'destination': '강릉',
      'title': '바다와 카페 중심 힐링 코스',
      'summary': '안목해변 → 전망 카페 → 중앙시장 → 야경 산책',
      'tags': '바다,카페,힐링',
      'likes': '♥ 128',
    },
    {
      'author': '준호',
      'destination': '제주',
      'title': '액티비티 + 맛집 알찬 코스',
      'summary': '성산일출봉 → 흑돼지 → 카약 → 야시장',
      'tags': '액티비티,맛집,자연',
      'likes': '♥ 96',
    },
    {
      'author': '수연',
      'destination': '부산',
      'title': '감성 사진 스팟 여행',
      'summary': '감천문화마을 → 흰여울문화마을 → 광안리 야경',
      'tags': '사진,감성,야경',
      'likes': '♥ 74',
    },
  ];
}
